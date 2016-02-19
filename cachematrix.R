# The funtion 'makeCacheMatrix' takes a matrix in the current environement 
# and assigns it into another environmet for storage
# Assigns  the input ot a new environemt
# Sets an inverse of a matrix m
# Gets the inverse of that matrix
# Creates a list all the above created variables to be used by the next function
makeCacheMatrix <- function(x= matrix()){
       m <- NULL
        set <- function(y = matrix()) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m  <<- solve
        getinverse <- function() m
        list(get=get, set = set, getinverse = getinverse, setinverse = setinverse)
}
## Function 'cacheSolve' gets an inverse of a matirx 'x$getinverse' from a list if it exists if not, 
## Calculates the inverse 'inverse2' from the new matix supplied
cacheSolve <- function(x = matrix()) {
                m <- x$getinverse()
                if (!is.null(m)) {
                message("This is a cached matrix result")
                return(m)
        } 
                inverse2 <- x$get()
                m <- solve(inverse2)
                x$setinverse(m)
## Return a matrix that is the inverse of 'x'  
                m
}