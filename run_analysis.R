# Coursera Getting & Cleaning Data Week 4 Assignment

### set working directory
setwd("~/Documents/Coursera_Cleaning Data/UCI HAR Dataset")
library(dplyr)
library(data.table)

# Merges the training and the test sets to create one data set.
### read data
X_test<-tbl_df(read.table("./test/X_test.txt",header=FALSE))
X_train<-tbl_df(read.table("./train/X_train.txt",header=FALSE))
y_test<-tbl_df(read.table("./test/y_test.txt",header=FALSE))
y_train<-tbl_df(read.table("./train/y_train.txt",header=FALSE))
### read subject
sub_test<-tbl_df(read.table("./test/subject_test.txt",header=FALSE))
sub_train<-tbl_df(read.table("./train/subject_train.txt",header=FALSE))
### read features
ft<-read.table("features.txt",header=FALSE)
act_lab<-read.table("activity_labels.txt",header=FALSE)

# Merges the training and the test sets to create one data set.
### combind data and asign names
data<-rbind(X_test,X_train)
names(data)<-ft[,2]
sub<-rbind(sub_test,sub_train)
names(sub)<-"subject"
y<-rbind(y_test,y_train)
names(y)<-"activity"
### combind data & subject & activity
data<-cbind(data,sub,y)

# Extracts only the measurements on the mean and standard deviation for each measurement.
title<-names(data)
title<-title[grep("mean\\(\\)|std\\(\\)", title)]
data<-subset(data,select=c(title,"subject","activity"))

# Uses descriptive activity names to name the activities in the data set
for (i in 1:6) {
    data$activity[data$activity==i]<-as.character(act_lab[i,2])
}
data$activity<-as.factor(data$activity)

# Appropriately labels the data set with descriptive variable names.
names(data)<-gsub("^t","time",names(data))
names(data)<-gsub("^f","frequency",names(data))
names(data)<-gsub("Acc","Accelerometer", names(data))
names(data)<-gsub("Gyro","Gyroscope", names(data))
names(data)<-gsub("Mag","Magnitude", names(data))
names(data)<-gsub("BodyBody","Body", names(data))

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
data$subject<-as.factor(data$subject)
data<-data.table(data)
tidydata<-aggregate(. ~subject+activity, data, mean)
tidydata<-tidydata[order(tidydata$subject,tidydata$activity),]
write.table(tidydata,file="tidy.txt",row.names=FALSE)



