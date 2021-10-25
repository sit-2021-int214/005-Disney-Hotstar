

#Explore the dataset 
data <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
View(data)


install.packages("dplyr")
install.packages("DescTools")
install.packages("assertive")
install.packages("stringr")
install.packages("ggplot2")


#2.1Show the top 10 books according to the book rating.

#data  %>% select(Rating,Book_title,Price) %>% arrange(Rating) %>% head(10)
# Rating                                                                                                                           Book_title     Price
#1    3.00                                                                                  Advanced Game Programming: A Gamedev.Net Collection  59.08235
#2    3.00                                            Cross-Platform Game Programming (Game Development) (Charles River Media Game Development)  60.39118
#3    3.00                                                                              Lambda-Calculus, Combinators and Functional Programming  61.16765
#4    3.20                                                                                                        Game Programming Golden Rules  19.15294
#5    3.22                                                                                                                     Beginning Java 2  36.61765
#6    3.32                                                                                           Sams Teach Yourself JavaScript in 24 Hours  27.85000
#7    3.33                                                                                         Responsive Web Design Overview For Beginners  11.26765
#8    3.37                                                                                                       Unity Virtual Reality Projects  45.66471
#9    3.38                                                                                                 Sams Teach Yourself Perl in 24 Hours  38.23529
#10   3.45 3D Game Engine Design: A Practical Approach to Real-Time Computer Graphics (The Morgan Kaufmann Series in Interactive 3D Technology) 117.98824
  
#2.2Books rated between 4-5 What books are there?
library(assertive)
is.numeric(data$Rating)
data %>% filter(Rating>4.5 , Rating <5) %>% select(Book_title,Rating)
#1                                          ZX Spectrum Games Code Club: Twenty fun games to code and learn   4.62
#2                      The Elements of Computing Systems: Building a Modern Computer from First Principles   4.54
#3              Build Web Applications with Java: Learn every aspect to build web applications from scratch   4.67
#4 Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems   4.72
#5                            The Linux Programming Interface: A Linux and Unix System Programming Handbook   4.62
#6                                                                 Practical Object Oriented Design in Ruby   4.54
#7                                                 Fluent Python: Clear, Concise, and Effective Programming   4.67
#8                                                                         CLR via C# (Developer Reference)   4.58
#9                                                  The Art of Computer Programming, Volumes 1-4a Boxed Set   4.77
                                 

#2.3 Average rating of all books
#rating <-as.numeric(data$Rating)
#rating %>% mean() #[1] 4.067417
is.numeric(data$Rating)
data %>% summarise(Average = mean(Rating)) # Average
                                            #1 4.067417
#2.4 Most reviewed book titles
library(stringr)
is.numeric(data$Reviews) #[1] FALSE
review_score <- data$Reviews %>% str_remove(",") %>% str_trim() %>% as.numeric()
is.numeric(review_score)
review_score %>% max() #[1] 5938  Start with Why: How Great Leaders Inspire Everyone to Take Action

#2.5 Shows the price of a book by showing the max, min, and average price.
is.numeric(data$Price)
data %>% summarise(Max = max(Price)) #     Max    235.65
data %>% summarise(Min = min(Price)) #       Min  9.323529
data %>% summarise(Average = mean(Price)) #    Average 54.54186

#2.6 Displays information on Kindle Edition book types with prices over 20.
data  %>% filter(data$Type == "Kindle Edition"& Price <20.0) %>% glimpse()
Rows: 2
Columns: 7
#$ Rating          <dbl> 3.33, 4.06
#$ Reviews         <chr> "0", "1,325"
#$ Book_title      <chr> "Responsive Web Design Overview For Beginners", "How Google Works"
#$ Description     <chr> "In Responsive Web Design Overview For Beginners, you'll get an overview of what to expect w~
#$ Number_Of_Pages <int> 50, 305
#$ Type            <chr> "Kindle Edition", "Kindle Edition"
#$ Price           <dbl> 11.26765, 13.16471


#Using ggplot2 to create 2 graphs and explain each graph.
#  Graph shows  between Rating and Price
library(ggplot2)
data %>% ggplot(aes(x=Rating,y=Price))+geom_point()
point <- data  %>% filter(Price >50)%>% ggplot(aes(x=Rating,y=Price))+geom_point(aes(color= Price ))+geom_smooth()
point
#From the graph, shows the data between the price and the rating by choosing to show at a price that is greater than 50

#Graph shows  between Price and Frequency
bar <- data %>% filter(Rating < 1000) %>% ggplot(aes(x=Price))+geom_histogram(binwidth = 10)+geom_bar()+ggtitle("COUNT OF PRICE")
#From the graph, shows the data between the price and the Frequency by choosing to show at a rating that is less than 1000


