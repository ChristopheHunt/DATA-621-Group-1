library(data.table)
library(tidyverse)

iowa_data <- fread("Iowa_Liquor_Sales.csv", header = T, sep = ',')

removeDollars <- function(column){
  as.numeric(gsub("\\,","",gsub("\\$","", column)))
}

iowa_data_reduced <- iowa_data %>%
                     dplyr::select(Date, City, County, `Category Name`, 
                            `Item Number`, `Item Description`, 
                            `Bottles Sold`, `Sale (Dollars)`, `Volume Sold (Gallons)`) %>%
                    mutate(Date = as.Date(Date, format = "%m/%d/%Y"),
                           City = factor(City),
                           County = factor(County),
                           `Item Number` = factor(`Item Number`),
                           `Item Description` = factor(`Item Description`),
                           `Sale (Dollars)` = removeDollars(`Sale (Dollars)`)) %>%
                    mutate(Month = format(Date, "%m"),
                           Year = format(Date, "%Y")) %>%
                    dplyr::select(-Date, -`Item Number`, -`Item Description`) %>%
                    group_by(Month, Year, City, County, `Category Name`)  %>%
                    summarize(`Bottles Sold` = sum(`Bottles Sold`), 
                              `Sale (Dollars)` = sum(`Sale (Dollars)`), 
                              `Volume Sold (Gallons)` = sum(`Volume Sold (Gallons)`)) %>%
                    as_tibble()

test <- iowa_data_reduced %>%
        dplyr::ungroup() %>%
        mutate(Month = as.numeric(Month),
               Year = as.numeric(Year),
               `Category Name`= factor(`Category Name`)) %>%
        arrange(Year, Month, County, City)

write.csv(test, "iowa_data_reduced.csv")



