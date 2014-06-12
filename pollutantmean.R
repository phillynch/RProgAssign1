pollutantmean <- function(directory, pollutant, id = 1:332) {
  ext <- ".csv"
  mydata <- data.frame()
  prefix <- ""
  column <- 0
  if (pollutant == "sulfate") {
  column <- 2
  }
  if (pollutant == "nitrate") {
    column <- 3
  }
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
      mydata <- rbind (mydata ,read.csv (file = getdata, header=TRUE)) 
    } 
  clean <- (mydata [column])
  cleanrs <- is.na (clean)
  print (mean (clean [!cleanrs],))
}

