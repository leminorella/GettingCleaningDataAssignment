###### 1. Merges the training and the test sets to create one data set.

## Read data
testX <- read.table("test/X_test.txt")
trainX <- read.table("train/X_train.txt")
testSubject <- read.table("test/subject_test.txt")
trainSubject <- read.table("train/subject_train.txt")
testY <- read.table("test/y_test.txt")
trainY <- read.table("train/y_train.txt")

## Merge train and test data
trainData <- cbind(trainSubject, trainX, trainY)
testData <- cbind(testSubject, testX, testY)
fullData <- rbind(trainData, testData)

######## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

## Read features names
featuresName <- read.table("features.txt", stringsAsFactors=FALSE)[, 2]

## 
featureIndex <- grep(("mean\\(\\)|std\\(\\)"), featuresName)
Data <- fullData[, c(1, 2, featureIndex+2)]
colnames(Data) <- c("subject", "activity", featuresName[featureIndex])

###### 3. Uses descriptive activity names to name the activities in the data set

## read activity data
activityName <- read.table("activity_labels.txt")

## replace 1 to 6 with activity names
Data$Activity <- factor(Data$activity, levels = activityName[,1], labels = activityName[,2])

###### 4. Appropriately labels the data set with descriptive variable names. 

names(Data) <- gsub("\\()", "", names(Data))
names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequence", names(Data))
names(Data) <- gsub("-mean", "mean", names(Data))
names(Data) <- gsub("-std", "std", names(Data))

###### 6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
groupData <- Data %>%
      group_by(subject, activity) %>%
      summarise_each(funs(mean))

write.table(groupData, "MeanData.txt", row.names = FALSE)