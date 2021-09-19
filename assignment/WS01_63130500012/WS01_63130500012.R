
library(dplyr)
library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation
library(assertive)  # Readable check functions to ensure code integrity


sat_scores <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")
View(sat_scores)

#How many observation of this dataset (before cleaning) ?
sat_scores %>% glimpse()
#---------------------------------------------------------------------------------------------------------------

#  Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
sat_scores %>% duplicated() %>% sum()  #[1] 7

#list the data that duplicate
sat_scores %>% filter(duplicated(sat_scores))


#---------------------------------------------------------------------------------------------------------------

#How many distinct school in this dataset ? (Know after drop duplicate data)

# drop duplicate data
sat_scores<- sat_scores %>% distinct()


#How many distinct school in this dataset
sat_scores %>% glimpse()


#--------------------------------------------------------------------------------------------------------------
#What is min, max, average, quartile of each part in SAT ?
  View(sat_scores)
  is.character(sat_scores$math_score)
  
#????????????char????????????numeric
sat_scores$math_score <- sat_scores$math_score %>% as.numeric()
sat_scores$reading_score<- sat_scores$reading_score %>% as.numeric()
sat_scores$writing_score <- sat_scores$writing_score %>% as.numeric()

# set scores between 200-800  
sat_scores <- sat_scores %>% filter(sat_scores$math_score >= 200 & sat_scores$math_score <= 800)
sat_scores <- sat_scores %>% filter(sat_scores$reading_score >= 200 & sat_scores$reading_score <= 800)
sat_scores <- sat_scores %>% filter(sat_scores$writing_score >= 200 & sat_scores$writing_score <= 800)

is.numeric(sat_scores$math_score) #true

    #-------------------

#Max

sat_scores %>% summarise(max_score_math = max(sat_scores$math_score)) #682
sat_scores %>% summarise(max_score_reading = max(sat_scores$reading_score)) #636
sat_scores %>% summarise(max_score_writing = max(sat_scores$writing_score)) #649
 
#min
sat_scores %>% summarise(min_score_math = min(sat_scores$math_score))   # 312
sat_scores %>% summarise(min_score_reading = min(sat_scores$reading_score)) # 279
sat_scores %>% summarise(min_score_writing = min(sat_scores$writing_score)) # 286
 
#avg
sat_scores %>% summarise(average_score_math = mean(sat_scores$math_score)) #413
sat_scores %>% summarise(average_score_reading = mean(sat_scores$reading_score)) #400
sat_scores %>% summarise(average_score_wirting = mean(sat_scores$writing_score)) #394

#-----------------------------------------------------------------------------------------------------------
-

# Find min, max, average and quartile of total score.
#new colunm 
sat_scores <- sat_scores %>% mutate(total_score = math_score+reading_score+writing_score)
glimpse(sat_scores$total_score)

#max
sat_scores %>% summarise(max_total = max(sat_scores$total_score))
#min
sat_scores %>% summarise(min_total = min(sat_scores$total_score))
#avg
sat_scores %>% summarise(avg_total = mean(sat_scores$total_score))

#------------------------------------------------------------------------------------------------------------

# Find a school that has the highest SAT score.
sat_scores %>% select(school_name,total_score) %>% arrange(desc(total_score)) #???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????



