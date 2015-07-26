# This script performs the data tidying on the UCI HAR Dataset
# as specified for the Coursera Getting and Cleaning Data course project:
##  You should create one R script called run_analysis.R that does the following. 
### 1. Merges the training and the test sets to create one data set.
### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
### 3. Uses descriptive activity names to name the activities in the data set
### 4. Appropriately labels the data set with descriptive variable names. 
### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Assume the data is in the following directory, relative to the current WD: "data\UCI HAR Dataset"

oldWD <- getwd()
#we're using data.table for most of the data set manipulations
library(data.table)

#prettyNames.R encapsulates our design decisions regarding mapping of feature names of the data set to user-friendly names
#(but only for the selected mean & std features)
source("prettyNames.R")

setwd("data/UCI HAR Dataset/")

#Step 1: load and combine the test and training data sets into one data set
#magic number, we know there are 561 variables in the test and training data set
numVars <- 561
# we want to be specific about the class of each column
xClasses <- rep(c("numeric"), numVars)

#we also want to be specific about the names of the columns
#conveniently, the meta-data provides a table of column names (although we pretty them up below)
#we are going to use these as data when we want to find the variables that correspond to mean and standard deviation, as well

dtFeatures <- data.table(read.table("features.txt", stringsAsFactors = F, col.names = c("columnNumber", "columnName")))
dtFeatures[, cleanedColumnName := gsub("-|\\(|\\)",".",columnName)]
dtFeatures[, cleanedColumnName := gsub(",","_",cleanedColumnName)]
# Read each file into a data.table
##Apologies here, I can't make fread use general white space for a separator, so we read a data.frame with read.table and convert to data.table

# read, respectively, the features, the activity and the subject for each observation in the test data set
dtXTest <- data.table(read.table("test/X_test.txt",  header = F, sep="", 
                                 colClasses = xClasses, col.names = dtFeatures$cleanedColumnName))
dtYTest <- data.table(read.table("test/y_test.txt", colClasses = c("integer"), col.names = c("ActivityCode")))
dtSTest <- data.table(read.table("test/subject_test.txt", colClasses = c("integer"), col.names = c("SubjectCode")))

#ditto for the training data
dtXTrain <- data.table(read.table("train/X_train.txt",  header = F, sep="", 
                                  colClasses = xClasses, col.names = dtFeatures$cleanedColumnName))
dtYTrain <- data.table(read.table("train/y_train.txt", col.names = c("ActivityCode")))
dtSTrain <- data.table(read.table("train/subject_train.txt", colClasses = c("integer"), col.names = c("SubjectCode")))

## ASSERT precondition: data set components have same row count, otherwise the binds will be garbage
stopifnot(dim(dtXTest)[[1]] == dim(dtYTest)[[1]] | ! dim(dtYTest)[[1]] == dim(dtSTest)[[1]])
stopifnot(dim(dtXTrain)[[1]] == dim(dtYTrain)[[1]] | ! dim(dtYTrain)[[1]] == dim(dtSTrain)[[1]])

## AND, ASSERT that the components have the same column counts between test and training data
stopifnot(dim(dtXTest)[[2]] == dim(dtXTrain)[[2]])
stopifnot(dim(dtYTest)[[2]] == dim(dtYTrain)[[2]])
stopifnot(dim(dtSTest)[[2]] == dim(dtSTrain)[[2]])

dtSYXTest <- data.table(dtSTest, dtYTest, dtXTest)
dtSYXTrain <- data.table(dtSTrain, dtYTrain, dtXTrain)

# TODO: we could first filter the columns so we minimize the size of the combined data set
# But, this is the combined test and training data as specified for Step 1.
dtSYXCombined <- rbind(dtSYXTest, dtSYXTrain)



# Step 2: extract the std and mean measurements (retaining the Subject and Activity information)

dtMeanOrStdCols <- dtFeatures[grep("mean|std", dtFeatures$cleanedColumnName, ignore.case = T),]
dtSYMeanStd = data.table(dtSYXCombined[,.(SubjectCode, ActivityCode)],
                         dtSYXCombined[,dtMeanOrStdCols$cleanedColumnName, with = FALSE])
## TODO: we could cleanup some of the unused data tables now...
#rm("dtXTest", "dtSTest", "dtYTest", "dtXTrain", "dtSTrain", "dtYTrain", "dtSYXTest", "dtSYXTrain", "dtSYXCombined")


# Step 3: Use descriptive activity names

## Create a factor for activities, add a column to the data set with the activity name
## here we don't care that we have a data.frame
activityLabels <- read.table("activity_labels.txt", col.names = c("ActivityCode", "Activity"))
activityFactor <-factor(activityLabels$Activity, ordered=T)

#add the activity factor as a new column
dtSYMeanStd[,Activity := activityFactor[ActivityCode]]


# Step 4: Label the data set with descriptive names
## we need some text processing here: prettyNames.R encapsulates the mappings
setnames(dtSYMeanStd,colnames(dtSYMeanStd),make.names(sapply(colnames(dtSYMeanStd), prettyNames)))

# order the columns so SubjectCode and Activity are the first two columns
cnames <- colnames(dtSYMeanStd)
nCols <- length(cnames)
setcolorder(dtSYMeanStd,c("Activity", "SubjectCode", cnames[3:nCols-1]))


# Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject

# to me, this is subject to some interpretation: it could mean one table by Subject and a separate table by Activity?
# #The following steps would accomplish that...
# #but the project description also states to upload ONE table so we aren't running these steps
# dtFeatureMeanBySubject <- dtSYMeanStd[,lapply(.SD, mean),by = SubjectCode]
# # remove meaningless columns (averaged activities)
# dtFeatureMeanBySubject[,c("Activity", "ActivityCode") := NULL]
# 
# dtFeatureMeanByActivity <- dtSYMeanStd[,lapply(.SD, mean), by = Activity]
# #ditto on meaningless column (averaged subject code)
# #diagnostic, temporarily disable
# dtFeatureMeanByActivity[,c("ActivityCode","SubjectCode") := NULL]

#interpreting the course project instructions to mean to average "each variable for each ACTIVITY and [then?] each SUBJECT" 
#so, somewhat counter to intuition, we average, and order, by Activity first, then SubjectCode
# the following steps compute the activity average for each subject ()
dtfeatureMeanByActivityAndSubject <- dtSYMeanStd[,lapply(.SD, mean), by = c("Activity", "SubjectCode")]

#ensure the data set is orderd by Activity first, then SubjectCode
setorder(dtfeatureMeanByActivityAndSubject, Activity, SubjectCode)

setnames(dtfeatureMeanByActivityAndSubject,colnames(dtfeatureMeanByActivityAndSubject),
         make.names(sapply(colnames(dtfeatureMeanByActivityAndSubject), addSummaryMeanToVariableNames)))
# drop ActivityCode
dtfeatureMeanByActivityAndSubject[,ActivityCode := NULL]

write.table(dtfeatureMeanByActivityAndSubject,row.names = F , file = "tidyActivitySubjectFeatureMean.txt")



#finally, restore wd
setwd(oldWD)

# # checking the result
# checkTidy <- data.table(read.table("data/UCI HAR Dataset/tidyActivitySubjectFeatureMean.txt", header = T))
# stopifnot(all.equal(dim(checkTidy),dim(dtfeatureMeanByActivityAndSubject)))
# summary(checkTidy)
# head(checkTidy[,.(Activity, SubjectCode)])
# tail(checkTidy[,.(Activity, SubjectCode)])
