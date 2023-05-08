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
	curl -k -X PUT -u admin:admin "https://$(HOST):9200/bbuy_products" -H 'Content-Type: application/json' -d @./week1/bbuy_products.json


.PHONY: create_index_guessed_mapping
create_index_guessed_mapping:
	curl -k -X PUT -u admin:admin "https://$(HOST):9200/bbuy_products" -H 'Content-Type: application/json' -d @./week1/bbuy_products_no_map.json

.PHONY: index_content
index_content:
	python week2/index.py -s $(BBUY_DATA) --workers 16 -b 500


.PHONY: run_query
run_query:
	python week2/query.py -q $(QUERY_FILE) -m 10000 -w 4


.PHONY: restart_os
restart_os:
	docker compose -f docker/docker-compose-w2.yml stop opensearch-node1
	docker compose -f docker/docker-compose-w2.yml up opensearch-node1 -d
	docker exec -t opensearch-node1 ./bin/opensearch-plugin install "https://github.com/aiven/prometheus-exporter-plugin-for-opensearch/releases/download/2.6.0.0/prometheus-exporter-2.6.0.0.zip"
	docker compose -f docker/docker-compose-w2.yml restart opensearch-node1


.PHONY: reindex_content
reindex_content: del_index create_index index_content
