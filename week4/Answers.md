# Level 1: Set up two (2) small clusters with cross-cluster replication

### Indexing all the Best Buy data and it being replicated to the second cluster

Indices on leader
![indices_on_leader.png](screenshots%2Findices_on_leader.png)
Indices on follower
![indices_on_follower.png](screenshots%2Findices_on_follower.png)
Indexing/replication process
![indexing_replication.png](screenshots%2Findexing_replication.png)


### Searching using the query logs across cluster 1 and cluster 2 separately

Searching on leader
![search_on_leader.png](screenshots%2Fsearch_on_leader.png)

Searching on follower
![search_on_follower.png](screenshots%2Fsearch_on_follower.png)

### Your Grafana dashboard showing both Step A and Step B happening

Shards and CPUs state
![Shards&CPUs.png](screenshots%2FShards%26CPUs.png)

Search on both clusters
![search_on_both_clusters.png](screenshots%2Fsearch_on_both_clusters.png)


# (Optional) Level 2: Implement indexing and searching backpressure

Both settings was enabled but it was impossible to catch any "pressure" 
om local machine

### Indexing backpressure
![indexing_backpressure.png](screenshots%2Findexing_backpressure.png)
### Searching backpressure
![search_backpressure.png](screenshots%2Fsearch_backpressure.png)