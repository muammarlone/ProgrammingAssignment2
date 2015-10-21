## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Framework to create square matrix / getters & setters functions
makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get <- function() x
        setinv <- function(inv) inverse <<- inv
        getinv <- function() inverse
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## Write a short comment describing this function
## Check if object is already in memory use it or else use solve to calculate the inverse of the matrix
## From Matrix Algebra the definition of Inverse of a Matrix is A * A^-1 = I (invoulatory Matrix). 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinv()
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$get()
        inverse <- solve(data, ...)
        x$setinv(inverse)
        invserse
}
