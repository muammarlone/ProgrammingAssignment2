## Framework to create square matrix / getters & setters functions


##  `makeCacheMatrix`: This function creates a special "matrix" object
##   that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

## On first time invocation, inverse is not picked from memory and is computed
        inverse = NULL
        set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
      
	get <- function() x
        
	
## provide functions to set inverse & get inverse in free variables that might be accessible across envrionments
	
	setinv <- function(inv) inverse <<- inv
        getinv <- function() inverse
        
## Construct a list 
	list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## Check if object is already in memory use it or else use solve to calculate the inverse of the matrix
## From Matrix Algebra the definition of Inverse of a Matrix is A * A^-1 = I (invoulatory Matrix). 

##  `cacheSolve`: This function computes the inverse of the special
##   "matrix" returned by `makeCacheMatrix` above. If the inverse has
##   already been calculated (and the matrix has not changed), then the
##   `cachesolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinv()
      
	## if inverse already is cached it will not be null and cached matrix can be leveraged
	if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$get()

        ## Solve is a function in R that helps to compute inverse of a square matrix

        inverse <- solve(data,...)
	
	## cacheMatrix for future reuse purposes
        x$setinv(inverse)
        inverse
}
