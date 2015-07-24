
## prettyNames: Converts variable names in the UCI HAR dataset to user-friendly names
prettyNames <- function(uglyName) {
  # We want to rename the variable names (column names of the data set) with descriptive names, for example,
  # (from David Hood's blog post): "Jerk of the body on the z axis of the phone"
  # To distinguish the un-processed values, we replace all periods and squences of period with a single blank when we convert the name
  
  isMean <- FALSE
  isStd <- FALSE
  isMeanFreq <- FALSE
  isFreqDomain <- FALSE
  # "t": time domain (series)  doesn't require further annotation as all of the base measurements are in time domain
  # but "f": frequency domain (obtained from a Forier transform of the signals) should be distinguished
  isFreqDomain <- length(grep("^f", uglyName))  > 0 
  
  # "Body": component of acceleration  or "Gravity": gravitational acceleration
  ## acceleration units are 
  measuredObject <- if (length(grep("Body", uglyName, fixed = T)) > 0) "Subject Body"
  else if (length(grep("Gravity", uglyName, fixed = T)) > 0) "Gravity" 
  else ""
  #diagnostic
  # print(measuredObject)
  
  # "Acc": 3d accelerometer data or "Gyro": 3d gyroscope sensors of angular velocity
  measurement <- if (length(grep("Acc", uglyName, fixed = T)) > 0) "Acceleration " 
  else if (length(grep("Gyro", uglyName, fixed = T)) > 0) "Angular velocity "
  else ""
  
  #diagnostic
  # print(measurement)
  # "Jerk": denotes a derived jerk quantities
  isJerk <- length(grep("Jerk", uglyName, fixed = T)) > 0
  
  # "Mag":  denotes the Euclidian normal of a vector quantities
  isMag <- length(grep("Mag", uglyName, fixed = T)) > 0
  # otherwise, it is either the X, Y or Z component:
  component = if (!isMag) {
    if (length(grep("\\.X", uglyName)) > 0) "X"
    else if (length(grep("\\.Y", uglyName)) > 0) "Y"
    else if (length(grep("\\.Z", uglyName)) > 0) "Z"
    else ""
  }
  #diagnostic
  #print(component)
  
  # Other derived quantities, of which only "mean" "std" and "meanFreq" appear in the selected mean or std data
  
  #   "mean": mean value of the underlying signal (but note difference with windowed vector averages, below)
  isMean <- length(grep("\\.mean\\.", uglyName))  > 0
  #   "std": standard deviation of the underlying signal
  isStd <- length(grep("\\.std\\.", uglyName)) > 0
  #   "mad": median absolute deviation of the underlying signal
  #   "max": largest value of the underlying signal
  #   "min": smallest value of the underlying signal
  #   "sma": signal magnitude area
  #   "energy": energy measure obtained as the sum of squares divided by number of values of the underlying signal
  #   "iqr": inter-quartile range of the underlying signal
  #   "entropy": entropy of the underlying signal
  #   "arCoeff": autoregression coefficients
  #   "correlation": correlation coefficient between two of the underlying signals
  #   "maxInds": index of frequency component with largest magnitude
  #   "meanFreq": weighted average of the frequency components
  isMeanFreq <- length(grep("meanFreq", uglyName, fixed = T))  > 0
  #   "skewness": skeqness of frequency domain signal
  #   "kurtosis": kurtosis of frequency domain signal
  #   "bandsEnergy": energy of frequency interval within the 64 bins of the FFT of each window
  #   "angle": angle between two vectors
  isAngle <- length(grep("^angle.", uglyName)) > 0
  #special cases: subject, activity columns
  if (uglyName == "SubjectCode" || uglyName == "ActivityCode" || uglyName == "Activity") {
    prettyName <- uglyName
  } else if (isAngle) {
      uglyNameComponents <- strsplit(substr(uglyName,nchar("angle")+1,nchar(uglyName)), "_")
      prettyName <- paste("Angle between ", 
                          ifelse(component != "X" && component != "Y" && component != "Z", "mean ", ""),
                          ifelse(isJerk,"Jerk ",""),
                          ifelse(nchar(component[1]) > 0, paste(component, "orientation of device"), "direction of "),
                          ifelse(nchar(measurement[1]) > 0, paste(measurement, "of ",sep=""), ""),
                          measuredObject,
                          " and the mean direction of Gravity",
                          sep = "")
    }
    else if (isMeanFreq) {
      # somewhat different format
      prettyName <- paste( switch(isMeanFreq, "Mean Frequency of Fourier transform of the "),
                          switch(isJerk, "Jerk "),
                          ifelse(isMag, "Vector Magnitude of ", switch(length(component), paste(component, "component of "))),
                          measurement, "of ", 
                          measuredObject, 
                          sep = "")
    } else if (isFreqDomain) {
      prettyName <- paste(switch(isMean,"Mean of "), switch(isStd, "Standard Deviation of "), 
                         switch(isJerk, "Jerk "),
                         "Fourier transform of ",
                         switch(length(component), paste(component, "component of ")),
                         measurement, "of ", 
                         measuredObject, 
                         sep = "")
    } else {
      prettyName <- paste(switch(isMean,"Mean of "), switch(isStd, "Standard Deviation of "), 
                         switch(isJerk, "Jerk "),
                         ifelse(isMag, "Vector Magnitude of ", switch(length(component), paste(component, "component of "))),
                         measurement, "of ", 
                         measuredObject, 
                         sep = "")
    }
  
  #   #diagnostic
  #   print(paste(uglyName,":",prettyName))
  prettyName
}

#unit tests
# prettyNames("fBodyAcc.std...X")
# lapply(c("fBodyGyroMag.mean", "fBodyGyro...X", "tGravityGyroJerk.mean...Z", "tGravityGyroJerk.std...X", "tBodyAccJerk.mean...Z", "tBodyAccJerk.std...X" ), prettyNames)
# lapply(c("angle.tBodyAccMean._gravity.",          "angle.tBodyAccJerkMean._gravityMean.",
#             "angle.tBodyGyroMean._gravityMean." ,    "angle.tBodyGyroJerkMean._gravityMean.",
#              "angle.X._gravityMean." ,                "angle.Y._gravityMean."    ,            
#             "angle.Z._gravityMean."), prettyNames)