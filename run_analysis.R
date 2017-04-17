#setwd('D:/Personal/Projects/My/DataScienceToolboxCourse/prjs/UCI HAR Dataset')
library(data.table)

# read the features set
features <-  data.table(read.csv('features.txt', colClasses = c("integer", "character"), 
                                 col.names = c('num','name'), sep = '', header = FALSE))

# substitues -() and - with .
featureNames <- features$name

# remove - start
featureNames <- gsub('\\(\\)','',featureNames)
featureNames <- gsub('-','\\.',featureNames)
# remove - end


# create the class vector
classes <- rep("numeric", nrow(features))

# read the training set
# and 4. Appropriately labels the data set with descriptive variable names.
train <- data.table(read.csv('train/X_train.txt',
                             colClasses = classes,
                             header = FALSE,
                             sep='',
                             col.names = featureNames))
trainActivities <- read.csv('train/y_train.txt',
                             colClasses = c('factor'),
                             header = FALSE)
train$activity <- trainActivities$V1
trainSubjects <- read.csv('train/subject_train.txt',
                            colClasses = c('integer'),
                            header = FALSE)
train$subject <- trainSubjects$V1

# read the test set
# and 4. Appropriately labels the data set with descriptive variable names.
test <- data.table(read.csv('test/X_test.txt',
                            colClasses = classes,
                            header = FALSE,
                            sep='',
                            col.names = featureNames))
testActivities <- read.csv('test/y_test.txt',
                            colClasses = c('factor'),
                            header = FALSE)
test$activity <- testActivities$V1
testSubjects <- read.csv('test/subject_test.txt',
                          colClasses = c('integer'),
                          header = FALSE)
test$subject <- testSubjects$V1

# 1. Merges the training and the test sets to create one data set.
data <- rbind(train, test)

#identify the columns having mean or std values
meanOrStdColumns <- grep('(mean)|(std)',featureNames, value = TRUE)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement, with their activity and subject fields.
columns <- c('activity','subject',meanOrStdColumns)
extractedData <- data[, ..columns]

# 3. Uses descriptive activity names to name the activities in the data set
# read the activities names
activities <- read.csv('activity_labels.txt',
                             colClasses = c('integer', 'character'),
                             header = FALSE,
                             sep = '',
                             col.names = c('level','label'))
extractedData$activity <- factor(x = extractedData$activity, levels = activities$level, labels = activities$label)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#   each variable for each activity and each subject.
averageData <- extractedData[,lapply(.SD,mean),by=.(activity,subject)]
write.table(x = averageData, row.names = FALSE, file = 'averageData.txt')
