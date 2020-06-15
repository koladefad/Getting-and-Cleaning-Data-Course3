##Steps 1-4
library(dplyr)
##Test Data Analysis
##Reading the three files
X_test <- read.table("~/Documents/R_files/Course3/Prog Ass 1/UCI HAR Dataset/test/X_test.txt", sep = "")
y_test <- read.table("~/Documents/R_files/Course3/Prog Ass 1/UCI HAR Dataset/test/y_test.txt", sep = "")
subject_test <- read.table("~/Documents/R_files/Course3/Prog Ass 1/UCI HAR Dataset/test/subject_test.txt", sep = "")

##Combining into one file
test_data <- cbind(X_test, y_test, subject_test)

##Renaming the two new columns
names(test_data)[562] <- "Activity"
names(test_data)[563] <- "Subject_id"

##Sorting the data by Activity
test_data_sorted <- arrange(test_data, Activity)

##Spliting into separate dataframes by Activity
test_data_1 <- test_data_sorted[test_data_sorted$Activity == 1,]
test_data_2 <- test_data_sorted[test_data_sorted$Activity == 2,]
test_data_3 <- test_data_sorted[test_data_sorted$Activity == 3,]
test_data_4 <- test_data_sorted[test_data_sorted$Activity == 4,]
test_data_5 <- test_data_sorted[test_data_sorted$Activity == 5,]
test_data_6 <- test_data_sorted[test_data_sorted$Activity == 6,]

##Adding another column with the Activity Name
test_data_1 <- mutate(test_data_1, Activity_Name = "Walking")
test_data_2 <- mutate(test_data_2, Activity_Name = "Walking_Upstairs")
test_data_3 <- mutate(test_data_3, Activity_Name = "Walking_Downstairs")
test_data_4 <- mutate(test_data_4, Activity_Name = "Sitting")
test_data_5 <- mutate(test_data_5, Activity_Name = "Standing")
test_data_6 <- mutate(test_data_6, Activity_Name = "Laying")

##Binding back into one dataset
test_data_bind <- bind_rows(test_data_1, test_data_2, test_data_3, test_data_4, test_data_5, test_data_6)

##Train Data Analysis
##Reading the three files
X_train <- read.table("~/Documents/R_files/Course3/Prog Ass 1/UCI HAR Dataset/train/X_train.txt", sep = "")
y_train <- read.table("~/Documents/R_files/Course3/Prog Ass 1/UCI HAR Dataset/train/y_train.txt", sep = "")
subject_train <- read.table("~/Documents/R_files/Course3/Prog Ass 1/UCI HAR Dataset/train/subject_train.txt", sep = "")

##Combining into one file
train_data <- cbind(X_train, y_train, subject_train)

##Renaming the two new columns
names(train_data)[562] <- "Activity"
names(train_data)[563] <- "Subject_id"

##Sorting the data by Activity
train_data_sorted <- arrange(train_data, Activity)

##Spliting into separate dataframes by Activity
train_data_1 <- train_data_sorted[train_data_sorted$Activity == 1,]
train_data_2 <- train_data_sorted[train_data_sorted$Activity == 2,]
train_data_3 <- train_data_sorted[train_data_sorted$Activity == 3,]
train_data_4 <- train_data_sorted[train_data_sorted$Activity == 4,]
train_data_5 <- train_data_sorted[train_data_sorted$Activity == 5,]
train_data_6 <- train_data_sorted[train_data_sorted$Activity == 6,]

##Adding another column with the Activity Name
train_data_1 <- mutate(train_data_1, Activity_Name = "Walking")
train_data_2 <- mutate(train_data_2, Activity_Name = "Walking_Upstairs")
train_data_3 <- mutate(train_data_3, Activity_Name = "Walking_Downstairs")
train_data_4 <- mutate(train_data_4, Activity_Name = "Sitting")
train_data_5 <- mutate(train_data_5, Activity_Name = "Standing")
train_data_6 <- mutate(train_data_6, Activity_Name = "Laying")

##Binding back into one dataset
train_data_bind <- bind_rows(train_data_1, train_data_2, train_data_3, train_data_4, train_data_5, train_data_6)

##Merging both test and train datasets
merged_data <- rbind(test_data_bind, train_data_bind)

##Features file
##Reading the features file
features <- read.table("~/Documents/R_files/Course3/Prog Ass 1/UCI HAR Dataset/features.txt", sep = "")

##Renaming the variable column
names(features)[2] <- "Variable"

##Mean
##Extracting the rows that contain "mean"
index_mean <- grep("mean", features$Variable)

##Extracting the names of the variables that contain "mean"
features_mean <- features$Variable[index_mean]

##Changing the class from "factor" to "character"
features_mean <- as.character(features_mean)

##Renaming the columns of our main dataset with the appropriate column names
names(merged_data)[index_mean] <- features_mean

##Std
##Extracting the rows that contain "std"
index_std <- grep("std", features$Variable)

##Extracting the names of the variables that contain "std"
features_std <- features$Variable[index_std]

##Changing the class from "factor" to "character"
features_std <- as.character(features_std)

##Renaming the columns of our main dataset with the appropriate column names
names(merged_data)[index_std] <- features_std

##Extracting only the columns for the mean and sd 
merged_data_extract <- merged_data[c(index_mean, index_std)]

##Binding with Subject ID and Activity Name
merged_data_extract <- cbind(merged_data$Subject_id, merged_data$Activity_Name, merged_data_extract)

##Renaming the columns for Subject ID and Activity Name
names(merged_data_extract)[1] <- "Subject_id"
names(merged_data_extract)[2] <- "Activity_Name"

##Arranging the final data by Subject ID
final_data <- arrange(merged_data_extract, Subject_id)

#Step 5
##Calclulating the average(mean) of each variable for each activity and each subject
TidyDataSet <- aggregate(. ~Subject_id + Activity_Name, final_data, mean)

##Rearranging the tidy data
TidyDataSet <- arrange(TidyDataSet, Subject_id, Activity_Name)

