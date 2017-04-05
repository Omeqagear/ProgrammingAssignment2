## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  
  #Set the value of the "special" matrix
  setMatrix<- function(y){
    y <<-x
    m <<-NULL
  }
  
  #Return the vaue that we set for aur matrix
  getMatrix <- function() x
  
  cacheInverse(solve){
    m <<- solve
  }
  
  getInverse<- function() m
  
  # return a list. Each named element of the list is a function
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  # get the cached value
  inverse <- x$getInverse()
  # if a cached value exists return it
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  # otherwise get the matrix, caculate the inverse and store it in
  # the cache
  data <- x$getMatrix()
  inverse <- solve(data, ...)
  x$cacheInverse(inverse)
  
  # return the inverse
  inverse
}
