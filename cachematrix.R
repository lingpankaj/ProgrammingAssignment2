
# Fork the repository as directed in the guidelines. 
# Testing is not part of evaluation.
makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y y # sets the value of m to NULL (provides a default if cacheSolve has not yet been used)
    m<<-NULL # sets the value of y to NULL (provides a default if cacheSolve has not yet been used)
  }
  get<-function() x
  setmatrix<-function(solve) m<<- solve
  getmatrix<-function() m
  list(set=set, get=get, # creates a list to house the four functions
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}

cacheSolve <- function(x=matrix(), ...) {      #Need to compare matrix to what was there before!
  m<-x$getmatrix()   # run the getmatrix function to get the value of the input matrix
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix <- x$get() 
  m<-solve(matrix, ...)
  x$setmatrix(m)  #run the setmatrix function on the input matrix to cache it
  m
}
