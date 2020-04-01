# Locality-based cache hit rate
I looked at how cache hit rates are different when one array is referenced by a column (i) and a row (j). <br>

# Result
* row_based.asm <br>
Worst hit rate : 33% <br>
Best hit rate : 92% <br>

<div><img src="image/fast1.jpg" width="400" height="400"><img src="image/fast2.jpg" width="400" height="400"></div>

* column_based.asm <br>
Worst hit rate : 33% <br>
Best hit rate : 42% <br>

<div><img src="image/slow1.jpg" width="400" height="400"><img src="image/slow2.jpg" width="400" height="400"></div>
