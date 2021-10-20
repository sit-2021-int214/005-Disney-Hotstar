data <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/005-Disney-Hotstar/main/disney_plus_shows.csv")


# Library
library(dplyr)
library(assertive)
library(readr)
library(stringr)

# Change Every empty string in dataset to NA.
data <- data %>% na_if(.,"") %>% na_if(.,"N/A")

# Change type of type into factor
data$type <- data$type %>% as.factor()

# Change type of rated into factor
data$rated <- data$rated %>% str_trim() %>% as.factor()

# Change 'APPROVED' to 'Approved' in rated
data$rated <- data$rated %>% str_replace("APPROVED", "Approved")

# Change 'NOT RATED' to 'Not Rated' in rated
data$rated <- data$rated %>% str_replace("NOT RATED" , "Not Rated")

# Change 'PASSED' to 'Passed' in rated
data$rated <- data$rated %>% str_replace("PASSED" , "Passed")

# Change 'UNRATED' to 'Unrated' in rated
data$rated <- data$rated %>% str_replace("UNRATED" , "Unrated")

#Change type of metascore to numeric
data$metascore <- data$metascore %>% as.numeric()

#Change type of imdb_votes to numeric
data$imdb_votes <- data$imdb_votes %>% as.numeric()

#Change type of rating to numeric
data$imdb_rating <- data$imdb_rating %>% as.numeric()

# Delete extra character out and trim the space out, then change type to numeric and rename to "runtime (min)"
data$runtime <- data$runtime %>% str_remove("min") %>% str_trim() %>% as.numeric()
names(data)[9] <- 'runtime_min'

View(data)
##------------------------------------------------------------------------------

## 3. List a film that is a episode
data %>% select('Film ID' = imdb_id,'Film title' = title,type) %>% filter(type == "episode")

## 4.Find average rumtime of movie
movies <- data %>% select(imdb_id,title,type,runtime_min) %>% filter(type == "movie")

movies$runtime_min %>% mean(.,na.rm = TRUE)


## 5
movies_director <- data %>% select(imdb_id,title,type,director) %>% filter(type == "movie")
movies_director %>% filter(director == "Anthony Russo, Joe Russo") %>% glimpse()

## 6

data$metascore %>% sum(.,na.rm = T)
data$metascore %>% max(.,na.rm = T)
data$metascore %>% min(.,na.rm = T)
data$metascore %>% mean(.,na.rm = T)

## 7 
data$imdb_votes %>% sum(.,na.rm = T)
data$imdb_votes %>% max(.,na.rm = T)
data$imdb_votes %>% min(.,na.rm = T)
data$imdb_votes %>% mean(.,na.rm = T)

## 8
data$imdb_rating %>% sum(.,na.rm = T)
data$imdb_rating %>% max(.,na.rm = T)
data$imdb_rating %>% min(.,na.rm = T)
data$imdb_rating %>% mean(.,na.rm = T)

## 9 

data %>% filter(rated == "PG-13") %>% glimpse()


## 10
data %>% filter(runtime_min > 140) %>% glimpse()
