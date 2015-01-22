## This fuction attempts to cache content that it time-consuming to compute so that it can be reused without
## incurring the time penalty to recompute a value.

## makeCacheMatrix function
## Creates a matrix to contain the cached data.

makeCacheMatrix <- function(x = matrix()) {
  matrix <- NULL
  get <- function () x
  setInverseMatrix <- function (inverse) matrix <<- inverse
  getInverseMatrix <- function() matrix
  
  list (get = get, setInverseMatrix = setInverseMatrix, getInverseMatrix = getInverseMatrix)
}

## cacheSolve function
## This function checks to see if the content already exists and if it does, the function exits.  If not, it will
## be stored in a matrix.

cacheSolve <- function(x) {
  matrix <- x$getInverseMatrix()
  if(!is.null(matrix)){
    message("Cached data found.")
    return(matrix)
  }
  else {
    message("No cached data found")
    data <- x$get() 
    matrix <- solve(data)
    x$setInverseMatrix(matrix)
    message("Loading of Inverse Matrix Complete.")
    return(m)
  }
}
