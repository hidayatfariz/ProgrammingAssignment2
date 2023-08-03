## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        #initialize cache
        cache <- NULL
        # Function to set the matrix and invalidate the cache
        set <- function(matrix) {
                input_matrix <<- matrix
                cache$inverse <<- NULL }
        # Function to get the matrix
        get <- function() {
                input_matrix }
        # Function to compute and cache the inverse
        getInverse <- function() {
                if (!is.null(cache$inverse)) {
                        message("Getting cached inverse")
                        return(cache$inverse) } 
                else {
                        message("Calculating inverse")
                        cache$inverse <- solve(input_matrix)
                        return(cache$inverse)}
                }
        # Initialize the cache list
        cache <- list(set = set, get = get, getInverse = getInverse)
        
        # Return the cache list
        cache
                
}


## Write a short comment describing this function

cacheSolve <- function(cache_matrix) {
        ## Return a matrix that is the inverse of 'x'
        if (!is.null(cache_matrix$cache$inverse)) {
                message("Using cached inverse")
                return(cache_matrix$cache$inverse) }
        else {
                # Calculate the inverse and cache it
                message("Calculating inverse")
                inverse <- solve(cache_matrix$get())
                cache_matrix$cache$inverse <- inverse
                return(inverse) }
  }
