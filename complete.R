complete <- function(directory, id = 1:332){
                
        cwd <- getwd()
        setwd(directory)
        cobs <- data.frame()
        
        # read in files
        specdatafiles <- list.files(path = ".")
                
        for (i in id) {
                specdata <- read.csv(specdatafiles[i])
                numofobs <- nrow(specdata)
                cobs_count <- 0
                
                # count number of complete observations in a monitor
                for (j in 1:numofobs){
                        if ((is.na(specdata[[2]][[j]]) == FALSE) && (is.na(specdata[[3]][[j]]) == FALSE))  cobs_count <- cobs_count + 1
                }
                
                # Construct a data frame to store monitor ID and NOBS
                cobs <- rbind(cobs, c(i, cobs_count)) 
        }
        setwd(cwd)
        names(cobs) <- c("id", "nobs")
        cobs
}