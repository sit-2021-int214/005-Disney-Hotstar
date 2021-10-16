data <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/005-Disney-Hotstar/main/disney_plus_shows.csv")
View(data)

# Library
library(dplyr)
library(assertive)
library(readr)
library(stringr)

# Change Every empty string in dataset to NA.
data <- data %>% na_if(.,"") %>% na_if(.,"N/A")

# Change type of type into factor
data$type <- data$type %>% as.factor()

# Change typer of rated into factor
data$rated <- data$rated %>% as.factor()

# Delete extra character out and trim the space out, then change type to numeric and rename to "runtime (min)"
data$runtime <- data$runtime %>% str_remove("min") %>% str_trim() %>% as.numeric()
names(data)[8] <- 'runtime_min'

data$rated %>% table()



