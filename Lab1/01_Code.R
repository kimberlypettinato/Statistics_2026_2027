
###############################################
##                  STATISTICS               ##
## Bioinformatics and Computational Genomics ##
###############################################

###############################################
#                LABORATORY 1                 #
#          DESCRIPTIVE STATISTICS             #
###############################################

########################
### General commands ###  
########################
rm(list = ls())   # to clean the Global Env
graphics.off()    # to close all currently open graphics devices
getwd()           # to see the current dir

# change dir
setwd('/Users/petti/OneDrive/Desktop/BCG/STASTICS/LAB/Statistics_2026_2027/Lab1')

########################
## Data Import/Export ##  
########################

# Import the file txt using "record.txt"
record <- read.table('data/record.txt', header=T)    

# - "header = TRUE" specifies that the first line of the file contains column titels
# - if needed, sep = "\t" to indicate that different entries are divided by a tabular (TSV files)
# - if needed, sep = "," to indicate that different entries are divided by a character (CSV files)
# - if needed, dec = "," to indicate that the comma is used to define decimals

# Dimensions and variables names
dim(record)         # to know the dimension of the dataset (rows x col)
dimnames(record)    # list made by two elements (name of the rows, names of the columns)

# Show the first lines
head(record)        # to see the first 10 rows (it is customizable)
str(record)         # str() shows the first elements of each variable
record[1:5,]        # name.dataset[] shows the selected number of columns and rows

# View the database in table format
View(record)   # using RStudio, you can also click on the name of the database in the "Environment" window


# Name rows using labels contained in the 8th column
record <- data.frame(record[,1:7], row.names=record[,8])
# In the case above, will be created a new dataset called again record
# made by the first 7 columns of the old dataset
# with the rows called like as called in the 8th column of the old dataset
# (the values of the 8th column will be used as rownames)

head(record) # check


# Name columns
# 1. Put the names in a vector
# 2. Using the dimnames() function on the dataset,
#    assign, to the second element of the list [[2]],
#    the vector with the new names
var.names <- c("m100","m200","m400","m800","m1500","m3000","Marathon")
dimnames(record)[[2]] <- var.names

head(record) # check


# Save the modified version 
# in a CSV file using the function write.table()
# - CSV file format: data separated by a character indicated in sep = "")
# - write.table(name.dataset, file = "name file to save", sep "character")
write.table(record, file = 'results/record_mod.csv',sep = ";")


# Read the saved CSV files
# using the function read.table()
record <- read.table('results/record_mod.csv', header=T)
# not indicating the separator value, the CSV is a completely mess

# !!! to read a CSV file is necessary to indicate the spearatir value)
record <- read.table('results/record_mod.csv', header=T, sep = ";")



##########################
# DESCRIPTIVE STATISTICS #
##########################


# Categorical (or qualitative) variables: 
#              qualitative variables take on values in one of K diﬀerent classes,
#              or categories. 
#              Examples of qualitative class
#              variables include a person’s gender (male or female), the brand of product 
#              purchased (brand A, B, or C), whether a person defaults on a debt
#              (yes or no), or a cancer diagnosis (Acute Myelogenous Leukemia, 
#              Acute Lymphoblastic Leukemia, or No Leukemia)
#              
#              - The values are classes

#              - We can summarize the information with a table of absolute/relative frequency 
#                for each category, and we can represent them with bar plots and pie charts 

# Quantitative variables:
#              Quantitative variables take on numerical values.
#.             Examples include a person’s age, height, or income, the value of a house,
#              and the price of a stock.
#
#              - The values are numerical

#              - We can summarize them using location and dispersion parameters 
#               (e.g. mean and standard deviation), and graphically with histograms and boxplots 

# The two definitions/examples above come from:
# James, G., Witten, D., Hastie, T., & Tibshirani, R. (2021).
# An Introduction to Statistical Learning: With Applications in R (2nd ed.).
# Springer. Section 2.1.5.


##############
# EXERCISE 1 #
##############

# Analysis of the data in 'studentdata.txt', 
# that contains answers to a sheet of questions given to a large number of students in statistics classes
# 559 observations of 10 variables:
# Height:     height in cm
# Gender:     gender 1=female 0=male
# Shoes:      number of pairs of shoes owned
# Number:     number chosen between 1 and 10
# Dvds:       number of movie dvds owned
# ToSleep:    time the person went to sleep the previous night (hours past midnight)
# WakeUp:     time the person woke up the next morning
# Haircut:    cost of last haircut including tip
# Job:        number of hours working on a job per week
# Drink:      usual drink at suppertime among milk, water, and pop

# To import data in R we use the command 'read.table' 
studentdata=read.table("data/studentdata.txt",header=TRUE)

# Look at the first rows of the dataset...
head(studentdata)

# How many observations and variables does the dataset contain?
dim(studentdata)

# What kind of variables are there in our dataframe?
# Which are the categorical variables and which are the quantitative ones?
str(studentdata)

# you can see that Gender is an int
# $ Gender : int  1 1 1 1 0 1 1 1 0 0 ...
# we want to change it into a categorical variable
# in order to have the categories "male" and "female"

# Tell R that the variable Gender is a categorical variable
# Using as.factor()
# It allows to create categories (levels)
studentdata$Gender=as.factor(studentdata$Gender)
str(studentdata) # check

# Let access the dataframe
# with The function attach()
# It allows to access the variable without using the $ symbol
attach(studentdata)


#### Analysis of the categorical variable Gender ####

# If you want to personalize the graphs by choosing particular colors: 
# https://www.stat.auckland.ac.nz/~ihaka/downloads/R-colours-a4.pdf

# Barplot (absolute frequencies)
windows()    # It open a new graphic window
plot(Gender,col=c('slateblue','plum2'),   # with plot() is possible do the barplot
     xlab='Gender',                       # of the absolute frequency
     ylab='Absolute frequencies',
     main='Barplot Gender')
graphics.off()

# See the absolute frequencies table
# Using table()
Gender_abs <- table(Gender) 
Gender_abs

# Relative frequencies table
# - rel freq = number of items of a class divided for the total number of items
# - rel freq is always a number between 0 and 1
# Relative frew can be calculated using 
# prop.table() function 
# It converts counts (frequencies) into proportions (relative frequencies)
Gender_rel <- prop.table(Gender_abs)  
Gender_rel

# Barplot (relative frequencies)
windows()
barplot(Gender_rel,col=c('slateblue','plum2'),xlab='Gender',ylab='Relative frequencies',main='Barplot Gender')
graphics.off()

# Pie chart
windows()
pie(Gender_rel,col=c('slateblue','plum2'),labels=c('Male','Female'),main='Pie chart Gender') 
graphics.off()

# Compute the mode (most frequent item)
Gender_abs[Gender_abs==max(Gender_abs)] # get the value which corresponds to the maximum one

#### Analysis of the quantitative variable Height ####

# Compute the main location and dispersion parameters
mean(Height) # sample mean (average value)
var(Height) # Unbiased sample variance (avreage squared deviation from the mean)
sd(Height) # Unbiased sample standard deviation (spread of values around the mean)
min(Height) # Minimum
max(Height) # Maximum
median(Height) # Median (middle value)
# Median and mean are very similar -> probably the distribution is symmetric

# Quantile of order alpha:
# Point q_alpha such that P(X<=q_alpha)=alpha
quantile(Height,0.25) # First quartile Q1 (25th percentile of observations)
quantile(Height,0.50) # Second quartile Q2 (50th percentile of observations, the median)
quantile(Height,0.75) # Third quartile Q3 (75th percentile of observations)

# In a single command...
summary(Height)

# Histogram
# hist(dataset, breaks - number of intervals/bar, title, ...)
# is important to choose the right size 
hist(Height,10,main='Histogram Height') 
hist(Height,main='Histogram Height',prob=TRUE) # prob = TRUE changes the y-axis from frequency to density
# Higher density means that observations are more concentrated in that interval
# The probability of an interval is represented by the area of its bar
# So:
#   - Height → density (how concentrated the observations are)
#   - Area of one bar → proportion/probability of observations in that interval
#   - Total area of all bars → 1 (100%)

# We can specify the number of breaks (classes+1), using the argument 'breaks' 
windows()
par(mfrow=c(4,1)) # Four plots in the same graphics device - split the window in 4 rows an 1 col
hist(Height,main='Histogram Height',prob=TRUE,breaks=3)
hist(Height,main='Histogram Height',prob=TRUE,breaks=6)
hist(Height,main='Histogram Height',prob=TRUE,breaks=12)
hist(Height,main='Histogram Height',prob=TRUE,breaks=24)
graphics.off()

# R doesn't always follow our choice exactly... but we can specify the breaks exactly
windows()
par(mfrow=c(2,2))
hist(Height,main='Histogram Height',prob=TRUE,breaks=seq(min(Height),max(Height),length.out=3))
hist(Height,main='Histogram Height',prob=TRUE,breaks=seq(min(Height),max(Height),length.out=5))
# in the examples above breaks indicates:
#   - min value of height
#   - max value of height
#   - number of breakpoints (that are the limits of the intervals)
#     so, if the breakpoints are 3 (min, value in the middle, max), 
#     there will be 2 intervals.
hist(Height,main='Histogram Height',prob=TRUE,breaks=c(150,160,165,190,203))
hist(Height,main='Histogram Height',prob=TRUE,breaks=c(150,155,170,175,190,195,203))
# in the examples above breaks are simply indicated by a vector of specific breakpoints
graphics.off()

# Boxplot
# - the first bar of the box is the first quartile
# - the second bar is the median (second quartile)
# - the third one is the third quartile
# the difference between the third quartile and the first one is called INTERQUARTILE RANGE
# then, there are the whiskers (baffi) and the outliers (above and below the whiskers)
# - Outliers are observations that are unusually far from the majority of the data distribution

#        ─────────  ← upper whisker
#            │
#            │
#       ┌─────────┐  ← Q3 (75th percentile)
#       │         │  
#       │─────────│  ← Q2 = Median (50th percentile)
#       │         │  
#       └─────────┘  ← Q1 (25th percentile)
#            │
#            │
#        ─────────  ← lower whisker

windows()
boxplot(Height,ylab='Height',main='Boxplot Height')
graphics.off()

# GET the outliers 
# to remove the outliers is possible to use "$out"
# $out contains the values of the outliers
outliers <- boxplot(Height,plot=FALSE)$out   # plot = FALSE means calculate the boxplot, but don't draw it

# remove the outliers from the height values
# using -which() -> remove by index
# which() is used to find the positions (indices)
Height.whithout.outliers <- Height[-which(Height==outliers)] # find the positions of the heights equal to outliers, and remove them (-)
#  or 
# using %in% -> remove by values
h <- Height[!Height %in% outliers] # keep the heights that are not equal to the values in outliers


graphics.off()


#### Comparing the groups of male and female ####
# Are males higher than females?

# Histograms, divided in groups
windows()
par(mfrow=c(2,1))
# hist of only male (Gender == 0)
hist(Height[Gender=='0'],prob=TRUE,xlab='Height',main='Histogram Males',
     col='slateblue',xlim=range(Height),ylim=c(0,0.06),breaks=seq(150,210,by=5))
# hist of only female (Gender == 1)
hist(Height[Gender=='1'],prob=TRUE,xlab='Height',main='Histogram Females',
     col='plum2',xlim=range(Height),ylim=c(0,0.06),breaks=seq(150,210,by=5))
graphics.off()

summary(Height[Gender=="0"])
summary(Height[Gender=="1"])

# Who spends more money to cut hair between men and women?
# Boxplot, divided in groups
# tilde in Windows is Alt+126
windows()
boxplot(Haircut~Gender,col=c('slateblue','plum2'),names=c('Males','Females'),main="Haircut - Males and females")
graphics.off()

# Compute the main location and dispersion parameters
Haircut_male=Haircut[which(Gender=='0')]
# same thing of -> Haircut_male=Haircut[Gender=='0'] 
# but with which() is possible to find the indices
Haircut_female=Haircut[which(Gender=='1')]

summary(Haircut_male)
summary(Haircut_female)

#### Studing relationships between variables ####
# Is the length of sleep for a student related to the time at which he or she goes to bed?
Hours_of_sleep=WakeUp-ToSleep
studentdata=cbind(studentdata,Hours_of_sleep) #cbind to merge columns
head(studentdata)

# Scatterplot of ToSleep versus Hours_of_sleep
windows()
plot(ToSleep,Hours_of_sleep,xlab='Time at which the student goes to bed',
     ylab='Length of sleep',main="Scatterplot of Hours_of_sleep against ToSleep")

# Correlation between ToSleep and Hours_of_sleep
# using cor()
# correlation is a value between -1 and 1. 
cor(ToSleep,Hours_of_sleep)
graphics.off() 

# !!! CORRELATION IS NOT CAUSATION 

detach(studentdata)


##############
# EXERCISE 2 #
##############

# Descriptive analysis of the categorical variable in file 'patients_registry.txt', 
# that contains data about patients with heart attack
# 3 variables:
# HOSPITAL:        ID of the hospital where the patient arrives
# TIME_TO_SURGERY: time (min) between the onset of the heart attack and the surgery
# VEHICLE:         vehicle used to reach the hospital
#                  CAR:       private car
#                  FLYCAR:    ambulance emergency response vehicle
#                  AMBULANCE: ambulance
#                  TRANSFER:  programmed transfer from a different hospital

# How many patients do we have?
# How many patients used their private car to reach the hospital?
# For how many patients we don't know the vehicle used? (tip: use command 'is.na')
# Describe the variable VEHICLE using graphics
# Which is the mode of the variable VEHICLE?

# NOTE: there are some missing values (NA) in the data

patients=read.table('data/patients_registry.txt',header=TRUE)

attach(patients)

head(patients)

dim(patients)
length(which(VEHICLE=="CAR"))
is.na(VEHICLE)
sum(is.na(VEHICLE))

#barplot

windows()
plot(VEHICLE, xlab="vehicle", ylab="Absolute frequencies", main= "Barplot for vehicles") 
class(VEHICLE)
# Error: vehicle is a vector of characters, but characters have infinite possible values. If you convert 
# it in factor, then the unique possible values are "CAR", "FLYCAR", "AMBULANCE" and "VEHICLE".
plot(as.factor(VEHICLE), xlab="vehicle", ylab="Absolute frequencies", main= "Barplot for vehicles")
graphics.off()
#Tables

vehicle_abs <- table(VEHICLE)
vehicle_abs

vehicle_rel <- prop.table(vehicle_abs)

# Barplot (relative frequencies)
windows()
barplot(vehicle_rel,xlab='Vehicle',ylab='Relative frequencies',main='Barplot VEHICLE')
graphics.off()
# Pie chart
windows()
pie(vehicle_rel,col=rainbow(length(vehicle_rel)),main='Pie chart VEHICLE') 
graphics.off()
#Mode
mode <- vehicle_abs[vehicle_abs==max(vehicle_abs)]
mode


##############
# EXERCISE 3 #
##############

# Descriptive analysis of the quantitative data in file 'temperature.txt'. 
# 130 observations of 3 variables
# Temperature: body temperature (Fahrenheit degrees)
# Sex:         M=man, W=woman
# HeartBeats:  pulses for minute 

# Is the distribution of the temperature symmetric?
# Are there any outliers?
# Are there any differences between the temperature in men and women?

# NOTE: decimal points are here indicated with a comma, so we must use the argument 'dec=',''
#       when we import the dataset


temp <- read.table('data/temperature.txt',header=TRUE,dec=',')
attach(temp)


windows()
par(mfrow=c(2, 1))
hist(Temperature)
summary(Temperature)
boxplot(Temperature~as.factor(Sex))

# Sample mean and median are two different measures of central tendency
# If the mean and median are very similar, the distribution may be approximately symmetric
# - Mean is sensitive to outliers → extreme values can strongly affect it.
# - Median is less sensitive to outliers → extreme values have little effect on it.