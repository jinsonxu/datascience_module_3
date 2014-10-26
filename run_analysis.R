# Course Project of Getting and Cleaning Data Module of Data Science Specialization
# By: Jinson Xu
# Date: 17th Oct 2014

# clear workspace
rm(list=ls())



# get the data set zip, unzip in windows
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', 
#              destfile='./data/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', method='curl')

# obtain all the individual data items first
activityLabels <- read.csv('./data/UCI HAR Dataset/activity_labels.txt', sep=" ", 
                           stringsAsFactors = FALSE, header=FALSE,
                           na.strings=c(".", "NA", "", "?", "Not Available"), 
                           strip.white=TRUE, col.names=c('activityID', 'activityDescription')) # trim the whitespace in our values, save alot of trouble later

trainSubjects <- read.csv('./data/UCI HAR Dataset/train/subject_train.txt', sep=",", 
              stringsAsFactors = FALSE, header=FALSE,
              na.strings=c(".", "NA", "", "?", "Not Available"), 
              strip.white=TRUE, col.names=c('subjectID')) # trim the whitespace in our values, save alot of trouble later

testSubjects <- read.csv('./data/UCI HAR Dataset/test/subject_test.txt', sep=",", 
                         stringsAsFactors = FALSE, header=FALSE,
                         na.strings=c(".", "NA", "", "?", "Not Available"), 
                         strip.white=TRUE, col.names=c('subjectID')) # trim the whitespace in our values, save alot of trouble later

trainLabels <- read.csv('./data/UCI HAR Dataset/train/y_train.txt', sep=",", 
                        stringsAsFactors = FALSE, header=FALSE,
                        na.strings=c(".", "NA", "", "?", "Not Available"), 
                        strip.white=TRUE, col.names=c('activityID')) # trim the whitespace in our values, save alot of trouble later

testLabels <- read.csv('./data/UCI HAR Dataset/test/y_test.txt', sep=",", 
                        stringsAsFactors = FALSE, header=FALSE,
                        na.strings=c(".", "NA", "", "?", "Not Available"), 
                        strip.white=TRUE, col.names=c('activityID')) # trim the whitespace in our values, save alot of trouble later


featureNames <- read.csv('./data/UCI HAR Dataset/features.txt', sep="", 
                         stringsAsFactors = FALSE, header=FALSE,
                         na.strings=c(".", "NA", "", "?", "Not Available"), 
                         strip.white=TRUE, col.names=c('id', 'name')) # trim the whitespace in our values, save alot of trouble later


# get a vector of the column indices that we want
wantedFeaturesIndices <- grep("mean\\(\\)|std\\(\\)", featureNames$name, ignore.case=TRUE, perl=TRUE)
wantedFeatures <- as.list(featureNames$name[wantedFeaturesIndices])


# Lets sanitize the feature names.
wantedFeatures <- sapply(wantedFeatures, function(x) {
  x <- gsub('-(\\w{1})','\\U\\1',x, perl=TRUE)
  gsub('\\W','_',x)  
})



# Add in the additional columns
newFeatureNames <- append(wantedFeatures, c('subjectID','activityID'))


trainingSet <- read.csv('./data/UCI HAR Dataset/train/x_train.txt', sep="", 
                        stringsAsFactors = FALSE, header=FALSE,
                        na.strings=c(".", "NA", "", "?", "Not Available"), 
                        strip.white=TRUE) # trim the whitespace in our values, save alot of trouble later

testSet <- read.csv('./data/UCI HAR Dataset/test/x_test.txt', sep="", 
                    stringsAsFactors = FALSE, header=FALSE,
                    na.strings=c(".", "NA", "", "?", "Not Available"), 
                    strip.white=TRUE) # trim the whitespace in our values, save alot of trouble later

trainingSet <- trainingSet[,wantedFeaturesIndices]
testSet <- testSet[,wantedFeaturesIndices]


# Add subject and label for training
trainingSet[ncol(trainingSet)+1] <- trainSubjects$subjectID
trainingSet[ncol(trainingSet)+1] <- trainLabels$activityID

# Add subject and label for testing
testSet[ncol(testSet)+1] <- testSubjects$subjectID
testSet[ncol(testSet)+1] <- testLabels$activityID


# label the column names
names(testSet) <- newFeatureNames
names(trainingSet) <- newFeatureNames


trainingSet <- merge(activityLabels, trainingSet, by.x='activityID', by.y='activityID')
testSet <- merge(activityLabels, testSet, by.x='activityID', by.y='activityID')
trainingSet <- trainingSet[,-1]  # remove activityID
trainingSet <- trainingSet[,c(68, 2:67, 1)]  # reorder
testSet <- testSet[,-1]  # activityID
testSet <- testSet[,c(68, 2:67, 1)]  # reorder

 
# Make the names descriptive
workingFeatureNames <- names(trainingSet)
workingFeatureNames <- gsub('Std','StandardDeviation', workingFeatureNames, ignore.case=TRUE, perl=TRUE)
workingFeatureNames <- gsub('Freq','Frequency', workingFeatureNames, ignore.case=TRUE, perl=TRUE)
workingFeatureNames <- gsub('Acc','Acceleration', workingFeatureNames, ignore.case=TRUE, perl=TRUE)
workingFeatureNames <- gsub('Mag','Magnitude', workingFeatureNames, ignore.case=TRUE, perl=TRUE)
workingFeatureNames <- gsub('Gyro','Gyroscope', workingFeatureNames, ignore.case=TRUE, perl=TRUE)

workingFeatureNames <- gsub('^(t){1}','time', workingFeatureNames, ignore.case=TRUE, perl=TRUE)
workingFeatureNames <- gsub('^(f){1}','frequency', workingFeatureNames, ignore.case=TRUE, perl=TRUE)
workingFeatureNames <- gsub('(__)(x|y|z)$','For\\2', workingFeatureNames, ignore.case=TRUE, perl=TRUE)
workingFeatureNames <- gsub('_{1,}$','', workingFeatureNames, ignore.case=TRUE, perl=TRUE)




# Merge both data sets
dataSet <- rbind(trainingSet, testSet)

# Replace the column names
names(dataSet) <- workingFeatureNames



# Create tidy data set
tidySet <- aggregate(dataSet, 
                     by=list(subjectID = dataSet$subjectID, 
                             activityDescription = dataSet$activityDescription), 
                     FUN='mean', 
                     na.rm=TRUE)

# Remove the mean variables for our grouping variables
tidySet <- tidySet[,-c(1, ncol(tidySet))]
tidySet <- tidySet[, c(2:ncol(tidySet),1)]

# Now rename our column names to reflect the mean function
originalFeatureNames = names(tidySet)
workingFeatureNames = originalFeatureNames[1]
for(x in 2:(length(originalFeatureNames)-1)) {
    workingFeatureNames = append(workingFeatureNames, paste('AverageOf',
                                     gsub('^([\\w]{1})','\\U\\1',originalFeatureNames[x],perl=TRUE),
                                     sep=''))
}
workingFeatureNames[length(originalFeatureNames)] = originalFeatureNames[length(originalFeatureNames)]
names(tidySet) <- workingFeatureNames


# Write tidy data to a file
write.table(tidySet, file='tidy.txt', sep='\t', row.name=FALSE)


# cleanup
rm(testSet, trainingSet, featureNames, testLabels, testSubjects, trainLabels, trainSubjects, activityLabels)