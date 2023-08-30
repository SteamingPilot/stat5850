#######################################
# An Overview of Statistical Learning #
#######################################

# Import the data set (income.txt) to R
# Set the working directory using menu manipulation
# or setwd("~/Dropbox/WMU/TEACHING/STAT 5850 Applied Data Mining (Fall 2023)/Lecture Slides/Lecture 1")
income_data <- read.table("income.txt", header = T)
income_data

# Education: Years of Education
Education # Unavailable

# To make the columns of the data available by name
attach(income_data)
Education # Available now

# How many individuals (observations) in the data set?
nrow(income_data)

# R provides basic statistics functions
max(Income)
min(Income)
mean(Income)
var(Income)

# Predict income using years of education
# Fit a simple linear regression of income on education years and look at the analysis.
fm <- lm(Income ~ Education, data = income_data)
summary(fm) # We will learn later in class how to interpret the results

predict(fm, data.frame(Education = c(16)))

# Fit a smooth regression curve using a local fitting.
lrf <- loess(Income ~ Education, income_data) 

# On-line help
help(loess) 
?loess

# Make a standard scatterplot.
plot(Education, Income, xlab = "Years of Education") 
plot(Education, Income, xlab = "Years of Education", pch = 16)
plot(Education, Income, xlab = "Years of Education", pch = 16, col = "brown")

abline(fm, col = "blue") # Add simple linear regression line. 

lines(spline(Education, fitted(lrf)), col = "red") # Add smooth regression curve




