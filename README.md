# 005-Disney Hotstar
Datasets from: [Disney+ Hotstar](https://www.kaggle.com/sanjanaalaham/disney-hotstar-dataset)

## Objective

## Process
0. Import datasets and libraries.
1. Define a question
2. Data Cleaning
3. List a film that is a episode
4. Find average rumtime of movie
5. Find a movies that is directed by Anthony Russo and Joe Russo
6. Find total, max, min, average of metascore.
7. Find total, max, min, average of imdb_vote.
8. Find total, max, min, average of imdb rating.
9. List a film that is rated at PG-13.
10. List a film that has runtime greater than 140 minutes.


## Result

## Our Steps

## 0. Import datasets and libraries.

### 0.1 Import dataset
Use read.csv to import dataset
```
#Import Data
data <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/005-Disney-Hotstar/main/disney_plus_shows.csv")
```

### 0.2 Import libraries
```
#Library
library(dplyr)
library(assertive)
library(readr)
library(stringr)
```

## 1. Define questions

1. How many episodes in this dataset ?
2. Find average runtime of movie
3. Name a movie that is directed by Anthony Russo and Joe Russo
4. Find total, max, min, average of metascore.
5. Find total, max, min, average of imdb_vote.
6. Find total, max, min, average of imdb_rating.
7. List a film that is rated at PG-13.
8. List a film that has runtime greather than 140 minutes.

## 2. Data Cleaning 

### 2.1 Change Every empty string in dataset to NA.
```
data <- data %>% na_if(.,"") %>% na_if(.,"N/A")
```

### 2.2 Change type of type into factor
```
data$type <- data$type %>% as.factor()
```
### 2.3 Change type of rated into factor
```
data$rated <- data$rated %>% str_trim() %>% as.factor()
```

### 2.4 Change 'APPROVED' to 'Approved' in rated
```
data$rated <- data$rated %>% str_replace("APPROVED", "Approved")
```

### 2.5 Change 'NOT RATED' to 'Not Rated' in rated
```
data$rated <- data$rated %>% str_replace("NOT RATED" , "Not Rated")
```

### 2.6 Change 'PASSED' to 'Passed' in rated
```
data$rated <- data$rated %>% str_replace("PASSED" , "Passed")
```

### 2.7 Change 'UNRATED' to 'Unrated' in rated
```
data$rated <- data$rated %>% str_replace("UNRATED" , "Unrated")
```

### 2.8 Delete extra character out and trim the space out, then change type to numeric and rename to "runtime (min)"
```
data$runtime <- data$runtime %>% str_remove("min") %>% str_trim() %>% as.numeric()
names(data)[8] <- 'runtime_min'
```

### 2.9 Change type of metascore to numeric
```
data$metascore <- data$metascore %>% as.numeric()
```

## 3. List a film that is a episode

### Use select() to display a id , title and type then use filter() to find a film that is an episode 
```
data %>% select('Film ID' = imdb_id,'Film title' = title,type) %>% filter(type == "episode")
```

```
      Film ID                       Film title    type
1   tt1378121                      El Materdor episode
2   tt1788785                       Moon Mater episode
3   tt1378123               Rescue Squad Mater episode
4   tt3755836                         Spinning episode
5   tt2166364                Time Travel Mater episode
6   tt1511164        Unidentified Flying Mater episode
7   tt3755824                           Bugged episode
8   tt0090803                      Casebusters episode
9   tt3067144      Phineas and Ferb: Star Wars episode
10  tt7642482                    Holiday Magic episode
11  tt0923160    Disneyland Around the Seasons episode
12  tt1455430         Easter Island Underworld episode
13 tt11194650                  What is Cheese? episode
14 tt11194652                 What is Reading? episode
15  tt4664808 Incredible! The Story of Dr. Pol episode
16  tt2278028                     Episode #2.7 episode
17  tt0091566                      Mr. Boogedy episode
18  tt0064705        My Dog, the Thief: Part 1 episode
19  tt2283584 Phineas and Ferb: Mission Marvel episode
20  tt0056441  Sammy, the Way-Out Seal: Part 1 episode
21  tt0166829     The Sultan and the Rock Star episode
22  tt6001956                 Blue Ribbon Kids episode
23  tt0561332         The Plausible Impossible episode
```

There are 23 episodes in this dataset.

## 4. Find average rumtime of movie

### 4.1 Use filter() to filter out others than movie and assigned to a new param called movies.
```
movies <- data %>% select(imdb_id,title,type,runtime_min) %>% filter(type == "movie")
```

### 4.2 use mean() to calculate an average of movies in this dataset.
```
movies$runtime_min %>% mean(.,na.rm = TRUE)
```

```
[1] 78.38671
```

An average of movies in this dataset is 78.38671

## 5. Find a movies that is directed by Anthony Russo and Joe Russo

### 5.1 Use filter() to filter out others than movie and assigned to a new param called movies_director.
```
movies_director <- data %>% select(imdb_id,title,type,director) %>% filter(type == "movie")
```

### 5.2 Use filter() to filter a director that are named Anthony Russo and Joe Russo, then use glimpse() to display a data
```
movies_director %>% filter(director == "Anthony Russo, Joe Russo") %>% glimpse()
```

```
Rows: 3
Columns: 4
$ imdb_id  <chr> "tt4154796", "tt3498820", "tt1843866"
$ title    <chr> "Avengers: Endgame", "Captain America: Civil War", "Captain America: The Winter Soldier"
$ type     <fct> movie, movie, movie
$ director <chr> "Anthony Russo, Joe Russo", "Anthony Russo, Joe Russo", "Anthony Russo, Joe Russo"
```

There are 3 moives that is directed by Anthony Russo and Joe Russ

## 6. Find total, max, min, average of metascore.

### 6.1 Use sum() to find a total
```
data$metascore %>% sum(.,na.rm = T)
```

```
[1] 18122
```

Total of metascore is 18122

### 6.2 Use max() to find max
```
data$metascore %>% max(.,na.rm = T)
```

```
[1] 99
```

The highest metascore is 99

### 6.3 Use min() to find min
```
data$metascore %>% min(.,na.rm = T)
```

```
[1] 19
```

The lowest metascore is 19

### 6.4 Use mean() to find average
```
data$metascore %>% mean(.,na.rm = T)
```

```
[1] 62.06164
```

The average metascore is 62.06

## 7. Find total, max, min, average of imdb_vote.

### 7.1 Use sum() to find a total
```
data$imdb_votes %>% sum(.,na.rm = T)
```

```
[1] 89242
```

Total of imdb vote is 89242

### 7.2 Use max() to find max
```
data$imdb_votes %>% max(.,na.rm = T)
```

```
[1] 1173
```

The highest vote score is 1173

### 7.3 Use min() to find min
```
data$imdb_votes %>% min(.,na.rm = T)
```

```
[1] 5
```

The lowest imdb vote score is 5

### 7.4 Use mean() to find average
```
data$imdb_votes %>% mean(.,na.rm = T)
```

```
[1] 347.2451
```

The average imdb vote is 347.2451 

## 8. Find total, max, min, average of imdb rating.

### 8.1 Use sum() to find a total
```
data$imdb_rating %>% sum(.,na.rm = T)
```

```
[1] 5851
```

Total of imdb rating is 5851

### 8.2 Use max() to find max
```
data$imdb_rating %>% max(.,na.rm = T)
```

```
[1] 9.7
```

The highest imdb rating is 9.7

### 8.3 Use min() to find min
```
data$imdb_rating %>% min(.,na.rm = T)
```

```
[1] 1.5
```

The lowest imdb rating is 1.5

### 8.4 Use mean() to find average
```
data$imdb_rating %>% mean(.,na.rm = T)
```

```
[1] 6.656428
```

The average imdb rating is 6.66


## 9. List a film that is rated at PG-13.

### 9.1 Use filter() to filter a PG-13 Rate then use glimpse() to display
```
data %>% filter(rated == "PG-13") %>% glimpse()
```

```
Rows: 37
Columns: 19
$ imdb_id     <chr> "tt0147800", "tt0499549", "tt0118998"~
$ title       <chr> "10 Things I Hate About You", "Avatar~
$ plot        <chr> "A pretty, popular teenager can't go ~
$ type        <fct> movie, movie, movie, movie, movie, mo~
$ rated       <chr> "PG-13", "PG-13", "PG-13", "PG-13", "~
$ year        <chr> "1999", "2009", "1998", "2018", "1996~
$ released_at <chr> "31 Mar 1999", "18 Dec 2009", "26 Jun~
$ added_at    <chr> "November 12, 2019", "November 12, 20~
$ runtime_min <dbl> 97, 162, 85, 100, 113, 132, 117, 141,~
$ genre       <chr> "Comedy, Drama, Romance", "Action, Ad~
$ director    <chr> "Gil Junger", "James Cameron", "Betty~
$ writer      <chr> "Karen McCullah, Kirsten Smith", "Jam~
$ actors      <chr> "Heath Ledger, Julia Stiles, Joseph G~
$ language    <chr> "English, French", "English, Spanish"~
$ country     <chr> "USA", "USA", "USA", "USA", "USA", "U~
$ awards      <chr> "2 wins & 13 nominations.", "Won 3 Os~
$ metascore   <dbl> 70, 83, 46, 83, 31, 51, 64, 66, 78, 8~
$ imdb_rating <dbl> 7.3, 7.8, 5.4, 8.2, 5.8, 6.6, 7.3, 7.~
$ imdb_votes  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, N~
```

There are 37 films that are PG-13 rate

## 10. List a film that has runtime greater than 140 minutes.

### 10.1 use filter() to filter a runtime that greater than 140 min, then use glimpse() to display
```
data %>% filter(runtime_min > 140) %>% glimpse()
```

```
Rows: 15
Columns: 19
$ imdb_id     <chr> "tt0499549", "tt0416716", "tt2395427"~
$ title       <chr> "Avatar", "Empire of Dreams: The Stor~
$ plot        <chr> "A paraplegic Marine dispatched to th~
$ type        <fct> movie, movie, movie, movie, movie, mo~
$ rated       <chr> "PG-13", NA, "PG-13", "PG-13", "PG-13~
$ year        <chr> "2009", "2004", "2015", "2019", "2016~
$ released_at <chr> "18 Dec 2009", "20 Sep 2004", "01 May~
$ added_at    <chr> "November 12, 2019", "November 12, 20~
$ runtime_min <dbl> 162, 151, 141, 181, 147, 143, 149, 16~
$ genre       <chr> "Action, Adventure, Fantasy, Sci-Fi",~
$ director    <chr> "James Cameron", "Edith Becker, Kevin~
$ writer      <chr> "James Cameron", "Ed Singer", "Joss W~
$ actors      <chr> "Sam Worthington, Zoe Saldana, Sigour~
$ language    <chr> "English, Spanish", "English", "Engli~
$ country     <chr> "USA", "USA", "USA", "USA", "USA", "U~
$ awards      <chr> "Won 3 Oscars. Another 86 wins & 129 ~
$ metascore   <dbl> 83, NA, 66, 78, 75, 69, NA, 50, 53, 6~
$ imdb_rating <dbl> 7.8, 8.3, 7.3, 8.4, 7.8, 8.0, 8.5, 7.~
$ imdb_votes  <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, N~
```

There are 15 films that has runtime greater than 140 minutes.


## About Us
งานนี้เป็นส่วนของวิชา INT214 Statistics for Information technology <br/> ภาคเรียนที่ 1 ปีการศึกษา 2564 คณะเทคโนโลยีสารสนเทศ มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี

### Team: Group_01_12_26_70
| No. | Name              | Student ID   |
|:---:|-------------------|--------------|
|  1  | นายกรวิชญ์ วัฒนธนกุล    | 63130500001  |
|  2  | นางสาวชญาดา อินทรสอน  | 63130500020  |
|  3  | นายโชติวิทย์ เสือยันต์  | 6313050026 |
|  4  | นางสาวนาตาเซีย ยุสุวพันธ์   | 63130500070 |

### Instructor
- ATCHARA TRAN-U-RAIKUL
- JATAWAT XIE (Git: [safesit23](https://github.com/safesit23))



