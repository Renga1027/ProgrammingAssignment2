## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##makeCacheMatrix takes a matrix object as an argument
library(MASS)
makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y) {
x <<- y
inv <<- NULL
}
get <- function() x
setInverse <- function(inverse) inv <<- inverse
getInverse <- function() {
inver<-ginv(x)
inver%*%x
}
list(set = set,                                         ##Set the value of matrix
get = get,                                              ##Get the value of matrix
setInverse = setInverse,                                ##Set the value of inverse of the matrix
getInverse = getInverse)                                ##Get the value of inverse of the matrix
}


## Write a short comment describing this function
##cacheSolve computes the inverse of the matrix
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
inv <- x$getInverse()
if(!is.null(inv)) {                          ##Checks if inverse has already not been calculated 
message("getting Inversed Matrix")
return(inv)
}
data <- x$get()
inv <- solve(data, ...)                      ##if inverse has been calculated we retrieve it
x$setInverse(inv)
inv

        
}
