# This script run_analysis does the following:
#
# 1. Downloads and unzips the data set to be transformed in the current working
#    directory.
# 2. Merges the training and the test sets to create one tidy data set using
#    descriptive varaiable names and activity names.
# 3. Extracts only the measurements on the mean and standard deviation
#    for each measurement.
# 4. Writes the tidy data set to a file in the current working directory.
# 5. From the tidy data set, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
# 6. Writes the second data set to another file in the current working
#    directory.

## Download the data file from the course website and unzip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              "UCI HAR Dataset.zip")
unzip("UCI HAR Dataset.zip")

## get and merge the activity classes for the train and test data sets
## use the activity labels to create a factor variable of the activity
## classes vector
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",
                      col.names = "activity")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",
                      col.names = "activity")
y_bind <- rbind(y_train,y_test)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              col.names = c("ID", "activity"),
                              stringsAsFactors = FALSE)
y_bind$activity <- cut(y_bind$activity,breaks = 0:6,
                       labels=activity_labels$activity)

## get and merge the subject identification
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",
                      col.names = "subject")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",
                     col.names = "subject")
subject_bind <- rbind(subject_train,subject_test)

## get the feature names
## clean up the names by removing brackets
## create a filter variable to only import the columns of measurements with
## mean and standard deviation (std) data
features <- read.table("UCI HAR Dataset/features.txt",
                              col.names = c("ID", "feature"),
                              stringsAsFactors = FALSE)
features_count <- nrow(features)
features$feature <- gsub("\\(|\\)", "", features$feature)
only_mean_and_std_cols <- grep("(-mean-)|(-mean)$|(-std-)|(-std)$", features$feature)
import_cols <- rep("NULL", features_count)
import_cols[only_mean_and_std_cols] <- NA

## get and merge the filtered train and test data.
## assign feature names as variable names to the respective colums
X_train <- read.table("UCI HAR Dataset/train/X_train.txt",
                      colClasses = import_cols)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt",
                      colClasses = import_cols)
X_bind <- rbind(X_train,X_test)
names(X_bind) <- features$feature[only_mean_and_std_cols]

## bind subject, activity and measurement data into one data set.
## write the data set to file 'UCI_HAR_selected.txt'
tidy_data <- cbind(subject_bind, y_bind, X_bind)
write.table(tidy_data, "UCI_HAR_selected.txt", quote = FALSE, row.names = FALSE)


## create a new data set with the mean of each variable for each activity
## and each subject.
## write the data set to file 'UCI_HAR_selected_means.txt'
mean_of_variables <- aggregate(. ~ activity + subject, data = tidy_data, FUN= "mean" )
require(plyr)
mean_of_variables <- arrange(mean_of_variables, activity, subject)
write.table(mean_of_variables, "UCI_HAR_selected_means.txt", quote = FALSE, row.names = FALSE)
