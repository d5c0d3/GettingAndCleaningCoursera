# Code Book

This Code Book describes the variables, the data, and any transformations
work that has been performed to clean up the original data.

## Original data

The original dataset is available via the coursera course web site via this link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip:
and will be downloaded during execution of the transformation script 'run_analysis.R'

The following files are included in de original data package. Quote from the 'README.txt' file in the original data set:
> - 'README.txt'
> - 'features_info.txt': Shows information about the variables used on the feature vector.
> - 'features.txt': List of all features.
> - 'activity_labels.txt': Links the class labels with their activity name.
> - 'train/X_train.txt': Training set.
> - 'train/y_train.txt': Training labels.
> - 'test/X_test.txt': Test set.
> - 'test/y_test.txt': Test labels.
>
> The following files are available for the train and test data. Their descriptions are equivalent. 
>
> - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
> - 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
> - 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
> - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
>
>Notes: 
>======
>- Features are normalized and bounded within [-1,1].
>- Each feature vector is a row on the text file.

For more detailed information about the original dataset please refer to the explanations in the original data set.

## Transformations work

The following transformations are performed to clean up the original data by using the 'run_analysis.R' script:

- The sets of training data 'train/X_train.txt' and test data 'test/X_test.txt' do only comprise the actual values of the measurements. The data sets have no headers. The variable names (features) are given in 'features.txt'.
- Only the measurements with mean and standarddeviation data are needed. Therfore regular expressions are used to identify only the respective variables and subsequently import only the respective columns of the train and test data sets.
- The data sets are then merged into one data set by binding the rows of the test set to the train set.
- The variables are named using the filtered features names.
- The test person (subject coded as number between 1 and 30) per data row is given in 'train/subject_train.txt' and 'test/subject_test.txt' respectively. The data are merged by binding the rows of the test subjects to the train subjects.
- The activity classes associated with each data row is given in 'train/y_train.txt' and 'test/y_test.txt' respectively. The respective class names are given in 'activity_labels.txt'.
- Finally subject, activity and measurements are merged by binding the respective columns. 


## Variables

In this paragraph the variable of the final data set are described.

### Identification (columns 1..2)

Subject : Identifies one of 30 volunteers  
- Values: 1..30
        
Activity : One of 6 ativities
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### Signals section (columns 3..68)

The variablenames for the signals are build as follows:

First letter
- 't' : denotes time domain
- 'f' : denotes frequency domain
followed by
- 'BodyAcc' : denotes body accelerometer signals
- 'GravityAcc' : denotes gravity accelerometer signals
- 'BodyGyro' : denotes body gyroscope signals
optional followed by
- 'Jerk' : denotes jerk signals
optional followed by
- 'Mag' : denotes magnitude of signals
followed by
- '-mean' : denotes the mean of a signal
- '-std' : denotes the standard deviation of a signal
optional followed by
- '-X' : denotes signals in X direction
- '-Y' : denotes signals in Y direction
- '-Z' : denotes signals in Z direction


### List of all variables in the tidy data set
1 activity  
2 subject  
3 tBodyAcc-mean-X  
4 tBodyAcc-mean-Y  
5 tBodyAcc-mean-Z  
6 tBodyAcc-std-X  
7 tBodyAcc-std-Y  
8 tBodyAcc-std-Z  
9 tGravityAcc-mean-X  
10 tGravityAcc-mean-Y  
11 tGravityAcc-mean-Z  
12 tGravityAcc-std-X  
13 tGravityAcc-std-Y  
14 tGravityAcc-std-Z  
15 tBodyAccJerk-mean-X  
16 tBodyAccJerk-mean-Y  
17 tBodyAccJerk-mean-Z  
18 tBodyAccJerk-std-X  
19 tBodyAccJerk-std-Y  
20 tBodyAccJerk-std-Z  
21 tBodyGyro-mean-X  
22 tBodyGyro-mean-Y  
23 tBodyGyro-mean-Z  
24 tBodyGyro-std-X  
25 tBodyGyro-std-Y  
26 tBodyGyro-std-Z  
27 tBodyGyroJerk-mean-X  
28 tBodyGyroJerk-mean-Y  
29 tBodyGyroJerk-mean-Z  
30 tBodyGyroJerk-std-X  
31 tBodyGyroJerk-std-Y  
32 tBodyGyroJerk-std-Z  
33 tBodyAccMag-mean  
34 tBodyAccMag-std  
35 tGravityAccMag-mean  
36 tGravityAccMag-std  
37 tBodyAccJerkMag-mean  
38 tBodyAccJerkMag-std  
39 tBodyGyroMag-mean  
40 tBodyGyroMag-std  
41 tBodyGyroJerkMag-mean  
42 tBodyGyroJerkMag-std  
43 fBodyAcc-mean-X  
44 fBodyAcc-mean-Y  
45 fBodyAcc-mean-Z  
46 fBodyAcc-std-X  
47 fBodyAcc-std-Y  
48 fBodyAcc-std-Z  
49 fBodyAccJerk-mean-X  
50 fBodyAccJerk-mean-Y  
51 fBodyAccJerk-mean-Z  
52 fBodyAccJerk-std-X  
53 fBodyAccJerk-std-Y  
54 fBodyAccJerk-std-Z  
55 fBodyGyro-mean-X  
56 fBodyGyro-mean-Y  
57 fBodyGyro-mean-Z  
58 fBodyGyro-std-X  
59 fBodyGyro-std-Y  
60 fBodyGyro-std-Z  
61 fBodyAccMag-mean  
62 fBodyAccMag-std  
63 fBodyBodyAccJerkMag-mean  
64 fBodyBodyAccJerkMag-std  
65 fBodyBodyGyroMag-mean  
66 fBodyBodyGyroMag-std  
67 fBodyBodyGyroJerkMag-mean  
68 fBodyBodyGyroJerkMag-std  
