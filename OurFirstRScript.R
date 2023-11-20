## ---- Data import ----

# using the read.csv function
y <- read.csv("data/captures.csv",sep=";") 
class(y) # this is a data frame
head(y) # we can see the first rows of our data frame

# or from an excel file:
# we need a specific package in this case, and we need to install it:
# # install.packages("xlsx") # the line is commented because you just need to run it once
# library(xlsx)
# # read in the worksheet named mysheet
# mydata <- read.xlsx("data/database_esercizio.xls", sheetName = "captures")
# class(mydata)
# head(mydata)

# install.packages("readxl")
library(readxl)
mydata <- read_excel("data/database_esercizio.xls", sheet = "captures")
class(mydata)
head(mydata)

## ---- Extract a column (i.e. a variable) -----
# we can do this using '$'
y$weight_g
length(y$weight_g)
dim(y)
# or subsetting the data frame, using square brackets '[ ]'
y["weight_g"]
y[,10] # the weight of the animals is stored in the 10th column
# Let's ask R what kind of variable we are dealing with, using the 'class' function again
class(y$weight_g)

w <- y$weight_g
w


## ---- Plot the data: 1) histogram ----

# histogram
# the function to plot an histogram is 'hist'
# let's see how it works
??histogram
?hist # this is the simplest way to get help in R! just a question mark!
hist(y$weight_g, main="", xlab="Animal weigth (g)") # with default break
hist(y$weight_g, breaks=30, main="", xlab="Animal weigth (g)") # we specified a single number giving
# the number of cells for the histogram


## ---- Central tendency measures ----

## the mean and the median
weight <- na.omit(y$weight_g)
# mean
mean(weight)
mean(y$weight_g)
# median
median(weight)
hist(weight,prob=T,ylim=c(0,0.05)) # prob=T for relative frequencies (density)
lines(density(rnorm(1000000,mean(weight),sd(weight))),col="red")
segments(mean(weight),0,mean(weight),0.047,col="blue")
segments(median(weight),0,median(weight),0.047,col="green")

## the mode
# R does not have a standard in-built function to calculate mode.
# So we create a user function to calculate mode of a data set in R.
# This function takes the vector as input and gives the mode value as output.
# Create the function.
getmode <- function(x) {
  uniqv <- unique(x)
  uniqv[which.max(tabulate(match(x, uniqv)))]
}
getmode(weight)


## ---- Dispersion measures ----

## range
range(weight)

## quantile
quantile(weight) # in R, quartiles are the default for the quantile function
median(weight)
?boxplot # check the range argument and its default value
boxplot(weight, range=0)
boxplot(na.omit(y$footlength_mm))
boxplot(weight)

## ---- Plot the data: 2) boxplot ----

# boxplot
boxplot(y$weight_g, ylab="Animal weigth (g)")
boxplot(y$weight_g ~ y$sex + y$age, ylab="Animal weigth (g)")
# exercise (by your own): do the same with the foot lenght
boxplot(y$footlength_mm, ylab="Foot length (mm)")

# summary
summary(weight)

## variance
var(weight)

## standard deviation
sd(weight)

## standard error
sd(weight)/sqrt(length(weight))
sd(weight)/sqrt(119)


## ---- Handling data in a data frame - common operations ----

# selecting subsets of data, according to their values
# library(dplyr)
library(tidyverse)
filter(y, trap_id > 43)
# or
y %>% filter(trap_id > 43)
filter(y, trap_id > 43 & occasion < 20)
filter(y, trap_id < 5 | trap_id > 65)
arrange(y, trap_id)

# multiple operations
y[,c("chip","trap_id")] %>% 
  filter(trap_id > 65) %>% 
  arrange(trap_id)

select(y, chip, trap_id)
y %>% 
  select(chip, trap_id) %>% 
  filter(trap_id > 65) %>% 
  arrange(trap_id)

# summarizing data within groups
names(y)
y$age
y %>% 
  group_by(age) %>% 
  summarise(mean.w = mean(na.omit(weight_g)))
y$sex
y %>% 
  group_by(age, sex) %>% 
  summarise(mean.w = mean(na.omit(weight_g)))

