# 005-Disney Hotstar
Datasets from: [Disney+ Hotstar](https://www.kaggle.com/sanjanaalaham/disney-hotstar-dataset)

## Objective

## Process
0. Import datasets and libraries.
1. Data Cleaning
2. Define a question


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

#### 1. Data Cleaning 

##### 1.1 Change Every empty string in dataset to NA.
```
data <- data %>% na_if(.,"") %>% na_if(.,"N/A")
```

##### 1.2 Change type of type into factor
```
data$type <- data$type %>% as.factor()
```

##### 1.3 Change typer of rated into factor
```
data$rated <- data$rated %>% as.factor()
```

##### 1.4 Delete extra character out and trim the space out, then change type to numeric and rename to "runtime (min)"
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



