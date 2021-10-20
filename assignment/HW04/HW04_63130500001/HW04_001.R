# 1.Explore the dataset
## Import and Install

### import a dataset Computer Science
Com <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
### Install library
install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("assertive")
install.packages("readr")
install.packages("stringr")

### Call library
library("dplyr")
library("ggplot2")
library('assertive')
library("readr")
library("stringr")
library("tibble")

### 1.1 see Dataset
View(Com)
### 1.2 check datatype
Com$Rating %>% is.numeric()
Com$Number_Of_Pages %>% is.numeric()
Com$Book_title %>% is.character()
### 1.6 check number of row and column in dataset
Com %>% glimpse()



# 2.Learning function from Tidyverse
tibble(x =0:10 , y = -(x^2) , z =x+y)

# 3.Tranform data
### 3.1 find average of Rating of this Dataset
Com$Rating %>% mean(.,na.rm=T)
### 3.2 find the max Reviews of this Dateset
Com$Reviews %>% max(.,na.rm = T)
### 3.3 check type of the book that has more than 1000 pages in this Dataset
Com %>% filter(Number_Of_Pages > 1000) %>% select(Type,Number_Of_Pages)

# 4.use GGplot2 to plot the graph
## 4.1 plot graph show relation between Price and Number of Pages
Com %>% ggplot(aes(x=Number_Of_Pages,y=Price))+geom_point(aes(color=Com$Price))
## 4.2 plot graph histogram show Price
Com %>% ggplot(aes(x=Price))+geom_histogram(binwidth = 15)+ggtitle("Price")+xlab("Price")+ylab("Count")










