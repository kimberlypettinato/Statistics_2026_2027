# STATISTICS LABORATORY 
# LESSON 1 - 16/09/2026

# INTRO TO R
# • matrix and vectors
# • basic functions
#   - seq()
#   - rep()
#   - heplp()
#   - is.matrix() 
#   - as.matrix()
#   - length()
# • element retrieval by indecies 
#   in vectors and matrixes
# • ls() and rm() 
# • operations and matrix multiplication
# • functions for operations
#   - sum()
#   - prod()
#   - colSums()
#   - rowSums()
# • booleans variables
# • conditional if(){}
# • loops
#   - for()
# • dataframes
# • graphics (plot, points, lines)
# • build a function
# • browser() for debugging


##### R can be used as calculator
5*12
sqrt(9)
log(210)
log10(100)
exp(1)


########################################################
##### Matrixes and vectors #############################
########################################################
# use the <- or = to store data in the environment
a <- 2
b = 2 # the = sign is used also for the functions
      # for that reason, is usually used <- to assign
      # a variable
a == b


# build matrix
# first value = the matrix data
# second value = nrow
# third value = ncol
matrix(0, nrow = 3, ncol = 2)

# vectors
v1<- c(1, 2, 3, 4, 5)
v2 <- 6:10 # another way to create a vector
v2


# create a vector with numbers separate by 0.5 value each
# using seq() -> sequence
v3 <- seq(0, 5, by = 0.5)
# seq(from first value, to second value,
#      each distanced by third value)
v3


# help()
# help + function -> to get information 
# about the function 
help(seq)


# create a vector made by same numbers
# using rep()
v4 <- rep(1, 10)
# rep(value to repeat, number of time to repeat)
v4

# create a vector made by others vectors
v5 <- c(v3, v4)
v5


# back to the matrixes
matrix(1:12) # this give a vector as result
matrix (1:12, nrow = , ncol =) # to build a matrix

matrix(1:12, 3, 3)
# this give a warning because the data length is
# different from the size of the matrix

m1 <- matrix(1:12, 3, 4)
# by default, matrixes are filled by column

m2 <- matrix (1:12, 3, 4, byrow = TRUE)
# byrow = TRUE allows to fill by rows
m2
m1

# another way to build matrixes is
# by combining vectors
v6 <- (1:5)
v7 <- (6:10)

# cbind()
# to combine vectors as columns
m3 <- cbind(v6, v7)
m3

# rbind()
# to combine vectors as rows
m4 <- rbind(v6, v7)
m4

# t() 
# to invert columns and rows in a matrix
# (transposition)
m5 <- t(m4)
m5

# a matrix is called "simmetric"
# if this is equal to the transposed one


# check the structure
is.matrix(v6)
# to check if v6 is a matrix
# this will returne FALSE because
# v6 is a vector

# however, 
# with as.matrix() function
# is possible to change it in a matrix
v6 <- as.matrix(v6)
is.matrix(v6)
v6

# length() function
# to get information about the length 
# of a vector
length(v6)

# retrieval an element in a vector
# using []
v6[7] # this gives NA because v6 has only 5 values
v6[1] # this gives the first level (that is 1)
v6[1:2] # to get the first 2 elements
v6[c(1, 3)] # to get the first and the third element
# i can get the element of a vector
# using [] and their indicies

# to get an element from a matrix
# i need the indiex of the row and the column 
# of that element
m3
m3[2, 2] # element in second row and second column
m3[1:2, 2] # elements of the first two rows in the second column

m3[1, ] # to get all the first row
m3[ , 2] # to get all the secon column


# ls()
# to get the list of all the element that
# are in the environment
ls()

#rm()
# to remove elements from the environment
rm(m3)
rm(list = ls()) # to remove everything



########################################################
##### operations with variables ########################
########################################################

a = 1 
b = 2
# a and b are one dimentional elements -> scalar
# operations are in the standard way
a+b
a-b
a/b
a*b
a^b

c <- c(2, 3, 4)
d <- rep(10, 3)

e <- 1:3
f <- rep(10, 5)

e+f
# because of f if longer then e, 
# each element of e is sums by an f element,
# start again with the first until all f elements 
# have been summed

a + e
# same situation with the 
# sum of a scalar and a vector

m1 <- matrix(1:12, 4, 3)
m2 <- rbind(rep(0,3), 1:3, 10:12, c(4, 7, 1))
m1
m2


m1 + m2
# return  a matrix that has, for each element, 
# the sum of the elements of the two matrix

m1 * m2
# this return the multiplication of each element
# (not the normal matrix multiplication)

m1 %*% m2 
# this allow to do the matrix multiplication

# these matrixes are not complatibles for a 
# matrix multiplication because 
# the number of rows of the first matrix
# must be the same of the columns of the second one
# so, to fix that, let's check dimensions
dim(m1)
dim(m2)

# to fix that, is possible to transpose 
m2 <- t(m2)
dim(m2)

m1 %*% m2 # matrix multiplication

m1 + a # at each element of matrix is added the value of a

m1 * a # each element is multiplicated for a


### function for operations

# sum()
# to get the sum of each element of a vector/matrix
sum(e)
sum(m1)

# prod()
# to get the product of each element
prod(e)
prod(m1)


# colSums()
# to get the sum of each column in a matrix
colSums(m1)

# rowSums()
# to get the sum of each row in a matrix
rowSums(m1)

########################################################
##### boolean variables ################################
########################################################

# boolean variables used to store value as TRUE or FALSE

a
bool1 <- a == 1
bool1

a == 1 # equal
a != 2 # different
a != 1
a > 1 # greater 



# booleans are important to build
# scripts that do something only if
# specifics conditions are satisfied

########################################################
##### conditional: if ##################################
########################################################

if(a == 1){       # is a equal to 1? TRUE
  cat("hello")    # so, say hello.
}else{            # if is not true, say bye
  cat("bye")
}

if(a > 1){      
  cat("hello")    
}else{            
  cat("bye")
}


########################################################
##### loops ############################################
########################################################
g <- c(e, f)
g

### for() loop
# that enter and check each element of a vector
for(i in 1:10){
  cat(i)
}
# for each element from 1 to 10 print each element

# the last one element of a vector 
# has index = length(vector)
g

for(i in 1:length(g)){
  g[i] <- g[i]-1
}

# for each element i of g
# change the element i of g, in i-1
g

########################################################
##### dataframes #######################################
########################################################

exam = data.frame(id = c(123, 456, 789),
                  written = c(10, 30, 32),
                  projects = c(30, 27, 25)
                    )
exam
# build a dataframe:
# name before = is the column name,
# subsequent values are the rows values.

# to get only one column of a dataframe 
# use dollar symbol ($)
exam$id
written <- exam$written

# another way is with 
# attach() and detuch() 
attach(exam)
id
detach(exam)



########################################################
##### graphics #########################################
########################################################

x = 0:3
y <- c(4, 5, 6, 10)

# plot()
plot(x, y)

plot(x, y, pch = 19) # pch = number, to change dots style

plot(x, y, type = "o") # type = "letter", to change style

plot(x, y, type = "l", col = "red") # col to change color

x11() # allows to open a new window to visualize the plot
plot(x, y, 
     type = "l", 
     col = "blue")

# points() 
# to add points in the plot
y2 <- c(2, 8, 9, 4)
points(x, y2,
     pch = 17,
     col = "forestgreen")

# lines()
# to add lines in the plot
lines(x, y2)


########################################################
##### build a function #################################
########################################################

# heaviside_step_function()
# The Heaviside function, also called the Heaviside step function 
# or unit step function, 
# is a mathematical function that equals zero for negative numbers 
# and one for positive numbers

heaviside_step_function <- function(x){
  if(x<0) return(0)
  return(1)
}

heaviside_step_function(0)
heaviside_step_function(3)
heaviside_step_function(-1)



########################################################
##### browser() ########################################
########################################################

# browser()
# is a function for debugging

heaviside_step_function <- function(x){
  browser()
  if(x<0) return(0)
  return(1)
}

# now, when the function is called
# there will be open a new page with this function, 
# in that way is easier to check inside 
# the function step by step
heaviside_step_function(0)

# to get out from the debugging
# write Q on the console


