.DEFAULT_GOAL := start
HOST := localhost
BBUY_DATA := $(shell pwd)/datasets/products
QUERY_FILE := $(shell pwd)/datasets/train.csv

.PHONY: start
start:
	docker-compose -f ./docker/docker-compose-w1.yml up -d

.PHONY: del_index
del_index:
	curl -k -X DELETE -u admin:admin https://$(HOST):9200/bbuy_products

.PHONY: create_index
create_index:
	curl -k -X PUT -u admin:admin "https://$(HOST):9200/bbuy_products" -H 'Content-Type: application/json' -d @./week3/bbuy_products.json


.PHONY: create_index_guessed_mapping
create_index_guessed_mapping:
	curl -k -X PUT -u admin:admin "https://$(HOST):9200/bbuy_products" -H 'Content-Type: application/json' -d @./week1/bbuy_products_no_map.json

.PHONY: index_content
index_content:
	python week3/index.py -s $(BBUY_DATA) --workers 8 -b 500


.PHONY: run_query
run_query:
	python week3/query.py -q $(QUERY_FILE) -m 25000 -w 16


.PHONY: restart_os
restart_os:
	docker compose -f docker/docker-compose-w3.yml stop opensearch-node1
	docker compose -f docker/docker-compose-w3.yml up opensearch-node1 -d
	docker exec -t opensearch-node1 ./bin/opensearch-plugin install "https://github.com/aiven/prometheus-exporter-plugin-for-opensearch/releases/download/2.6.0.0/prometheus-exporter-2.6.0.0.zip"
	docker compose -f docker/docker-compose-w3.yml restart opensearch-node1


.PHONY: start_os
start_os:
	docker compose -f docker/docker-compose-w3.yml up -d


.PHONY: start_monitoring
start_monitoring:
	docker compose -f docker-grafana/monitoring.yml up -d


.PHONY: reindex_content
reindex_content: del_index create_index index_content
