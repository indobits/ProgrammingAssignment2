## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  # set s as null
  s <- NULL
  # create "set" function
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  # create get function
  get <- function() x
  #create setsolve function
  setsolve <- function(solve) s <<- solve
  # create getsolve function
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  # call x$getsolve
  s <- x$getsolve()
  # verify s is null
  if(!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  # call x$setsolve
  x$setsolve(s)
  s
}