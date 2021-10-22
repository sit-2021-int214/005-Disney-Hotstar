#1Explore the dataset that you have select.
#install.packages
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

# Dataset
dataset <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
View(dataset)
#------------------------------------------------------------------------
#2.transform data with dplyr and finding insight the data at least 6 issues. Show your code, result and summary in form of sentence/paragraphs.
library(dplyr)
#2.1How many observation of this dataset  ?
glimpse(dataset) #Rows:271 Columns: 7  $ Rating, $ Reviews ,$ Book_title ,$ Description,$ Number_Of_Pages,$ Type,$ Price 
#2.2Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
dataset %>% duplicated() %>% table() #FALSE 271 
#2.3What is min, max, average in price dataset ?
dataset %>% summarise(mean = mean(Price))#54.5
dataset %>% summarise(max = max(Price))#236.
dataset %>% summarise(min = min(Price))# 9.32
#2.4List  the book that has type "ebook"
dataset %>% filter(Type == "ebook")
#2.5 List the book has rating equal to 5
dataset %>% filter(Rating==5)
#2.6List the book shows only Hardcover type and has  Number_Of_Pages more than 1000
dataset %>% filter(Type == "Hardcover" & Number_Of_Pages > 1000)  


#graph
#1.Graph shows how many each type books
counts <- table(dataset$Type)
barplot(counts, main="Count of book each type", 
        xlab="type of book",ylab = "count of book",col = rainbow(6))
#2.Graph shows  between Rating and Price
dataset %>% ggplot(aes(x = Rating,y = Price,color=Rating))  + geom_point()









