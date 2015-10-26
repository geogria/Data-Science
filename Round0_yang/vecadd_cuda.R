

vecadd_R_cuda <- function(a, b){
	length = length(a)
	if(!is.loaded("vecadd_cuda")) {
    	dyn.load("vecadd_R.so")
  	}
  	c = rep(0, length)
  	out <- .C("vecadd_cuda", as.double(a),as.double(b),as.double(c) , as.integer(length))
  	return(out[[3]])
}

vecadd_R <-function(a,b){
	#assume we can't use the built-in R function for adding to vectors
	out = numeric(length(a))
	for(i in 1:length(a)){
		out[i] = a[i] +b[i]
	}
}

library(rbenchmark)
a = runif(1e7)
b = runif(1e7)

benchmark(vecadd_R(a,b), vecadd_R_cuda(a,b))