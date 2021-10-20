# 005-Disney Hotstar
Datasets from: [Disney+ Hotstar](https://www.kaggle.com/sanjanaalaham/disney-hotstar-dataset)

## Objective

## Process
0. Import datasets and libraries.
1. Define a question
2. Data Cleaning



## Result

### Our Steps

#### 0. Import datasets and libraries.

##### 0.1 Import dataset
Use read.csv to import dataset
```
#Import Data
data <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/005-Disney-Hotstar/main/disney_plus_shows.csv")
```

##### 0.2 Import libraries
```
#Library
library(dplyr)
library(assertive)
library(readr)
library(stringr)
```

#### 1. Define questions

1. How many series and movies in this dataset ?
2. Find average runtime of movie
3. 

#### 2. Data Cleaning 

##### 2.1 Change Every empty string in dataset to NA.
```
data <- data %>% na_if(.,"") %>% na_if(.,"N/A")
```

##### 2.2 Change type of type into factor
```
data$type <- data$type %>% as.factor()
```
##### 2.3 Change type of rated into factor
```
data$rated <- data$rated %>% str_trim() %>% as.factor()
```

##### 2.4 Change 'APPROVED' to 'Approved' in rated
```
data$rated <- data$rated %>% str_replace("APPROVED", "Approved")
```

##### 2.5 Change 'NOT RATED' to 'Not Rated' in rated
```
data$rated <- data$rated %>% str_replace("NOT RATED" , "Not Rated")
```

##### 2.6 Change 'PASSED' to 'Passed' in rated
```
data$rated <- data$rated %>% str_replace("PASSED" , "Passed")
```

##### 2.7 Change 'UNRATED' to 'Unrated' in rated
```
data$rated <- data$rated %>% str_replace("UNRATED" , "Unrated")
```

##### 2.8 Delete extra character out and trim the space out, then change type to numeric and rename to "runtime (min)"
```
data$runtime <- data$runtime %>% str_remove("min") %>% str_trim() %>% as.numeric()
names(data)[8] <- 'runtime_min'
```

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



