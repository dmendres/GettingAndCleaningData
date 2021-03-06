# GCDREADME.rmd
dmendres  
July 23, 2015  

# Introduction to Getting and Cleaning Data course project repository.
This repository contains R-Scripts used to run an analysis on the Human Activity Recognition data set published by Reyes-0rtiz, et al. (obtained from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and described in [1]

# Description of Raw Data
As described in the documentation accompanying the data set, this data was collected from the accelerometer and gyroscope readings of a Samsung Galaxy S II smartphone worn on the waist as test subjects performed each of six activities ((WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING).

## Transformation already applied in the Raw Data
Prior to delivery, the data was preprocessed by filtering and sampling. The gravitional acceleration component was separated from the body motion acceleration. Fourier transform was used to obtain frequency domain observations. The data was then normalized to a range of -1.0 to 1.0. In addition to the separate X,Y, and Z components (denoted -{X,Y,Z} in the feature discussion, below), vector magnitudes have also been computed. Additional transformations have been applied to obtain a set of derived variables from the signals (descriptions courtesy the "features_info.txt" file provided with the data set):

- mean(): Mean value 
- std(): Standard deviation 
- mad(): Median absolute deviation 
- max(): Largest value in array 
- min(): Smallest value in array 
- sma(): Signal magnitude area 
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy 
- arCoeff(): Autorregresion coefficients with Burg order equal to 4 
- correlation(): correlation coefficient between two signals 
- maxInds(): index of the frequency component with largest magnitude 
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency 
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. 
- angle(): Angle between to vectors.

Additional vectors from signal average on the angle() variable: 

- gravityMean 
- tBodyAccMean 
- tBodyAccJerkMean 
- tBodyGyroMean 
- tBodyGyroJerkMean

## Units of Raw Data
While the original data included time and frequency domain measurements of acceleration (SI Unit m/s^2) and angular velocity (SI Unit rad/s), the variables as delivered have already been normalized to the range -1.0 to 1.0, so these features are essentially unitless.

# Processing Steps
*Preconditions* Download and unzip the data from the URL shown above. The run_analysis script assumes it is started in a directory containing itself and the prettyNames.R file. It assumes the raw data obtained from the URL above is unzipped into a subdirectory titled "data/UCI HAR Dataset/".

1. **Step 1, Load and combine the data sets.** The data must be combined in two dimensions: the rows of the test and training data are to be combined into one table for each type of data. Then we must combine the columns of the multiple types of data:  S (subject), X (features), and Y (codes for the learned activity) data. When the data is loaded, we wish to specify the column classes and the column names. All of the columns in the X data are loaded as numeric. The column names are set using the "features.txt" file in the data set. These column names are cleaned slightly to remove characters that interfere with their use in subsequent processing (parens and dashes are mapped to a period, ".", the comma used in angle features is mapped to an underscore, "_"). After reading the three tables for each of the training and test data sets, we validate the loaded data dimensions to ensure the tables are compatible. Then we combine the three types of data as columns in a data.table, one each for test and training data. Finally we row-bind the two data.tables into a combined table with the subjects, activities and features variables in the columns and one row per observation. This last step undoes the random partitioning of the data into test and training described in the data set README.txt. The result of this step is the dtSYXCombined data.table.

2. **Step 2, Extract *all* of the standard deviation (std) and average (mean) features in the data set.** This is accomplished by running some pattern matching (grep) code on the feature name table loaded above with a regular expression that captures the intent of the course project. We emphasize that all matching features are extracted, i.e. every feature with some notation that it is a "mean". "Mean", "std", or "Std" is selected. The result is another data.table with the SubjectCode, ActivityCode and the selected features. At this point, all of the preceeding tables could be removed from the Environment, but for diagnostic purposes, I haven't done this. The result of this step is the dtSYMeanStd data.table.

3. **Step 3, Use descriptive activity names.** Using the factor function, it is very straight forward to load the "activity_labels.txt" file from the data set and create the activityFactor factor from the columns of the table. We insist that the factor be ordered to override the default alphabetic ordering which is not very meaningful.
We add a column (at the end, unfortunately) to the observations which provides the activity factor. The result of this step is the dtSYMeanStd data set with an additional "Activity" column.

4. **Step 4, Label the data set with descriptive names.** This step requires some non-trivial text processing on the feature names of the original data set. We encapsulate the decisions about how to pretty the names and the rather (to me) messy pattern matching code that implements these decisions in the prettyNames function. Python or Perl might have been a better tool to use in this step. 
  + The prettyNames function parses the feature name to determine what measurement, what object, what spatial component (if any) or vector magnitude the feature represents. Additionally, it distinguishes mean and standard deviation, time and frequency domain features, Jerk measurements, and some special cases: mean frequency, angle of two directions, and the subject and activity descriptors we wish to leave unmodified.
  + The script applies the prettyNames function to each column name to obtain a new, more user-friendly feature name list and replace the column names of the combined data.table, dtSYMeanStd. We reorder columns to force Activity and SubjectCode to be the first two columns as we will subsequently summarize and order the data with these columns.
  
5. **Step 5, Create a second, independent tidy data set with the average of each variable for each activity and each subject.** This step entails some interpretation of the project specifications. While I prototyped code to separately average by activity and subject, I didn't submit this result. The interpretation I choose to apply was a two-step summary, first by activity and then by subject. This is quite straightforward with data.table operations using lapply(.SD, mean) as the "j" term and both Activity and SubjectCode columns specified in the "by" term. The data is then ordered by these columns. Although extremely redundant, it be pedantically clear, the column names of this new summary data table are pre-pended with "Summary.Mean.". While it could have been done earlier, the redundant ActivityCode column is dropped in this step. Finally the resulting data.table (dtfeatureMeanByActivityAndSubject) is written. Checking code is provided, but not enabled which re-reads the data, checks dimensions and dumps the head and tail of the re-loaded table.

*Postcondition* The tidy data set is written to the same directory from which the data was loaded.

# Result
The "wide tidy" data file (tidyActivitySubjectFeatureMean.txt) contains 180 "observations" of the means of the "mean" and "std" features of the original data set, corresponding to 6 activities X 30 subjects tested on all activities. It has two descriptive columns, Activity and SubjectCode. It has 86 other columns containing summary (mean), by activity and subject, of the data extracted in Step 2. These data are named with user-friendly names such as "Mean of X component of Acceleration of Subject Body", "Standard Deviation of Vector Magnitude of Acceleration of Subject Body, or "Angle between Z orientation of device and the mean direction of Gravity". I note that when read.table loads this file, it converts the spaces in the column names to ".", but the actual tidy data file contains spaces in the header column names.


# References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
