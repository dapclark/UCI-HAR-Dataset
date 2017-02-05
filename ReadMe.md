Tidying the UCI HAR Dataset
========================

This repository contains a single [run_analysis.R](run_analysis.R) R script that combines, tidies, and labels the separate files of the [UCI "Human Activity Recognition" dataset] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This script was written for Coursera's course on ["Getting and Cleaning Data"] (https://www.coursera.org/learn/data-cleaning).

## Assignment

The assignment is to "create one R script called run_analysis.R that does the following":

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Approach

To complete the assignment, I began by working to create the complete, combined data set, in this order:

### Import and Label Subject Numbers
1. Import "test" subject numbers and name the column "subject"
2. Import "train" subject numbers and name the column "subject"
3. Combine the "test" and "train" subjects.

### Import and Label Activities
1. Import "test" activity numbers and name the column "activity"
2. Import "train" activity numbers and name the column "activity"
3. Combine the "test" and "train" activies.
4. Use the "factor" function to convert activity numbers to their matching character labels.

### Import and Label Subjects
1. 
