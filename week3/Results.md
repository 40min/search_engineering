# Level 1

### Q1: Which node was elected as cluster manager?

opensearch-node2

I've mistakenly stop node1 and node2 was elected before I've started it back

### Q2: After stopping the previous cluster manager, which node was elected the new cluster manager?

opensearch-node3

### Q3: Did the cluster manager node change again? (was a different node elected as cluster manager when you started the node back up?)

No, it didn't change.
I suppose all master eligible nodes are equal and there is no point to 
run election again.

# Level 2

### Reindexing with 3 primary shards and 2 replicas

1275077 were indexed in 10.91954674910133 minutes.  
Total accumulated time spent in `bulk` indexing: 63.32589014170226 minutes

### Reindexing with 3 primary shards and no replicas

1275077 were indexed in 7.603451289950559 minutes.  
Total accumulated time spent in `bulk` indexing: 34.520167174182525 minutes

### Q4: How much faster was it to index the dataset with 0 replicas versus the previous time with 2 replica shards?

Roughly 1.5 times faster

### Q5: Why was it faster?

No need to wait until the data will be indexed on all replicas.
The indexing happens on primary first, then on replicas concurrently.
Plus less resources spent on indexing (as we use a single physical 
machine we have limited amount of CPU/Memory)


### Q6: How long did it take to create the new replica shards?

23s

### Q7: Those two messages were both logged by the cluster_manager. Why do you think the cluster manager is the node that logs these actions

Because cluster manager is responsible for cluster state.
Adding new replica shards is a part of cluster state change.


# Level 3

Run a query load:

Q: Looking at the metrics dashboard, what queries/sec rate are you getting?
* -m 25000 -w 4: ~ 150 queries/sec for each node
* -m 25000 -w 8: ~  156 queries/sec for each node
* * -m 25000 -w 16: ~  156 queries/sec for each node

  

Q: How does that compare to the max queries/sec rate you saw in week 2?

A: Maximum queries/sec rate for the 2nd week was 187 but we used only one node.
This week we have 3 nodes and the total queries/sec rate is 468.


# Level 4

Shrink was done for a couple of minutes.

It added "resize" section in settings.
```javascript
"resize": {
    "source": {
	"name": "bbuy_products",
	"uuid": "UsMEpUoMTxGeoLt1DvPipA"
	}
}
```

Also it is worth to mention that newly created index also created with
`"index.blocks.write": false` setting. So it's better to not forget to flip the flag.
