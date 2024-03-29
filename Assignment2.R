## Caching the Inverse of a Matrix:
## 
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  # Initialize the inverse property
  inv <- NULL
  # Method to set the matrix y      
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  # Method the get the matrix
  get <- function() x # Return the matrix
  # Method to set the inverse of the matrix
  setInverse <- function(solveMatrix) inv <<- solveMatrix
  # Method to get the inverse of the matrix
  getInverse <- function() inv # Return the inverse property
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse) # Return a list of the methods
}

## This follow function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  #  Just return the inverse if its already set
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  # Get the matrix from our object
  data <- x$get()
  # Calculate the inverse of the matrix 
  inv <- solve(data)
  # Set the inverse to the object
  x$setInverse(inv)
  inv   # Return the matrix   
}
