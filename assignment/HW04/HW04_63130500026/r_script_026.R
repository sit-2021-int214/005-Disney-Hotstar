install.packages("tidyverse")

# Library
library(tidyverse)
library(ggplot2)

# Data 
data <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")


data %>% as_tibble()

## 3.1 
data %>% glimpse()

## 3.2 
data$Rating %>% max()
data$Rating %>% min()
data$Rating %>% mean()

## 3.3
data$Reviews %>% max()
data$Reviews %>% min()
data$Reviews %>% mean()

## 3.4 
data$Type %>% as.factor() %>% glimpse()

## 3.5 
data %>% filter(Price > 200) %>% glimpse()


## 4

## 4.1
rating_plot <- ggplot(data,aes(x=Price,y=Rating)) + geom_point()
rating_plot + ggtitle("Number of rating compared to price") + geom_point(aes(color = Type))


## 4.2 

review_plot <- data %>% filter(Reviews < 2000) %>% ggplot(aes(x=Price)) + geom_histogram(binwidth = 10, bins = 10)
review_plot + ggtitle("Count of Price ") + ylab("Count")
