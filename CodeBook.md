---
title: "CodeBook.md"
author: "Mokolade Fadeyibi"
date: "6/14/2020"
output: html_document
---

Note: The R script assumes the source material has been downloaded and unzipped into the working directory.

## Process for Cleaning the Data.
The source material was obtained from the "Human Activity Recognition using Smartphones Data Set" project available from the UCI via the link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

More description on the project itself can be obtained from the link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

## The R Script
The files were downloaded and an R script "run_analysis.R" was written to analyse and clean this data. The script accomplishes five tasks:

1)	Merges the test and training sets to create one data set.
        a)	Reads three files for both test and training;
        b)	Merges and creates one dataset for test and one for training;
        c)	Renames the columns;
        d)	Adds the “Activity Label” to the datasets
        e)	Merges both to create one dataset ("merged_data")

2)	Extracts only the measurements on the mean and standard deviation for each measurement (“merged_data_extract”).

3)	Uses descriptive activity names to name the activities in the data set: activities were labeled using the information available from “activity_labels.txt” from the source material.

4)	Appropriately labels the data set with descriptive variable names: the variables were labeled using the information available from “features.txt” from the source material. 

5)	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This final data set is named “TidyDataSet”.

##Source Files Used
1) X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt and subject_train.txt contain the main data from source material.

2) features.txt contains the variable names of the gathered data.

3) Activity_labels.txt contains the description of the six activities.

##Variable Information
1) X_test, y_test, subject_test, X_train, y_train and subject_train contain the data read from the source material.

2) test_data_bind and train_data_bind contains all the information for test and train datasets, with the "Activity_Name" column added to describe the activities.

3) merged_data contains the test and train data merged into one dataset.

4) features contains the data read from the "features.txt" source material. The merged_data variable columns were renamed with information from the features variable.

5) merged_data_extract contains only measurements on the mean and standard deviation.

6) final_data contains the output from steps 1-4 sorted by subject ID.

7) TidyDataSet contains the output from step 5, which is an independent, tidy data set with the average of each variable for each activity and each subject. 

