# 005-Disney Hotstar
Datasets from: [Disney+ Hotstar](https://www.kaggle.com/sanjanaalaham/disney-hotstar-dataset)

## Objective

## Process
0. Import datasets and libraries.
1. Define a question
2. Data Cleaning
3. 


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
5. Find total, max, min, average of imdb_score.
6. Find total, max, min, average of metascore.
7. List a movie that is rated at PG-13.
8. List a movie that has runtime greather than 100 minutes.

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

### Use 
5. Find total, max, min, average of imdb_score.
6. Find total, max, min, average of metascore.
7. List a movie that is rated at PG-13.
8. List a movie that has runtime greather than 100 minutes.

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



