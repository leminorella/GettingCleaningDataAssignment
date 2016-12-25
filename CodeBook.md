## Code Book for Getting and Cleaning Data Course Project

### Overview

[Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of the original data:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

[Full Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) at the site where the data was obtained:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	
### Process

The script `run_analysis.R` performs the following process to clean up the data
and create tiny data sets:

1. Merge the training and test sets to create one data set.

2. Reads `features.txt` and uses only the measurements on the mean and standard
   deviation for each measurement. 

3. Reads `activity_labels.txt` and applies human readable activity names to
   name the activities in the data set.

4. Labels the data set with descriptive names. (Names are converted to lower
   case; underscores and brackets are removed.)

5. Merges the features with activity labels and subject IDs. The result is
   saved as `MeanData.txt`.


### Variables

- testX - table contents of `test/X_test.txt`
- trainX - table contents of `train/X_train.txt`
- testSubject - table contents of `test/subject_test.txt`
- trainSubject - table contents of `test/subject_train.txt`
- testY - table contents of `test/y_test.txt`
- trainY - table contents of `train/y_train.txt`
- trainData - Combined all three train sets
- testData - Combined all three test sets
- fullData - Combined train and test data
- featuresName - table contents of `features.txt`
- featureIndex - Names of for data columns derived from featuresName
- Data - fullData with three columns
- colnames(Data) - logical vector of which features to use in tidy data set
- activitiyName - table contents of `activity_labels.txt`. Human readable
- groupData- subsetted, human-readable data ready for output according to project description.

### Output
#### `MeanData.txt`

`tidyData.txt` is a 10299x68 data frame.

- The first column contains subject IDs.
- The second column contains activity names.
- The last 66 columns are measurements.
- Subject IDs are integers between 1 and 30.
