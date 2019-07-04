#Set the working Directory

setwd("C:/ProyectosR/CURSOS 3/W4/Tarea/UCI HAR Dataset")


#1.Merges the training and the test sets to create one data set.

#Read The features to know what are the variables 
features<-read.delim("features.txt", header=FALSE, sep = "\t")

features_names<-as.character(features$V1)

#First: Get the Test observations

#Get the X-test set
X_test<-read.table("test/X_test.txt")
colnames(X_test)<-features_names

#Get the Labels-test set
y_test<-read.table("test/y_test.txt")
colnames(y_test)<-c("Activity_Label")

#Get the subject who performed the experiment
subject_test<-read.table("test/subject_test.txt")
colnames(subject_test)<-c("Subject")

#Put the test columns together
XySubject_test<-cbind(X_test, y_test, subject_test)


#Second: Get the training observations

#Get the  train observations

#Get the X-train set
X_train<-read.table("train/X_train.txt")
colnames(X_train)<-features_names

#Get the Labels-train set
y_train<-read.table("train/y_train.txt")
colnames(y_train)<-c("Activity_Label")

#Get the subject who performed the experiment
subject_train<-read.table("train/subject_train.txt")
colnames(subject_train)<-c("Subject")
#Put the train columns together

XySubject_train<-cbind(X_train, y_train, subject_train)

#Put all the observations together test +train+subjects

XySubject_ALL<-rbind(XySubject_test,XySubject_train )

#2.-Extracts only the measurements on the mean and standard deviation 
#for each measurement.
library(dplyr)

#New variable "Mean_Stad" that extracts the columns of mean and standard
#deviation columns

Mean_Std<-select(XySubject_ALL, 
                 `1 tBodyAcc-mean()-X`:'6 tBodyAcc-std()-Z', 
                 '41 tGravityAcc-mean()-X':'46 tGravityAcc-std()-Z',
                 '81 tBodyAccJerk-mean()-X':'86 tBodyAccJerk-std()-Z',
                 '121 tBodyGyro-mean()-X':'126 tBodyGyro-std()-Z',
                 '161 tBodyGyroJerk-mean()-X':'166 tBodyGyroJerk-std()-Z',
                 '201 tBodyAccMag-mean()':'202 tBodyAccMag-std()',
                 '214 tGravityAccMag-mean()':'215 tGravityAccMag-std()',
                 '227 tBodyAccJerkMag-mean()':'228 tBodyAccJerkMag-std()',
                 '240 tBodyGyroMag-mean()':'241 tBodyGyroMag-std()',
                 '253 tBodyGyroJerkMag-mean()':'254 tBodyGyroJerkMag-std()',
                 '266 fBodyAcc-mean()-X': '271 fBodyAcc-std()-Z',
                 '345 fBodyAccJerk-mean()-X':'350 fBodyAccJerk-std()-Z',
                 '373 fBodyAccJerk-meanFreq()-X':'375 fBodyAccJerk-meanFreq()-Z',
                 '424 fBodyGyro-mean()-X':'429 fBodyGyro-std()-Z',
                 '452 fBodyGyro-meanFreq()-X': '454 fBodyGyro-meanFreq()-Z',
                 '503 fBodyAccMag-mean()': '504 fBodyAccMag-std()', 
                 '513 fBodyAccMag-meanFreq()', '516 fBodyBodyAccJerkMag-mean()',
                 '517 fBodyBodyAccJerkMag-std()', '526 fBodyBodyAccJerkMag-meanFreq()',
                 '529 fBodyBodyGyroMag-mean()', '530 fBodyBodyGyroMag-std()',
                 '542 fBodyBodyGyroJerkMag-mean()', '543 fBodyBodyGyroJerkMag-std()',
                 '552 fBodyBodyGyroJerkMag-meanFreq()', 
                 'Activity_Label', 'Subject'
)

#4.-From the data set in step 4, creates a second, independent tidy data 
#set with the average of each variable for each activity and each subject.
#
library(dplyr)



Mean_by_Activity_Subject<- Mean_Std %>%
        group_by(Mean_Std$Activity_Label, Mean_Std$Subject) %>% 
        summarise_each(list(mean))


#Write the File with the results

write.table(Mean_by_Activity_Subject, row.name=FALSE, 
            'Mean_by_Activity_Subject.txt')

