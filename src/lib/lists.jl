# Return the n-th item of `a`. e.g. `per(a,.5)` returns median.
per(a, n) = begin l=length(a); a[max(1,min(l,1 + trunc(Int,n*l)))] end 

