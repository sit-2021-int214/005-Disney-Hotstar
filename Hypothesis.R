library("dplyr")
library("readr")

data <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/005-Disney-Hotstar/main/Disney.csv")
data_sample <- data %>% sample_n(300)

n <- 300
alpha <- 0.05

Sample_Mean <- mean(data_sample$data.imdb_rating,na.rm = TRUE)
Sample_SD <- sd(data_sample$data.imdb_rating,na.rm = TRUE)
mue0 <- mean(data$data.imdb_rating,na.rm = TRUE)


t <- (Sample_Mean-mue0)/(Sample_SD*(sqrt(n)));
pt <- pt(t,n-1)

if(pt <= alpha){
  print("Reject H0")
}else{
  print("Not reject H0")
}

seom <- Sample_SD/(sqrt(n));
margin <- 1.96*seom

upper <- Sample_Mean+margin
lower <- Sample_Mean-margin
