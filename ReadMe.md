Tidying the UCI HAR Dataset
========================

This repository contains a single [run_analysis.R](run_analysis.R) R script that combines, tidies, and labels the separate files of the [UCI "Human Activity Recognition" dataset] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This script was written for Coursera's course on ["Getting and Cleaning Data"] (https://www.coursera.org/learn/data-cleaning).

## Assignment

The assignment is to "create one R script called run_analysis.R that does the following."  I use these same five steps below and as comments in my code in runanalysis.R.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## 1. Merges the training and the test sets to create one data set.

### Import and Label Subject Numbers
1. Import "test" subject numbers and name the column "subject."
2. Import "train" subject numbers and name the column "subject."
3. Combine the "test" and "train" subjects.

### Import and Label Activities
1. Import "test" activity numbers and name the column "activity."
2. Import "train" activity numbers and name the column "activity."
3. Combine the "test" and "train" activities.

### Import and Label Subjects
1. Import "test" subject numbers.
2. Import "train" subject numbers.
3. Combine the "test" and "train" subjects.
4. Read in the column names from "features.txt" and assign them to the columns.

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.


## 3. Uses descriptive activity names to name the activities in the data set
1. Use the "factor" function to convert activity numbers to their matching character labels.

## 4. Appropriately labels the data set with descriptive variable names.


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
