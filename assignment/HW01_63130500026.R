#=-=-=-=-=-=-Exercise1-=-=-=-=-=-=#
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)

#average 
mean(x) 
#Mean of x is 9.44

#sum
sum(x) 
#Sum of x is 47.2

#median
median(x) 
#Medain of x is 6.4

#sd
sd(x) 
#Standard Deviation of x is 7.33846

#variance
var(x) 
#Varaince of x is 53.583

#=-=-=-=-=-=-End of Exercise1-=-=-=-=-=-=#


#=-=-=-=-=-=-Exercise2-=-=-=-=-=-=#

names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")


years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))


#Number of Movies
length(names)
#The number of movies is 27

#Finding the 19th movies name 
names[19] 
#The 19th movie's name is Avengers: Infinity War


#Which year is most released movies
table <- table(years)
table

sort(table , decreasing = TRUE)

# 2017 and 2021 is the most released movie (4 movies)
