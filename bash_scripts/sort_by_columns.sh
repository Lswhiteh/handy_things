# Sorts by first two columns in a bed file (necessary for merge, etc)
sort -k1,1 -k2,2n in.bed > in.sorted.bed
