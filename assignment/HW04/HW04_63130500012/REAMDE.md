# R-Assignment 4

**Created by Name-Surname (ID: xxxxxxxxxx)**

Choose Dataset:
1. Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

2. Superstore Sales Dataset (Data from Rohit Sahoo,[Kaggle](https://www.kaggle.com/rohitsahoo/sales-forecasting)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv)


### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Explore the dataset

```
# Library
library(dplyr)
library(assertive)
library(stringr)
library(ggplot2)

# Dataset
dataset <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
```

In this dataset has Top 270 Computer Science / Programing Books



## Part 2: Learning function from Tidyverse

- Function `select()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns

```
starwars %>% select(name,height)
```
** You can sepearate this part or combine in part of `Transform data with dplyr and finding insight the data`

## Part 3: Transform data with dplyr and finding insight the data

Show the top 10 books according to the book rating.

```
#data  %>% select(Rating,Book_title,Price) %>% arrange(Rating) %>% head(10)
```

Result:

```
# Rating                                                                                                                           Book_title     Price
1    3.00                                                                                  Advanced Game Programming: A Gamedev.Net Collection  59.08235
2    3.00                                            Cross-Platform Game Programming (Game Development) (Charles River Media Game Development)  60.39118
3    3.00                                                                              Lambda-Calculus, Combinators and Functional Programming  61.16765
4    3.20                                                                                                        Game Programming Golden Rules  19.15294
5    3.22                                                                                                                     Beginning Java 2  36.61765
6    3.32                                                                                           Sams Teach Yourself JavaScript in 24 Hours  27.85000
7    3.33                                                                                         Responsive Web Design Overview For Beginners  11.26765
8    3.37                                                                                                       Unity Virtual Reality Projects  45.66471
9    3.38                                                                                                 Sams Teach Yourself Perl in 24 Hours  38.23529
10   3.45 3D Game Engine Design: A Practical Approach to Real-Time Computer Graphics (The Morgan Kaufmann Series in Interactive 3D Technology) 117.98824
 
```
//Explain

- list 1
- list 2

## Part 4: Visualization with GGplot2
### 1.) Graph show relation between height and mass
```
scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))

scat_plot+geom_smooth()
```
Result:

![Graph 1](graph1.png)

**Guideline:
Embed Image by using this syntax in markdown file
````
![Name](imageFile)
````
