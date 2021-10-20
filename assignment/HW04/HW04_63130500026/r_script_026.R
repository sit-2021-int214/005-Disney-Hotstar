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
