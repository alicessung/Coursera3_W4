
# Code Book
Coursera Getting & Cleaning Data Week 4 Assignment

## data Source
* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* OOriginal description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## required packages 
* Olibrary(dplyr)
* Olibrary(data.table)

## data & working directory
"~/Documents/Coursera_Cleaning Data/UCI HAR Dataset"

## data set
* Ofeatures.txt: List of all features.
* Oactivity_labels.txt: Links the class labels with their activity name.
* Otrain/X_train.txt: Training set.
* Otrain/y_train.txt: Training labels.
* Otrain/subject_train.txt: The subject who perform the activity
* Otest/X_test.txt: Test set.
* Otest/y_test.txt: Test labels.
* Otest/subject_test.txt: The subject who perform the activity

## Steps
* OMerges the training and the test sets to create one data set: read data,read subject, read features, set data name with features, and merge them together.
* OExtracts only the measurements on the mean and standard deviation for each measurement: extracts those names contain mean() or std() using grep and subset.
* OUses descriptive activity names to name the activities in the data set: reference activity_labels.txt
* OAppropriately labels the data set with descriptive variable names: ^t->time, ^f->frequency, Acc->Accelerometer, Gyro->Gyroscope, Mag->Magnitude, BodyBody->Body
* OFrom the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.