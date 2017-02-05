## Put comments here that give an overall description of what your
## functions do

##This function creates the matrix and invokes setters/getters on inverse attribue which are calculated by the cacheSolve function. if the matrix changes, then the nverse is set to NULL.

makeCacheMatrix <- function(x = matrix()) {
invr <- NULL
set <- function(y) {
  x <<- y
  invr <<- NULL
}
get <- function() x
setinverse <- function(inverse) invr <<- inverse
getinverse <- function() invr
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)}


## The function will check if the inverse is already calculated with the NULL test. If if is, it will return the value by calling getinverse function. If the value does not exist then it will calculate the inverse, set the value in the environment and then retun the inverse value

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invr1 <- x$getinverse()
  if(!is.null(invr1)) {
    print("getting cached data")
    return(invr1)
  }
  #invese does not exist so calculate it now
  data <- x$get()
  invr1 <- solve(data, ...)
  ####set in data for subsequent calls when unchanged
  x$setinverse(invr1)
  invr1
}

