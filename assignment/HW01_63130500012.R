
#Exercise 1
a <- c(10.4,5.6,3.1,6.4,21.7)
mean(a) #9.44
sum(a) #47.2
median(a) #6.4
sd(a) #7.33846
var(a) #53.853



#Ex0ercise 2.1
movies_name <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
                "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
                "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
                "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
                "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
                "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

movies_year <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
                rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

marvel_movies <- data.frame(movies_name,movies_year)
print(marvel_movies)
#??? Data Frame because the data are related and can see the information clearly????????????????????????????????????????????????

#???????????????????????????????????????????????????????????????????????????
table(marvel_movies$movies_year)


#Exercise 2.2.1
movie <- movies_name
print(movie)
length(movie) # 27



#Exercise 2.2.2
class(movie)
movie[19] #"Avengers: Infinity War"



#Exercise 2.2.3
summary(as.factor(movies_year))
# 2008 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2021 
#  2    1    2    1    2    2    2    2    4    2    3    4 
sort(summary(as.factor(movies_year)),decreasing = TRUE)
#2017 2021 2019 2008 2011 2013 2014 2015 2016 2018 2010 2012 
# 4    4    3    2    2    2    2    2    2    2    1    1
#2017 and 2021 are the years when the movies are shown the most.


