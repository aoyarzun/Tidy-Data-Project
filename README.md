# Tidy-Data-Project
This repository is the soluction of Alfredo Oyarzun to the Getting and Cleaning Data Course Project

The Script does the following main activities:

First: construct the Test Dataset 

1.-Merges the training and the test sets to create one data set.

2.-Read The features.txt file  to save  the variables to be considered
features<-read.delim("features.txt", header=FALSE, sep = "\t")

3.-Get the Test observations from X-test Set file

4.-Name The columns assiated with X-test observations

5.-Get the activity Labels-test set from y_test file

6.-Give the name to the  activity label column

7.-Get the subject column who performed the experiment from subject file

8.-Give the name subject to the subject comlumn to be identified.

9.-Put all the test columns together in only one Dataset



Second: construct the training dataset

1.-Get the  train observations X-train file

2,.Give the data set the column names

3.-Get the Labels-train set from y_train file

4.-Get the Subject column and name the column 

5.-Put the train columns together

Third:  Put the test and trains sets together in one dataset

1.-Put all the observations together test +train+subjects and Extract some measurements

2.-Extracts only the measurements on the mean and standard deviation 
for each measurement.

3.-From the data set in the step 3, create a second dataset, 
that is an independent tidy data set with the average of each variable grouped by each activity and each subject.

4.-Write the dataset created in the previous step to text file, with ordered and tidy data.


