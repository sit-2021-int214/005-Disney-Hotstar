# Student ID : 63130500001
# Install Packet and Dataset
#Library
library(dplyr)
library(assertive)
library(readr)
library(stringr)

#Import Dataset
sat <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")


# Explore
View(sat)
View(sat_score)
is_numeric(sat$math_score)
is_numeric(sat$writing_score)
is_numeric(sat$reading_score)

# 1.How many observation of this Dataset (before cleaning) ?
glimpse(sat)
# 485 observation(row)
# 1.1 Changing the types of values
sat$math_score <- replace(sat$math_score,is.na(sat$math_score),200) %>% as.numeric()
sat$writing_score <- replace(sat$writing_score,is.na(sat$writing_score),200) %>% as.numeric()
sat$reading_score <- replace(sat$reading_score,is.na(sat$reading_score),200) %>% as.numeric()
sat$reading_score <- replace(sat$reading_score,sat$reading_score>800,800)
sat$writing_score <- replace(sat$writing_score,sat$writing_score>800,800)
# 2.Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
sat %>% filter(duplicated(sat))
# 3.How many distinct school in this dataset ? (Know after drop duplicate data)
sat_score <- sat %>% distinct()

# 4.What is min, max, average, quartile of each part in SAT ?
# 4.1 math_score
sat_score  %>% summarise(min_math_score = min(math_score))
sat_score  %>% summarise(max_math_score = max(math_score))
sat_score  %>% summarise(avg_math_score = mean(math_score))
quantile(sat_score$math_score)
# 4.2 reading_score
sat_score %>% summarise(min_reading_score = min(reading_score))
sat_score %>% summarise(max_math_score = max(reading_score))
sat_score %>% summarise(avg_reading_score = mean(reading_score))
quantile(sat_score$reading_score)
# 4.3 writing_score
sat_score %>% summarise(min_writing_score = min(writing_score))
sat_score %>% summarise(max_writing_score = max(writing_score))
sat_score %>% summarise(avg_writing_score = mean(writing_score))
quantile(sat_score$writing_score)
# 5.What is min, max, average, quartile of total score in SAT ?
sat_score <- sat_score %>% mutate(total_score=math_score+reading_score+writing_score)

# 6.Which school is get highest SAT score ?
sat_score %>% filter(total_score == max(total_score))

