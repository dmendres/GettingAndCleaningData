# Codebook for Getting and Cleaning Data Course Project
dmendres  
23 July, 2015  

## Project Description
This is the course project for the Coursera *Getting and Cleaning Data" course code "getdata-030". The original "raw" data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
The descriptive information for the study design, data collection, and the processing steps can be found in the GCDReadme.html, in this same repository. The original ("raw") data is described in the README.txt and feature_info.txt. The original feature names are listed, by column number, in features.txt. This descriptive information is included by reference in the current document.

## Description of the variables in the "tidyActivitySubjectFeatureMean.txt" file
The resulting "wide tidy" data file contains 180 summary observations of the means of the "mean" and "std" features of the original data set, corresponding to 6 activities X 30 subjects tested on all activities. It has two descriptive columns, Activity and SubjectCode. It has 86 other columns containing summary (mean), by activity and subject, of the data extracted from the merged raw data sets. These data are named with user-friendly (but valid) column names such as "SummaryMeanof.Mean.of.X.component.of.Acceleration.of.Subject.Body", "SummaryMeanof.Standard.Deviation.of.Vector.Magnitude.of.Acceleration.of.Subject.Body"", or "SummaryMeanof.Angle.between.Z.orientation.of.device.and.the.mean.direction.of.Gravity".

### Activity is the activity corresponding to the observed data.
It is a factor with 6 levels: LAYING < SITTING < STANDING < WALKING < WALKING DOWNSTAIRS < WALKING UPSTAIRS, representing the study activities.

### SubjectCode is the code of the subject performing the activity.
There are 30 subjects in the study data set. The data was randomly partitioned into training and test sets by subject, but I have recombined these partitions for the current study.

### Numeric Features
All of the remaining variables constitute the output variables of the current study.

The output of this project is a table of mean values, summarized by activity and subject, of the mean or standard deviation  columns (or other "mean-like" variables such as "freqMean" and "gravityMean") extracted from the raw data set. For clarity, we label these output variables with a prefix of "SummaryMean.of." in the tidy data variables.

These numeric features are named according to mean or standard deviation, domain (time, frequency), measurement, what object, what spatial component (if any) or vector magnitude the feature represents. Additionally, we distinguishes some special cases: mean frequency, angle of two directions.

All remaining variables are numeric, and due to normalization (to the range -1.0 to 1.0) applied to the raw data set, they are essentially unitless.

#### Variable descriptive names

Column Number  |  (User-friendly) Column Name  
--------------  |----------------------------  
3  |  SummaryMean.of.Mean.of.X.component.of.Acceleration.of.Subject.Body  
4  |  SummaryMean.of.Mean.of.Y.component.of.Acceleration.of.Subject.Body  
5  |  SummaryMean.of.Mean.of.Z.component.of.Acceleration.of.Subject.Body
6  |  SummaryMean.of.Standard.Deviation.of.X.component.of.Acceleration.of.Subject.Body
7  |  SummaryMean.of.Standard.Deviation.of.Y.component.of.Acceleration.of.Subject.Body
8  |  SummaryMean.of.Standard.Deviation.of.Z.component.of.Acceleration.of.Subject.Body
9  |  SummaryMean.of.Mean.of.X.component.of.Acceleration.of.Gravity
10  |  SummaryMean.of.Mean.of.Y.component.of.Acceleration.of.Gravity
11  |  SummaryMean.of.Mean.of.Z.component.of.Acceleration.of.Gravity
12  |  SummaryMean.of.Standard.Deviation.of.X.component.of.Acceleration.of.Gravity
13  |  SummaryMean.of.Standard.Deviation.of.Y.component.of.Acceleration.of.Gravity
14  |  SummaryMean.of.Standard.Deviation.of.Z.component.of.Acceleration.of.Gravity
15  |  SummaryMean.of.Mean.of.Jerk.X.component.of.Acceleration.of.Subject.Body
16  |  SummaryMean.of.Mean.of.Jerk.Y.component.of.Acceleration.of.Subject.Body
17  |  SummaryMean.of.Mean.of.Jerk.Z.component.of.Acceleration.of.Subject.Body
18  |  SummaryMean.of.Standard.Deviation.of.Jerk.X.component.of.Acceleration.of.Subject.Body
19  |  SummaryMean.of.Standard.Deviation.of.Jerk.Y.component.of.Acceleration.of.Subject.Body
20  |  SummaryMean.of.Standard.Deviation.of.Jerk.Z.component.of.Acceleration.of.Subject.Body
21  |  SummaryMean.of.Mean.of.X.component.of.Angular.velocity.of.Subject.Body
22  |  SummaryMean.of.Mean.of.Y.component.of.Angular.velocity.of.Subject.Body
23  |  SummaryMean.of.Mean.of.Z.component.of.Angular.velocity.of.Subject.Body
24  |  SummaryMean.of.Standard.Deviation.of.X.component.of.Angular.velocity.of.Subject.Body
25  |  SummaryMean.of.Standard.Deviation.of.Y.component.of.Angular.velocity.of.Subject.Body
26  |  SummaryMean.of.Standard.Deviation.of.Z.component.of.Angular.velocity.of.Subject.Body
27  |  SummaryMean.of.Mean.of.Jerk.X.component.of.Angular.velocity.of.Subject.Body
28  |  SummaryMean.of.Mean.of.Jerk.Y.component.of.Angular.velocity.of.Subject.Body
29  |  SummaryMean.of.Mean.of.Jerk.Z.component.of.Angular.velocity.of.Subject.Body
30  |  SummaryMean.of.Standard.Deviation.of.Jerk.X.component.of.Angular.velocity.of.Subject.Body
31  |  SummaryMean.of.Standard.Deviation.of.Jerk.Y.component.of.Angular.velocity.of.Subject.Body
32  |  SummaryMean.of.Standard.Deviation.of.Jerk.Z.component.of.Angular.velocity.of.Subject.Body
33  |  SummaryMean.of.Mean.of.Vector.Magnitude.of.Acceleration.of.Subject.Body
34  |  SummaryMean.of.Standard.Deviation.of.Vector.Magnitude.of.Acceleration.of.Subject.Body
35  |  SummaryMean.of.Mean.of.Vector.Magnitude.of.Acceleration.of.Gravity
36  |  SummaryMean.of.Standard.Deviation.of.Vector.Magnitude.of.Acceleration.of.Gravity
37  |  SummaryMean.of.Mean.of.Jerk.Vector.Magnitude.of.Acceleration.of.Subject.Body
38  |  SummaryMean.of.Standard.Deviation.of.Jerk.Vector.Magnitude.of.Acceleration.of.Subject.Body
39  |  SummaryMean.of.Mean.of.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
40  |  SummaryMean.of.Standard.Deviation.of.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
41  |  SummaryMean.of.Mean.of.Jerk.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
42  |  SummaryMean.of.Standard.Deviation.of.Jerk.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
43  |  SummaryMean.of.Mean.of.Fourier.transform.of.X.component.of.Acceleration.of.Subject.Body
44  |  SummaryMean.of.Mean.of.Fourier.transform.of.Y.component.of.Acceleration.of.Subject.Body
45  |  SummaryMean.of.Mean.of.Fourier.transform.of.Z.component.of.Acceleration.of.Subject.Body
46  |  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.X.component.of.Acceleration.of.Subject.Body
47  |  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Y.component.of.Acceleration.of.Subject.Body
48  |  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Z.component.of.Acceleration.of.Subject.Body
49  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.X.component.of.Acceleration.of.Subject.Body
50  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Y.component.of.Acceleration.of.Subject.Body
51  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Z.component.of.Acceleration.of.Subject.Body
52  |  SummaryMean.of.Mean.of.Jerk.Fourier.transform.of.X.component.of.Acceleration.of.Subject.Body
53  |  SummaryMean.of.Mean.of.Jerk.Fourier.transform.of.Y.component.of.Acceleration.of.Subject.Body
54  |  SummaryMean.of.Mean.of.Jerk.Fourier.transform.of.Z.component.of.Acceleration.of.Subject.Body
55  |  SummaryMean.of.Standard.Deviation.of.Jerk.Fourier.transform.of.X.component.of.Acceleration.of.Subject.Body
56  |  SummaryMean.of.Standard.Deviation.of.Jerk.Fourier.transform.of.Y.component.of.Acceleration.of.Subject.Body
57  |  SummaryMean.of.Standard.Deviation.of.Jerk.Fourier.transform.of.Z.component.of.Acceleration.of.Subject.Body
58  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Jerk.X.component.of.Acceleration.of.Subject.Body
59  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Jerk.Y.component.of.Acceleration.of.Subject.Body
60  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Jerk.Z.component.of.Acceleration.of.Subject.Body
61  |  SummaryMean.of.Mean.of.Fourier.transform.of.X.component.of.Angular.velocity.of.Subject.Body
62  |  SummaryMean.of.Mean.of.Fourier.transform.of.Y.component.of.Angular.velocity.of.Subject.Body
63  |  SummaryMean.of.Mean.of.Fourier.transform.of.Z.component.of.Angular.velocity.of.Subject.Body
64  |  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.X.component.of.Angular.velocity.of.Subject.Body
65  |  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Y.component.of.Angular.velocity.of.Subject.Body
66  |  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Z.component.of.Angular.velocity.of.Subject.Body
67  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.X.component.of.Angular.velocity.of.Subject.Body
68  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Y.component.of.Angular.velocity.of.Subject.Body
69  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Z.component.of.Angular.velocity.of.Subject.Body
70  |  SummaryMean.of.Mean.of.Fourier.transform.of.Acceleration.of.Subject.Body
71  |  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Acceleration.of.Subject.Body
72  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Vector.Magnitude.of.Acceleration.of.Subject.Body
73  |  SummaryMean.of.Mean.of.Jerk.Fourier.transform.of.Acceleration.of.Subject.Body
74  |  SummaryMean.of.Standard.Deviation.of.Jerk.Fourier.transform.of.Acceleration.of.Subject.Body
75  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Jerk.Vector.Magnitude.of.Acceleration.of.Subject.Body
76  |  SummaryMean.of.Mean.of.Fourier.transform.of.Angular.velocity.of.Subject.Body
77  |  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Angular.velocity.of.Subject.Body
78  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
79  |  SummaryMean.of.Mean.of.Jerk.Fourier.transform.of.Angular.velocity.of.Subject.Body
80  |  SummaryMean.of.Standard.Deviation.of.Jerk.Fourier.transform.of.Angular.velocity.of.Subject.Body
81  |  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Jerk.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
82  |  SummaryMean.of.Angle.between.mean.direction.of.Acceleration.of.Subject.Body.and.the.mean.direction.of.Gravity
83  |  SummaryMean.of.Angle.between.mean.Jerk.direction.of.Acceleration.of.Subject.Body.and.the.mean.direction.of.Gravity
84  |  SummaryMean.of.Angle.between.mean.direction.of.Angular.velocity.of.Subject.Body.and.the.mean.direction.of.Gravity
85  |  SummaryMean.of.Angle.between.mean.Jerk.direction.of.Angular.velocity.of.Subject.Body.and.the.mean.direction.of.Gravity
86  |  SummaryMean.of.Angle.between.X.orientation.of.device.and.the.mean.direction.of.Gravity
87  |  SummaryMean.of.Angle.between.Y.orientation.of.device.and.the.mean.direction.of.Gravity
88  |  SummaryMean.of.Angle.between.Z.orientation.of.device.and.the.mean.direction.of.Gravity

#### Summary of the study output

```r
library(data.table)
checkTidy <- data.table(read.table("data/UCI HAR Dataset/tidyActivitySubjectFeatureMean.txt", header = T))
summary(checkTidy)
```

```
##                Activity   SubjectCode  
##  LAYING            :30   Min.   : 1.0  
##  SITTING           :30   1st Qu.: 8.0  
##  STANDING          :30   Median :15.5  
##  WALKING           :30   Mean   :15.5  
##  WALKING_DOWNSTAIRS:30   3rd Qu.:23.0  
##  WALKING_UPSTAIRS  :30   Max.   :30.0  
##  SummaryMean.of.Mean.of.X.component.of.Acceleration.of.Subject.Body
##  Min.   :0.2216                                                    
##  1st Qu.:0.2712                                                    
##  Median :0.2770                                                    
##  Mean   :0.2743                                                    
##  3rd Qu.:0.2800                                                    
##  Max.   :0.3015                                                    
##  SummaryMean.of.Mean.of.Y.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.040514                                                 
##  1st Qu.:-0.020022                                                 
##  Median :-0.017262                                                 
##  Mean   :-0.017876                                                 
##  3rd Qu.:-0.014936                                                 
##  Max.   :-0.001308                                                 
##  SummaryMean.of.Mean.of.Z.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.15251                                                  
##  1st Qu.:-0.11207                                                  
##  Median :-0.10819                                                  
##  Mean   :-0.10916                                                  
##  3rd Qu.:-0.10443                                                  
##  Max.   :-0.07538                                                  
##  SummaryMean.of.Standard.Deviation.of.X.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9961                                                                 
##  1st Qu.:-0.9799                                                                 
##  Median :-0.7526                                                                 
##  Mean   :-0.5577                                                                 
##  3rd Qu.:-0.1984                                                                 
##  Max.   : 0.6269                                                                 
##  SummaryMean.of.Standard.Deviation.of.Y.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.99024                                                                
##  1st Qu.:-0.94205                                                                
##  Median :-0.50897                                                                
##  Mean   :-0.46046                                                                
##  3rd Qu.:-0.03077                                                                
##  Max.   : 0.61694                                                                
##  SummaryMean.of.Standard.Deviation.of.Z.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9877                                                                 
##  1st Qu.:-0.9498                                                                 
##  Median :-0.6518                                                                 
##  Mean   :-0.5756                                                                 
##  3rd Qu.:-0.2306                                                                 
##  Max.   : 0.6090                                                                 
##  SummaryMean.of.Mean.of.X.component.of.Acceleration.of.Gravity
##  Min.   :-0.6800                                              
##  1st Qu.: 0.8376                                              
##  Median : 0.9208                                              
##  Mean   : 0.6975                                              
##  3rd Qu.: 0.9425                                              
##  Max.   : 0.9745                                              
##  SummaryMean.of.Mean.of.Y.component.of.Acceleration.of.Gravity
##  Min.   :-0.47989                                             
##  1st Qu.:-0.23319                                             
##  Median :-0.12782                                             
##  Mean   :-0.01621                                             
##  3rd Qu.: 0.08773                                             
##  Max.   : 0.95659                                             
##  SummaryMean.of.Mean.of.Z.component.of.Acceleration.of.Gravity
##  Min.   :-0.49509                                             
##  1st Qu.:-0.11726                                             
##  Median : 0.02384                                             
##  Mean   : 0.07413                                             
##  3rd Qu.: 0.14946                                             
##  Max.   : 0.95787                                             
##  SummaryMean.of.Standard.Deviation.of.X.component.of.Acceleration.of.Gravity
##  Min.   :-0.9968                                                            
##  1st Qu.:-0.9825                                                            
##  Median :-0.9695                                                            
##  Mean   :-0.9638                                                            
##  3rd Qu.:-0.9509                                                            
##  Max.   :-0.8296                                                            
##  SummaryMean.of.Standard.Deviation.of.Y.component.of.Acceleration.of.Gravity
##  Min.   :-0.9942                                                            
##  1st Qu.:-0.9711                                                            
##  Median :-0.9590                                                            
##  Mean   :-0.9524                                                            
##  3rd Qu.:-0.9370                                                            
##  Max.   :-0.6436                                                            
##  SummaryMean.of.Standard.Deviation.of.Z.component.of.Acceleration.of.Gravity
##  Min.   :-0.9910                                                            
##  1st Qu.:-0.9605                                                            
##  Median :-0.9450                                                            
##  Mean   :-0.9364                                                            
##  3rd Qu.:-0.9180                                                            
##  Max.   :-0.6102                                                            
##  SummaryMean.of.Mean.of.Jerk.X.component.of.Acceleration.of.Subject.Body
##  Min.   :0.04269                                                        
##  1st Qu.:0.07396                                                        
##  Median :0.07640                                                        
##  Mean   :0.07947                                                        
##  3rd Qu.:0.08330                                                        
##  Max.   :0.13019                                                        
##  SummaryMean.of.Mean.of.Jerk.Y.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.0386872                                                     
##  1st Qu.: 0.0004664                                                     
##  Median : 0.0094698                                                     
##  Mean   : 0.0075652                                                     
##  3rd Qu.: 0.0134008                                                     
##  Max.   : 0.0568186                                                     
##  SummaryMean.of.Mean.of.Jerk.Z.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.067458                                                      
##  1st Qu.:-0.010601                                                      
##  Median :-0.003861                                                      
##  Mean   :-0.004953                                                      
##  3rd Qu.: 0.001958                                                      
##  Max.   : 0.038053                                                      
##  SummaryMean.of.Standard.Deviation.of.Jerk.X.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9946                                                                      
##  1st Qu.:-0.9832                                                                      
##  Median :-0.8104                                                                      
##  Mean   :-0.5949                                                                      
##  3rd Qu.:-0.2233                                                                      
##  Max.   : 0.5443                                                                      
##  SummaryMean.of.Standard.Deviation.of.Jerk.Y.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9895                                                                      
##  1st Qu.:-0.9724                                                                      
##  Median :-0.7756                                                                      
##  Mean   :-0.5654                                                                      
##  3rd Qu.:-0.1483                                                                      
##  Max.   : 0.3553                                                                      
##  SummaryMean.of.Standard.Deviation.of.Jerk.Z.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.99329                                                                     
##  1st Qu.:-0.98266                                                                     
##  Median :-0.88366                                                                     
##  Mean   :-0.73596                                                                     
##  3rd Qu.:-0.51212                                                                     
##  Max.   : 0.03102                                                                     
##  SummaryMean.of.Mean.of.X.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.20578                                                      
##  1st Qu.:-0.04712                                                      
##  Median :-0.02871                                                      
##  Mean   :-0.03244                                                      
##  3rd Qu.:-0.01676                                                      
##  Max.   : 0.19270                                                      
##  SummaryMean.of.Mean.of.Y.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.20421                                                      
##  1st Qu.:-0.08955                                                      
##  Median :-0.07318                                                      
##  Mean   :-0.07426                                                      
##  3rd Qu.:-0.06113                                                      
##  Max.   : 0.02747                                                      
##  SummaryMean.of.Mean.of.Z.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.07245                                                      
##  1st Qu.: 0.07475                                                      
##  Median : 0.08512                                                      
##  Mean   : 0.08744                                                      
##  3rd Qu.: 0.10177                                                      
##  Max.   : 0.17910                                                      
##  SummaryMean.of.Standard.Deviation.of.X.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9943                                                                     
##  1st Qu.:-0.9735                                                                     
##  Median :-0.7890                                                                     
##  Mean   :-0.6916                                                                     
##  3rd Qu.:-0.4414                                                                     
##  Max.   : 0.2677                                                                     
##  SummaryMean.of.Standard.Deviation.of.Y.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9942                                                                     
##  1st Qu.:-0.9629                                                                     
##  Median :-0.8017                                                                     
##  Mean   :-0.6533                                                                     
##  3rd Qu.:-0.4196                                                                     
##  Max.   : 0.4765                                                                     
##  SummaryMean.of.Standard.Deviation.of.Z.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9855                                                                     
##  1st Qu.:-0.9609                                                                     
##  Median :-0.8010                                                                     
##  Mean   :-0.6164                                                                     
##  3rd Qu.:-0.3106                                                                     
##  Max.   : 0.5649                                                                     
##  SummaryMean.of.Mean.of.Jerk.X.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.15721                                                           
##  1st Qu.:-0.10322                                                           
##  Median :-0.09868                                                           
##  Mean   :-0.09606                                                           
##  3rd Qu.:-0.09110                                                           
##  Max.   :-0.02209                                                           
##  SummaryMean.of.Mean.of.Jerk.Y.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.07681                                                           
##  1st Qu.:-0.04552                                                           
##  Median :-0.04112                                                           
##  Mean   :-0.04269                                                           
##  3rd Qu.:-0.03842                                                           
##  Max.   :-0.01320                                                           
##  SummaryMean.of.Mean.of.Jerk.Z.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.092500                                                          
##  1st Qu.:-0.061725                                                          
##  Median :-0.053430                                                          
##  Mean   :-0.054802                                                          
##  3rd Qu.:-0.048985                                                          
##  Max.   :-0.006941                                                          
##  SummaryMean.of.Standard.Deviation.of.Jerk.X.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9965                                                                          
##  1st Qu.:-0.9800                                                                          
##  Median :-0.8396                                                                          
##  Mean   :-0.7036                                                                          
##  3rd Qu.:-0.4629                                                                          
##  Max.   : 0.1791                                                                          
##  SummaryMean.of.Standard.Deviation.of.Jerk.Y.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9971                                                                          
##  1st Qu.:-0.9832                                                                          
##  Median :-0.8942                                                                          
##  Mean   :-0.7636                                                                          
##  3rd Qu.:-0.5861                                                                          
##  Max.   : 0.2959                                                                          
##  SummaryMean.of.Standard.Deviation.of.Jerk.Z.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9954                                                                          
##  1st Qu.:-0.9848                                                                          
##  Median :-0.8610                                                                          
##  Mean   :-0.7096                                                                          
##  3rd Qu.:-0.4741                                                                          
##  Max.   : 0.1932                                                                          
##  SummaryMean.of.Mean.of.Vector.Magnitude.of.Acceleration.of.Subject.Body
##  Min.   :-0.9865                                                        
##  1st Qu.:-0.9573                                                        
##  Median :-0.4829                                                        
##  Mean   :-0.4973                                                        
##  3rd Qu.:-0.0919                                                        
##  Max.   : 0.6446                                                        
##  SummaryMean.of.Standard.Deviation.of.Vector.Magnitude.of.Acceleration.of.Subject.Body
##  Min.   :-0.9865                                                                      
##  1st Qu.:-0.9430                                                                      
##  Median :-0.6074                                                                      
##  Mean   :-0.5439                                                                      
##  3rd Qu.:-0.2090                                                                      
##  Max.   : 0.4284                                                                      
##  SummaryMean.of.Mean.of.Vector.Magnitude.of.Acceleration.of.Gravity
##  Min.   :-0.9865                                                   
##  1st Qu.:-0.9573                                                   
##  Median :-0.4829                                                   
##  Mean   :-0.4973                                                   
##  3rd Qu.:-0.0919                                                   
##  Max.   : 0.6446                                                   
##  SummaryMean.of.Standard.Deviation.of.Vector.Magnitude.of.Acceleration.of.Gravity
##  Min.   :-0.9865                                                                 
##  1st Qu.:-0.9430                                                                 
##  Median :-0.6074                                                                 
##  Mean   :-0.5439                                                                 
##  3rd Qu.:-0.2090                                                                 
##  Max.   : 0.4284                                                                 
##  SummaryMean.of.Mean.of.Jerk.Vector.Magnitude.of.Acceleration.of.Subject.Body
##  Min.   :-0.9928                                                             
##  1st Qu.:-0.9807                                                             
##  Median :-0.8168                                                             
##  Mean   :-0.6079                                                             
##  3rd Qu.:-0.2456                                                             
##  Max.   : 0.4345                                                             
##  SummaryMean.of.Standard.Deviation.of.Jerk.Vector.Magnitude.of.Acceleration.of.Subject.Body
##  Min.   :-0.9946                                                                           
##  1st Qu.:-0.9765                                                                           
##  Median :-0.8014                                                                           
##  Mean   :-0.5842                                                                           
##  3rd Qu.:-0.2173                                                                           
##  Max.   : 0.4506                                                                           
##  SummaryMean.of.Mean.of.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9807                                                            
##  1st Qu.:-0.9461                                                            
##  Median :-0.6551                                                            
##  Mean   :-0.5652                                                            
##  3rd Qu.:-0.2159                                                            
##  Max.   : 0.4180                                                            
##  SummaryMean.of.Standard.Deviation.of.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9814                                                                          
##  1st Qu.:-0.9476                                                                          
##  Median :-0.7420                                                                          
##  Mean   :-0.6304                                                                          
##  3rd Qu.:-0.3602                                                                          
##  Max.   : 0.3000                                                                          
##  SummaryMean.of.Mean.of.Jerk.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.99732                                                                
##  1st Qu.:-0.98515                                                                
##  Median :-0.86479                                                                
##  Mean   :-0.73637                                                                
##  3rd Qu.:-0.51186                                                                
##  Max.   : 0.08758                                                                
##  SummaryMean.of.Standard.Deviation.of.Jerk.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9977                                                                               
##  1st Qu.:-0.9805                                                                               
##  Median :-0.8809                                                                               
##  Mean   :-0.7550                                                                               
##  3rd Qu.:-0.5767                                                                               
##  Max.   : 0.2502                                                                               
##  SummaryMean.of.Mean.of.Fourier.transform.of.X.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9952                                                                        
##  1st Qu.:-0.9787                                                                        
##  Median :-0.7691                                                                        
##  Mean   :-0.5758                                                                        
##  3rd Qu.:-0.2174                                                                        
##  Max.   : 0.5370                                                                        
##  SummaryMean.of.Mean.of.Fourier.transform.of.Y.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.98903                                                                       
##  1st Qu.:-0.95361                                                                       
##  Median :-0.59498                                                                       
##  Mean   :-0.48873                                                                       
##  3rd Qu.:-0.06341                                                                       
##  Max.   : 0.52419                                                                       
##  SummaryMean.of.Mean.of.Fourier.transform.of.Z.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9895                                                                        
##  1st Qu.:-0.9619                                                                        
##  Median :-0.7236                                                                        
##  Mean   :-0.6297                                                                        
##  3rd Qu.:-0.3183                                                                        
##  Max.   : 0.2807                                                                        
##  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.X.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9966                                                                                      
##  1st Qu.:-0.9820                                                                                      
##  Median :-0.7470                                                                                      
##  Mean   :-0.5522                                                                                      
##  3rd Qu.:-0.1966                                                                                      
##  Max.   : 0.6585                                                                                      
##  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Y.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.99068                                                                                     
##  1st Qu.:-0.94042                                                                                     
##  Median :-0.51338                                                                                     
##  Mean   :-0.48148                                                                                     
##  3rd Qu.:-0.07913                                                                                     
##  Max.   : 0.56019                                                                                     
##  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Z.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9872                                                                                      
##  1st Qu.:-0.9459                                                                                      
##  Median :-0.6441                                                                                      
##  Mean   :-0.5824                                                                                      
##  3rd Qu.:-0.2655                                                                                      
##  Max.   : 0.6871                                                                                      
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.X.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.63591                                                                                     
##  1st Qu.:-0.39165                                                                                     
##  Median :-0.25731                                                                                     
##  Mean   :-0.23227                                                                                     
##  3rd Qu.:-0.06105                                                                                     
##  Max.   : 0.15912                                                                                     
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Y.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.379518                                                                                    
##  1st Qu.:-0.081314                                                                                    
##  Median : 0.007855                                                                                    
##  Mean   : 0.011529                                                                                    
##  3rd Qu.: 0.086281                                                                                    
##  Max.   : 0.466528                                                                                    
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Z.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.52011                                                                                     
##  1st Qu.:-0.03629                                                                                     
##  Median : 0.06582                                                                                     
##  Mean   : 0.04372                                                                                     
##  3rd Qu.: 0.17542                                                                                     
##  Max.   : 0.40253                                                                                     
##  SummaryMean.of.Mean.of.Jerk.Fourier.transform.of.X.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9946                                                                             
##  1st Qu.:-0.9828                                                                             
##  Median :-0.8126                                                                             
##  Mean   :-0.6139                                                                             
##  3rd Qu.:-0.2820                                                                             
##  Max.   : 0.4743                                                                             
##  SummaryMean.of.Mean.of.Jerk.Fourier.transform.of.Y.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9894                                                                             
##  1st Qu.:-0.9725                                                                             
##  Median :-0.7817                                                                             
##  Mean   :-0.5882                                                                             
##  3rd Qu.:-0.1963                                                                             
##  Max.   : 0.2767                                                                             
##  SummaryMean.of.Mean.of.Jerk.Fourier.transform.of.Z.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9920                                                                             
##  1st Qu.:-0.9796                                                                             
##  Median :-0.8707                                                                             
##  Mean   :-0.7144                                                                             
##  3rd Qu.:-0.4697                                                                             
##  Max.   : 0.1578                                                                             
##  SummaryMean.of.Standard.Deviation.of.Jerk.Fourier.transform.of.X.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9951                                                                                           
##  1st Qu.:-0.9847                                                                                           
##  Median :-0.8254                                                                                           
##  Mean   :-0.6121                                                                                           
##  3rd Qu.:-0.2475                                                                                           
##  Max.   : 0.4768                                                                                           
##  SummaryMean.of.Standard.Deviation.of.Jerk.Fourier.transform.of.Y.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.9905                                                                                           
##  1st Qu.:-0.9737                                                                                           
##  Median :-0.7852                                                                                           
##  Mean   :-0.5707                                                                                           
##  3rd Qu.:-0.1685                                                                                           
##  Max.   : 0.3498                                                                                           
##  SummaryMean.of.Standard.Deviation.of.Jerk.Fourier.transform.of.Z.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.993108                                                                                         
##  1st Qu.:-0.983747                                                                                         
##  Median :-0.895121                                                                                         
##  Mean   :-0.756489                                                                                         
##  3rd Qu.:-0.543787                                                                                         
##  Max.   :-0.006236                                                                                         
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Jerk.X.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.57604                                                                                          
##  1st Qu.:-0.28966                                                                                          
##  Median :-0.06091                                                                                          
##  Mean   :-0.06910                                                                                          
##  3rd Qu.: 0.17660                                                                                          
##  Max.   : 0.33145                                                                                          
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Jerk.Y.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.60197                                                                                          
##  1st Qu.:-0.39751                                                                                          
##  Median :-0.23209                                                                                          
##  Mean   :-0.22810                                                                                          
##  3rd Qu.:-0.04721                                                                                          
##  Max.   : 0.19568                                                                                          
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Jerk.Z.component.of.Acceleration.of.Subject.Body
##  Min.   :-0.62756                                                                                          
##  1st Qu.:-0.30867                                                                                          
##  Median :-0.09187                                                                                          
##  Mean   :-0.13760                                                                                          
##  3rd Qu.: 0.03858                                                                                          
##  Max.   : 0.23011                                                                                          
##  SummaryMean.of.Mean.of.Fourier.transform.of.X.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9931                                                                            
##  1st Qu.:-0.9697                                                                            
##  Median :-0.7300                                                                            
##  Mean   :-0.6367                                                                            
##  3rd Qu.:-0.3387                                                                            
##  Max.   : 0.4750                                                                            
##  SummaryMean.of.Mean.of.Fourier.transform.of.Y.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9940                                                                            
##  1st Qu.:-0.9700                                                                            
##  Median :-0.8141                                                                            
##  Mean   :-0.6767                                                                            
##  3rd Qu.:-0.4458                                                                            
##  Max.   : 0.3288                                                                            
##  SummaryMean.of.Mean.of.Fourier.transform.of.Z.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9860                                                                            
##  1st Qu.:-0.9624                                                                            
##  Median :-0.7909                                                                            
##  Mean   :-0.6044                                                                            
##  3rd Qu.:-0.2635                                                                            
##  Max.   : 0.4924                                                                            
##  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.X.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9947                                                                                          
##  1st Qu.:-0.9750                                                                                          
##  Median :-0.8086                                                                                          
##  Mean   :-0.7110                                                                                          
##  3rd Qu.:-0.4813                                                                                          
##  Max.   : 0.1966                                                                                          
##  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Y.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9944                                                                                          
##  1st Qu.:-0.9602                                                                                          
##  Median :-0.7964                                                                                          
##  Mean   :-0.6454                                                                                          
##  3rd Qu.:-0.4154                                                                                          
##  Max.   : 0.6462                                                                                          
##  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Z.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9867                                                                                          
##  1st Qu.:-0.9643                                                                                          
##  Median :-0.8224                                                                                          
##  Mean   :-0.6577                                                                                          
##  3rd Qu.:-0.3916                                                                                          
##  Max.   : 0.5225                                                                                          
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.X.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.395770                                                                                        
##  1st Qu.:-0.213363                                                                                        
##  Median :-0.115527                                                                                        
##  Mean   :-0.104551                                                                                        
##  3rd Qu.: 0.002655                                                                                        
##  Max.   : 0.249209                                                                                        
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Y.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.66681                                                                                         
##  1st Qu.:-0.29433                                                                                         
##  Median :-0.15794                                                                                         
##  Mean   :-0.16741                                                                                         
##  3rd Qu.:-0.04269                                                                                         
##  Max.   : 0.27314                                                                                         
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Z.component.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.50749                                                                                         
##  1st Qu.:-0.15481                                                                                         
##  Median :-0.05081                                                                                         
##  Mean   :-0.05718                                                                                         
##  3rd Qu.: 0.04152                                                                                         
##  Max.   : 0.37707                                                                                         
##  SummaryMean.of.Mean.of.Fourier.transform.of.Acceleration.of.Subject.Body
##  Min.   :-0.9868                                                         
##  1st Qu.:-0.9560                                                         
##  Median :-0.6703                                                         
##  Mean   :-0.5365                                                         
##  3rd Qu.:-0.1622                                                         
##  Max.   : 0.5866                                                         
##  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Acceleration.of.Subject.Body
##  Min.   :-0.9876                                                                       
##  1st Qu.:-0.9452                                                                       
##  Median :-0.6513                                                                       
##  Mean   :-0.6210                                                                       
##  3rd Qu.:-0.3654                                                                       
##  Max.   : 0.1787                                                                       
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Vector.Magnitude.of.Acceleration.of.Subject.Body
##  Min.   :-0.31234                                                                                          
##  1st Qu.:-0.01475                                                                                          
##  Median : 0.08132                                                                                          
##  Mean   : 0.07613                                                                                          
##  3rd Qu.: 0.17436                                                                                          
##  Max.   : 0.43585                                                                                          
##  SummaryMean.of.Mean.of.Jerk.Fourier.transform.of.Acceleration.of.Subject.Body
##  Min.   :-0.9940                                                              
##  1st Qu.:-0.9770                                                              
##  Median :-0.7940                                                              
##  Mean   :-0.5756                                                              
##  3rd Qu.:-0.1872                                                              
##  Max.   : 0.5384                                                              
##  SummaryMean.of.Standard.Deviation.of.Jerk.Fourier.transform.of.Acceleration.of.Subject.Body
##  Min.   :-0.9944                                                                            
##  1st Qu.:-0.9752                                                                            
##  Median :-0.8126                                                                            
##  Mean   :-0.5992                                                                            
##  3rd Qu.:-0.2668                                                                            
##  Max.   : 0.3163                                                                            
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Jerk.Vector.Magnitude.of.Acceleration.of.Subject.Body
##  Min.   :-0.12521                                                                                               
##  1st Qu.: 0.04527                                                                                               
##  Median : 0.17198                                                                                               
##  Mean   : 0.16255                                                                                               
##  3rd Qu.: 0.27593                                                                                               
##  Max.   : 0.48809                                                                                               
##  SummaryMean.of.Mean.of.Fourier.transform.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9865                                                             
##  1st Qu.:-0.9616                                                             
##  Median :-0.7657                                                             
##  Mean   :-0.6671                                                             
##  3rd Qu.:-0.4087                                                             
##  Max.   : 0.2040                                                             
##  SummaryMean.of.Standard.Deviation.of.Fourier.transform.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9815                                                                           
##  1st Qu.:-0.9488                                                                           
##  Median :-0.7727                                                                           
##  Mean   :-0.6723                                                                           
##  3rd Qu.:-0.4277                                                                           
##  Max.   : 0.2367                                                                           
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.45664                                                                                              
##  1st Qu.:-0.16951                                                                                              
##  Median :-0.05352                                                                                              
##  Mean   :-0.03603                                                                                              
##  3rd Qu.: 0.08228                                                                                              
##  Max.   : 0.40952                                                                                              
##  SummaryMean.of.Mean.of.Jerk.Fourier.transform.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9976                                                                  
##  1st Qu.:-0.9813                                                                  
##  Median :-0.8779                                                                  
##  Mean   :-0.7564                                                                  
##  3rd Qu.:-0.5831                                                                  
##  Max.   : 0.1466                                                                  
##  SummaryMean.of.Standard.Deviation.of.Jerk.Fourier.transform.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.9976                                                                                
##  1st Qu.:-0.9802                                                                                
##  Median :-0.8941                                                                                
##  Mean   :-0.7715                                                                                
##  3rd Qu.:-0.6081                                                                                
##  Max.   : 0.2878                                                                                
##  SummaryMean.of.Mean.Frequency.of.Fourier.transform.of.the.Jerk.Vector.Magnitude.of.Angular.velocity.of.Subject.Body
##  Min.   :-0.18292                                                                                                   
##  1st Qu.: 0.05423                                                                                                   
##  Median : 0.11156                                                                                                   
##  Mean   : 0.12592                                                                                                   
##  3rd Qu.: 0.20805                                                                                                   
##  Max.   : 0.42630                                                                                                   
##  SummaryMean.of.Angle.between.mean.direction.of.Acceleration.of.Subject.Body.and.the.mean.direction.of.Gravity
##  Min.   :-0.163043                                                                                            
##  1st Qu.:-0.011012                                                                                            
##  Median : 0.007878                                                                                            
##  Mean   : 0.006556                                                                                            
##  3rd Qu.: 0.024393                                                                                            
##  Max.   : 0.129154                                                                                            
##  SummaryMean.of.Angle.between.mean.Jerk.direction.of.Acceleration.of.Subject.Body.and.the.mean.direction.of.Gravity
##  Min.   :-0.1205540                                                                                                
##  1st Qu.:-0.0211694                                                                                                
##  Median : 0.0031358                                                                                                
##  Mean   : 0.0006439                                                                                                
##  3rd Qu.: 0.0220881                                                                                                
##  Max.   : 0.2032600                                                                                                
##  SummaryMean.of.Angle.between.mean.direction.of.Angular.velocity.of.Subject.Body.and.the.mean.direction.of.Gravity
##  Min.   :-0.38931                                                                                                 
##  1st Qu.:-0.01977                                                                                                 
##  Median : 0.02087                                                                                                 
##  Mean   : 0.02193                                                                                                 
##  3rd Qu.: 0.06460                                                                                                 
##  Max.   : 0.44410                                                                                                 
##  SummaryMean.of.Angle.between.mean.Jerk.direction.of.Angular.velocity.of.Subject.Body.and.the.mean.direction.of.Gravity
##  Min.   :-0.22367                                                                                                      
##  1st Qu.:-0.05613                                                                                                      
##  Median :-0.01602                                                                                                      
##  Mean   :-0.01137                                                                                                      
##  3rd Qu.: 0.03200                                                                                                      
##  Max.   : 0.18238                                                                                                      
##  SummaryMean.of.Angle.between.X.orientation.of.device.and.the.mean.direction.of.Gravity
##  Min.   :-0.9471                                                                       
##  1st Qu.:-0.7907                                                                       
##  Median :-0.7377                                                                       
##  Mean   :-0.5243                                                                       
##  3rd Qu.:-0.5823                                                                       
##  Max.   : 0.7378                                                                       
##  SummaryMean.of.Angle.between.Y.orientation.of.device.and.the.mean.direction.of.Gravity
##  Min.   :-0.87457                                                                      
##  1st Qu.: 0.02191                                                                      
##  Median : 0.17136                                                                      
##  Mean   : 0.07865                                                                      
##  3rd Qu.: 0.24343                                                                      
##  Max.   : 0.42476                                                                      
##  SummaryMean.of.Angle.between.Z.orientation.of.device.and.the.mean.direction.of.Gravity
##  Min.   :-0.873649                                                                     
##  1st Qu.:-0.083912                                                                     
##  Median : 0.005079                                                                     
##  Mean   :-0.040436                                                                     
##  3rd Qu.: 0.106190                                                                     
##  Max.   : 0.390444
```

##Sources
Sources for this analysis in addition to the raw data X, Y and S files, are the activity_labels.txt and features.txt files in the data set. The scripts to perform the analysis are the .R files in the repository.

