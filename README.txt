This repository contains the result of Programming Assignment under the “Getting and Cleaning Data” Course. This is a Johns Hopkins University curriculum offered on Coursera.

The files in this repository include:

README.txt

Codebook.md : contains detailed information on how the original data was transformed in my analysis.

run_analysis.R : contains the R script used in cleaning the data. This script assumes the source data is loaded in the working directory.

TidyDataSet.txt : this is the output of the 5th step of the programming assignment.

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