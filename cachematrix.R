## These two functions create a matrix and a list of functions, calculate the inverse of the matrix, cache it, and return its value.

## The first function creates a matrix and a list of functions to be used by the second function. The object created with it also stores
## the inverse of the matrix, calculated when the second function is run for the first time.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
	set <- function(z) {
                x <<- z
                i <<- NULL
        }
	get <- function() x
	setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The second function looks for the inverse of the matrix on the environment. On the first time it's run, i is NULL and the inverse of the
## matrix is calculated and returned. From the second time on, it simply gets the inverse from the environment and returns it.

cacheSolve <- function(y) {
        i <- y$getinverse()
        if(!is.null(i)) {
                message("Getting cached data")
                return(i)
        }
	matrix <- y$get()
        i <- solve(matrix)
        y$setinverse(i)
	return(i)
}
