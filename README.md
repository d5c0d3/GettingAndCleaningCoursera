# GettingAndCleaningCoursera
Course Project for the Getting And Cleaning Data course at Coursera

The purpose of this project is to collect, work with, and clean a data set.The goal is to prepare tidy data that can be used for later analysis.

The data set that is used and is linked from the course website represent data collected from accelerometers of smartphones in an experiment with 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones [1]

This file 'README.md' explains how the script 'run_analysis.R' works to prepare two tidy data sets as per the assignement:
1. One tidy data set merged from the train and test data of the original data set.
2. Another data set based on the before mentioned set with averages of the variables per person and activity.

## Description ot the transformation script

The transformation script 'run_analysis.R' performes the following steps to transform the original data set to the prepare both above described tidy data sets:

1. Downloads the data file from the course website and unzip in in the current working directory.
2. Gets the activity classes for the train and test data sets from the respective files in the original data set and merges them into a vector of the activities as factors.
3. Gets the subject identification numbers from the respective files in the original data set and merges them into a second numeric vector.
4. Gets the feature names from the rerspective file in the original data set and creating a character vector which then is be used as variable names.
5. Cleans up the feature vector by removing brackets and creates a filter variable which in subsequent steps is used to only import the columns of measurements with mean and standard deviation (std) data.
6. Gets the filtered train and test data from the respective files in the original data set and merges them into one data frame.
7. Assigns the filtered feature names from the features vector as variable names to the respective colums of the data frame from step 6.
8. Binds subject, activity and measurement data into one data set.
9. Writes the data set to a file 'UCI_HAR_selected.txt' in the current working directory.
10. Creates a second data set with the mean of each variable for each activity and each subject.
11. Writes the second data set to file 'UCI_HAR_selected_means.txt'.


## Files in this repo

The following files are included in this repo:

- 'README.md' : This file.

- 'CodeBook.md' : Describes the variables, the data, and any transformations work that has been performed to clean up the original data.

- 'run_analysis.R' : The transformation script.

- 'UCI_HAR_selected.txt' : The first data set prepared by the transformation script as per the assignment (1)

- 'UCI_HAR_selected_means.txt' : The second data set prepared by the transformation script as per the assignment (2)

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
