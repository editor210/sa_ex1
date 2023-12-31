#get the AirPassengers dataset from python and transform the data into a df
library(tidyverse)

data <- AirPassengers

data_transform <- function(data, by_year = FALSE){

                                  #transforming the data variable into a dataframe
                                  #and the values as integers
                                  data <- as.data.frame(as.integer(data))
                                  
                                  #Assigning the name of the column
                                  colnames(data) <- "Passengers"
                                  #Including the Years and Months columns
                                  data <- data %>% mutate(Year = rep(seq(1949,1960), each = 12),
                                                          Month = rep(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), 12))
                                  
                                  #Rearranging the columns to make it more readable
                                  data <- data[c("Year", "Month", "Passengers")]
                                  
                                  #Including the change of the second argument
                                  if (by_year == TRUE){
                                    data <- data %>% group_by(Year) %>% summarise(Passengers = sum(Passengers))
                                  }
  
  return(data)
}
