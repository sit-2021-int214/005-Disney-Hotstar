# Student_ID : 63130500026

# Step 2 Load Library and Dataset
### 2.1 Import library

# Library
library(dplyr)
library(assertive)
library(readr)
library(stringr)

### 2.2 Import dataset

# Dataset
data <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")

# Change type of math_score to numberic
data$math_score <- data$math_score %>% as.numeric() 

# Change type of reading_score to numberic
data$reading_score <- data$reading_score %>% as.numeric()

# Change type of writing_score to numberic
data$writing_score <- data$writing_score %>% as.numeric()


## Step 3 : Check all the observation and variables
glimpse(data)

## Step 4 :  Check duplicated items and list if have.
### 4.1 Find duplicated
data %>% duplicated() %>% table()

### 4.2 List the duplicated data
data %>% filter(duplicated(sat_score))

## Step 5 : Count a data that are different.
### 5.1 delete a duplicated items
data <- data %>% distinct()

### 5.2 Count a row
data %>% glimpse()

## Step 6 : Find min, max, average and quartile of each part.
### 6.1 map data into a scope of SAT score (From 200 to 800);
data <- data %>% filter(.data$math_score >= 200 & .data$math_score <= 800)
data <- data %>% filter(.data$reading_score >= 200 & .data$reading_score <= 800)
data <- data %>% filter(.data$writing_score >= 200 & .data$writing_score <= 800)

View(data)

### 6.2 Find min, max, average and quartile of math score
data %>% summarise(max_math = max(data$math_score))
data %>% summarise(min_math = min(data$math_score))
data %>% summarise(avg_math = mean(data$math_score))
data$math_score %>% quantile()

## Step 7 : Find min, max, average and quartile of total score
### 7.1 Create new column called `total_score` and assign to old parameter
data <- data %>% mutate(total_score = math_score+reading_score+writing_score)

### 7.2 Find min, max, average and quartile of total score
data %>% summarise(max_score = max(total_score))
data %>% summarise(min_score = min(total_score))
data %>% summarise(avg_score = mean(total_score))
data$total_score %>% quantile()

## Step 8 : Find a school that has the highest SAT score.
data %>% select(school_name, total_score) %>% arrange(desc(total_score))
