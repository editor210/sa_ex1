#get the AirPassengers dataset from python and transform the data into a df
library(tidyverse)

data <- AirPassengers

data_transform <- function(data, by_year = FALSE){
                                  data <- as.data.frame(as.integer(data))
                                  colnames(data) <- "Passengers"
                                  data <- data %>% mutate(Year = rep(seq(1949,1960), each = 12),
                                                          Month = rep(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), 12))
                                  #Rearranging the columns
                                  data <- data[c("Year", "Month", "Passengers")]
                                  
                                  if (by_year == TRUE){
                                    data <- data %>% group_by(Year) %>% summarise(Passengers = sum(Passengers))
                                  }
  
  return(data)
}

data2 <- data_transform(data, by_year = TRUE)
