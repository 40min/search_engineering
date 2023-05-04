# Indexing 

* 1st -w 16 -b 500 

 1275077 were indexed in 9.678149882347013 minutes.  
 Total accumulated time spent in `bulk` indexing: 131.13545281228144 minutes

![Baseline](img%2FScreenshot%202023-05-02%20at%2016.46.03.png)


* 2nd -w 16 -b 500 

 1275077 were indexed in 9.616970113486362 minutes.  
 Total accumulated time spent in `bulk` indexing: 130.09983673971146 minutes

 Interesting, but for me it wasn't doubled in size of docs
 
![Screenshot 2023-05-02 at 16.57.09.png](img%2FScreenshot%202023-05-02%20at%2016.57.09.png)

Indexing rate is around 2.5k docs/sec

# Querying (default settings)

-w 4 -m 25000

queries/sec rate: 60 
![Screenshot 2023-05-02 at 17.21.13.png](img%2FScreenshot%202023-05-02%20at%2017.21.13.png)

bottlenecks are memory and cpu
![Screenshot 2023-05-02 at 17.22.00.png](img%2FScreenshot%202023-05-02%20at%2017.22.00.png)


# With adding of resources

### 2 cpu

Indexing rate: 4.47k docs/sec
queries/sec rate: 149


### 4 cpu

Indexing rate: 4.43k docs/sec
queries/sec rate: 187

### memory 4gb and heap size 2gb

Indexing rate:  5.36k docs/sec
queries/sec rate: 169

### memory 8gb and heap size 4gb

Indexing rate:  5.65K docs/sec
queries/sec rate: 164

### 4 cpu & memory 8gb and heap size 4gb

Indexing rate: 5.34K docs/sec
queries/sec rate: 173


# Indexing and querying at the same time

Taken config: 4 cpu & memory 8gb and heap size 4gb

Indexing rate: 3.5K docs/sec
queries/sec rate: 160