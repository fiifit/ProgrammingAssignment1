corr <- function(directory, threshold = 0){
        
        cwd <- getwd()
        setwd(directory)
        numcobs <- data.frame()
        
        # Data frame holding counts of completed observations
        numcobs <- complete(".")
        
        # Data frame holding subset of counts of completed observations
        tcobs <- subset(numcobs, nobs > threshold)
        
        # file construction
        trfile <- vector()
        for (i in tcobs$id) {
                if ( i < 10 ) {
                        trfile <- c(trfile, paste("00", as.character(i), ".csv", sep = ""))
                } else if (i >= 10 && i < 100 ) {
                        trfile <- c(trfile, paste("0", as.character(i), ".csv", sep = ""))
                } else {
                        trfile <- c(trfile, paste(as.character(i), ".csv", sep = ""))
                }
        }

        
       # Calculate correlation between nitrate & sulfate. Construct vector
        cr <- vector()
        for (j in trfile) {
                trcobs <- read.csv(j)
                cr <- c(cr, cor(trcobs[[2]], trcobs[[3]], use = "complete.obs"))
        }
        
      setwd(cwd)
        
      cr
}
