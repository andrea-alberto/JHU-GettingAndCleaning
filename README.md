# Getting and Cleaning Data Project

The files produced through this project are
* README: this ReadMe file with the explanation of the project, the script produced, the data analyzed and the data produced
* codebook.md: a file with the description of the fields in the data produced
* run_analysis.R: the script produced with this project

The goal of the run_analysis.R script are
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of 
each variable for each activity and each subject.

The data analyzed are the "UCI HAR Dataset" obtained at the following URL
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This file has to be unzipped before running the script.

The following are the file needed to execure the run_analysis.R script
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The ouput of the script is in wide format of tidy data and contains in the first two columns
- activity: the type of activity performed
- subject: an identifier for the subject who performed the activity

Then follows a column for each variable, and the value in that column is the average value for the activity and subject in the corresponding row.

The script has to run in the same directory containing the "UCI HAR Dataset" (in the same directory of the files mentioned above).

== Internal script description ==
The script follows the following steps:
1. Reads the features file to get the feature names
2. Re-formats the feature names to delete brackets and substitutes "-" with "." (period)
3. Reads train measured data and their associated actitivities
4. Reads test measured data and their associated actitivities
5. Merges train and test data
6. Extracts only the measurements on the mean and standard deviation for each measurement, with subject and activity values
7. In the data substitues activity IDs with activity names
8. Computes the average of each measurement by activity and subject
9. Writes the computed averages in a file