library(plyr)

## 1. Merges the training and the test sets to create one data set. 

## Import and combine subject data (and name the column ("subject")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names=c("subject"))
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names=c("subject"))
all_subject <- rbind(test_subject, train_subject)

## Import and combine activity data (and name the column "activity")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names=c("activity"))
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names=c("activity"))
all_activity <- rbind(test_activity, train_activity)

## Import and combine features data
test_features <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
train_features <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
all_features <- rbind(test_features, train_features)

## Import names of features and rename the features columns
features_names <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
names(all_features) <- features_names$V2

## Combine activity, subject, and features into a single dataframe
all_data <- cbind (all_subject, all_activity, all_features)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

## Create a subset of the full variable set by using grep to identify varibles with "mean()" or "std()"
subset_features_names <- features_names$V2[grep("mean\\(\\)|std\\(\\)", features_names$V2)]
subset_columns <-c("subject", "activity", as.character(subset_features_names))
all_data <- subset(all_data, select = subset_columns)


## 3. Uses descriptive activity names to name the activities in the data set
all_data$activity <- factor(all_data$activity, levels = c(1,2,3,4,5,6), labels = c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))


## 4. Appropriately labels the data set with descriptive variable names.

## Assign column names to a temp variable, then use grep to eliminate abbreviations, parentheses, and capitalization.
names_temp <- names(all_data)
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
names(all_data) <- names_temp


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Create a second data set, grouped data by subject and activity and sorted by subject then activity.
library(plyr);
all_data_2 <- aggregate(. ~subject + activity, all_data, mean)
all_data_2 <- all_data_2[order(all_data_2$subject,all_data_2$activity),]
write.table(all_data_2, file = "tidydata.txt", row.name=FALSE)