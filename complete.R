complete <- function(directory, id = 1:332) {
  
  ext <- ".csv"
  mydata <- data.frame()
  prefix <- ""
  
  
  for (i in id) {
    if (i <= 9) {
      prefix <- "00"
    }
    else if (i >= 10 & i <= 99) {
      prefix <- "0" 
    } 
    else  {  
      prefix <- ""
    }
  
    getdata <- paste0(directory, "/", prefix, i, ext, sep="")
    testcase <- read.csv (file = getdata)
    result <- complete.cases (testcase)
    result1 <- nrow (testcase [result,]) 
    output <- c(i,result1)
    mydata <- rbind (mydata, (output))
    
  }
  names (mydata) <- c("id", "nobs")
  print (mydata)
  
}