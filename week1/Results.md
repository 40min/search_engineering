# Indexing the Best Buy Data

with 8 workers, 
refresh_interval of -1 
maximum number of docs sent per file per worker of 200000 
200 per batch.

#### Short set of fields

* with mapping

1275077 were indexed in 1.356643622686776 minutes.  
Total accumulated time spent in `bulk` indexing: 6.760124576076245 minutes

* without mapping

1275077 were indexed in 1.1308657261775807 minutes.  
Total accumulated time spent in `bulk` indexing: 4.8298620592492325 minutes


#### Full set of fields

* with mapping

1275077 were indexed in 4.109547324478626 minutes.
Total accumulated time spent in `bulk` indexing: 11.838896024522061 minutes

* without mapping

 1275077 were indexed in 4.3241456143480415 minutes.  
 Total accumulated time spent in `bulk` indexing: 12.30964058151003 minutes


#### With changed refresh_interval

* -1

1275077 were indexed in 4.301063585467636 minutes.  Total accumulated time spent in `bulk` indexing: 12.18318578331576 minutes

* 1s

1275077 were indexed in 4.152657688168499 minutes.  Total accumulated time spent in `bulk` indexing: 12.503036398588058 minutes

* 60s

 1275077 were indexed in 4.050621016517592 minutes.  Total accumulated time spent in `bulk` indexing: 11.554195471977193 minutes
(venv) (⎈ |


#### With batches

* 400
 
1275077 were indexed in 4.22582618255013 minutes.  
Total accumulated time spent in `bulk` indexing: 11.630031492235139 minutes

* 800

1275077 were indexed in 4.068895987266054 minutes.  
Total accumulated time spent in `bulk` indexing: 11.141778177527401 minutes

* 1600

1275077 were indexed in 3.9275128323119133 minutes.  
Total accumulated time spent in `bulk` indexing: 10.569625256683988 minutes

* 3200

1275077 were indexed in 3.8190528482043495 minutes.  
Total accumulated time spent in `bulk` indexing: 10.506789349818913 minutes

* 5000

* INFO:Done. 1275077 were indexed in 3.9231057370857645 minutes.  
Total accumulated time spent in `bulk` indexing: 10.66019919878648 minutes

#### With workers

* 8

 1275077 were indexed in 3.937260254332796 minutes.  
 Total accumulated time spent in `bulk` indexing: 10.978032392123714 minutes

* 16

1275077 were indexed in 3.7921701032513133 minutes.  
Total accumulated time spent in `bulk` indexing: 25.532972411632848 minutes

* 32

1275077 were indexed in 3.7765234765053415 minutes.  
Total accumulated time spent in `bulk` indexing: 81.72802496740285 minutes

* 64

 1275077 were indexed in 5.198843360684502 minutes.  
 Total accumulated time spent in `bulk` indexing: 233.81463714085984 minutes


# Querying the Best Buy Data

max_queries 10000

* baseline

Finished running 10000 queries in 2.7608590279861045 minutes

* Change the name matching field to no longer be a fuzzy match.

Finished running 10000 queries in 2.2836704531839738 minutes

* Drop the function scores

Finished running 10000 queries in 1.7094613294815644 minutes

* Drop every other matching function except the multi_match

Finished running 10000 queries in 1.3098624704017614 minutes

* Change the multi_match to only search the name and shortDescription field.

Finished running 10000 queries in 0.9686123836785555 minutes
