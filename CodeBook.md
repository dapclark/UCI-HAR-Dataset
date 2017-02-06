Codebook for Tidy UCI HAR Dataset
========================

## Overview

This CodeBook describes the output data of the [run_analysis.R](https://github.com/dapclark/UCI-HAR-Dataset/blob/master/runanalysis.R) script. The file can be read into R using the following command:

```R
tidy_data <- data.table("tidy_data.txt")
```

## Tidying

The initial UCI HAR dataset contains 10,299 observations of 563 variables, which were initially spread across six text files.  In order to tidy the dataset, I did the following:

1. Combine the six distinct files into one comprehensive dataset (10,299 observations of 563 variables).
2. Read in the names of the features from features.txt, and then apply those names to the 561 data columns of the dataset.
3. Convert the numbers in the "activity" column into text explanations (e.g, "walking").
4. Subset the complete dataset into just the columns that contain means and standard deviations (grep searching for "mean()" and "std()").
5. Improve readability and findability of column headings by making the following replacements:

```R
names_temp <- gsub("\\(\\)", "", names_temp)
names_temp <- gsub("BodyBody", "-body", names_temp)
names_temp <- gsub("^t", "time", names_temp)
names_temp <- gsub("^f", "frequency", names_temp)
names_temp <- gsub("Acc", "-acceleration", names_temp)
names_temp <- gsub("Gyro", "-gyro", names_temp)
names_temp <- gsub("Jerk", "-jerk", names_temp)
names_temp <- gsub("Body", "-body", names_temp)
names_temp <- gsub("Gravity", "-gravity", names_temp)
names_temp <- gsub("Mag", "-magnitude", names_temp)
names_temp <- tolower (names_temp)
```

## Column Names

These are the 66 variables that result from the process:

```R
time-body-acceleration-mean-x
time-body-acceleration-mean-y
time-body-acceleration-mean-z
time-body-acceleration-std-x
time-body-acceleration-std-y
time-body-acceleration-std-z
time-gravity-acceleration-mean-x
time-gravity-acceleration-mean-y
time-gravity-acceleration-mean-z
time-gravity-acceleration-std-x
time-gravity-acceleration-std-y
time-gravity-acceleration-std-z
time-body-acceleration-jerk-mean-x
time-body-acceleration-jerk-mean-y
time-body-acceleration-jerk-mean-z
time-body-acceleration-jerk-std-x
time-body-acceleration-jerk-std-y
time-body-acceleration-jerk-std-z
time-body-gyro-mean-x
time-body-gyro-mean-y
time-body-gyro-mean-z
time-body-gyro-std-x
time-body-gyro-std-y
time-body-gyro-std-z
time-body-gyro-jerk-mean-x
time-body-gyro-jerk-mean-y
time-body-gyro-jerk-mean-z
time-body-gyro-jerk-std-x
time-body-gyro-jerk-std-y
time-body-gyro-jerk-std-z
time-body-acceleration-magnitude-mean
time-body-acceleration-magnitude-std
time-gravity-acceleration-magnitude-mean
time-gravity-acceleration-magnitude-std
time-body-acceleration-jerk-magnitude-mean
time-body-acceleration-jerk-magnitude-std
time-body-gyro-magnitude-mean
time-body-gyro-magnitude-std
time-body-gyro-jerk-magnitude-mean
time-body-gyro-jerk-magnitude-std
frequency-body-acceleration-mean-x
frequency-body-acceleration-mean-y
frequency-body-acceleration-mean-z
frequency-body-acceleration-std-x
frequency-body-acceleration-std-y
frequency-body-acceleration-std-z
frequency-body-acceleration-jerk-mean-x
frequency-body-acceleration-jerk-mean-y
frequency-body-acceleration-jerk-mean-z
frequency-body-acceleration-jerk-std-x
frequency-body-acceleration-jerk-std-y
frequency-body-acceleration-jerk-std-z
frequency-body-gyro-mean-x
frequency-body-gyro-mean-y
frequency-body-gyro-mean-z
frequency-body-gyro-std-x
frequency-body-gyro-std-y
frequency-body-gyro-std-z
frequency-body-acceleration-magnitude-mean
frequency-body-acceleration-magnitude-std
frequency-body-acceleration-jerk-magnitude-mean
frequency-body-acceleration-jerk-magnitude-std
frequency-body-gyro-magnitude-mean
frequency-body-gyro-magnitude-std
frequency-body-gyro-jerk-magnitude-mean
frequency-body-gyro-jerk-magnitude-std
```