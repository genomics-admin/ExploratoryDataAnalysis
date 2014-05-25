library(lattice) 
xyplot()
bwplot()


library(nlme)
library(lattice)
class(xyplot(weight ~ Time | Diet, BodyWeight))
xyplot(weight ~ Time | Diet, BodyWeight)


library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)

print(p)

install.packages(ggplot2)
library(ggplot2)

library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)

qplot(votes, rating, data = movies)

qplot(votes, rating, data = movies) + geom_smooth()
qplot(votes, rating, data = movies, smooth = "loess")
qplot(votes, rating, data = movies, panel = panel.loess)
qplot(votes, rating, data = movies) + stats_smooth("loess")


library(datasets)
data(airquality)

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

qplot(Wind, Ozone, data = airquality)

qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))

qplot(Wind, Ozone, data = airquality, geom = "smooth")