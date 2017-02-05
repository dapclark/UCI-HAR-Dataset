## Import and combine subject data (and name the column ("subject")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names=c("subject"))
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names=c("subject"))
all_subject <- rbind(test_subject, train_subject)

## Import and combine activity data (and name the column "activity")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names=c("activity"))
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names=c("activity"))
all_activity <- rbind(test_activity, train_activity)

## Replace activity codes with activity names
all_activity$activity <- factor(all_activity$activity, levels = c(1,2,3,4,5,6), labels = c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))

## Import and combine features data
test_features <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
train_features <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
all_features <- rbind(test_features, train_features)

## Apply features names to features columns
features_names <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
names(all_features) <- features_names$V2

## Combine activity, subject, and features into a single dataframe
all_data <- cbind (all_subject, all_activity, all_features)

