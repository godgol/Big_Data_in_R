
library(data.table)

input <- "https://raw.githubusercontent.com/Rdatatable/data.table/master/vignettes/flights14.csv"
data <- fread(input)

head(data)
