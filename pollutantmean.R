pollutantmean <- function(directory, pollutant, id = 1:332){
        
        if (pollutant == "sulfate"){
                arg <- 2
        } else { arg <- 3 }

        cwd <- getwd()
        setwd(directory)

        specdatafiles <- list.files(path = ".")
       
        tnumofelements <- 0
        total <- 0
        
        for (i in id) {
               specdata <- read.csv(specdatafiles[i])
               
               numofelements <- nrow(specdata)
               actualelements <- 0
               na_count <- 0
               for (j in 1:numofelements){
                       if (is.na(specdata[[arg]][[j]] == TRUE)) na_count <- na_count + 1
               }
               actualelements <- numofelements - na_count
               tnumofelements <- tnumofelements + actualelements
               
               
              rsum <- 0
              rsum <- sum(specdata[[arg]], na.rm = TRUE)
              total <- total + rsum
               
        }
        setwd(cwd)
        
        total / tnumofelements
}