# Getting and Cleaning Data Project

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

The ouput of the script contains in the first two columns
- activity: the type of activity performed
- subject: an identifier for the subject who performed the activity
Then follows a column for each variable, and the value in that column is the average value for the activity and subject in the corresponding row.