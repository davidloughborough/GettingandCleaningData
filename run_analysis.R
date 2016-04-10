##Bring in the Data Sets and Merge Them

TrainingSet <- read.table("~/Desktop/UCI HAR Dataset/train/X_train.txt")
TestSet <- read.table("~/Desktop/UCI HAR Dataset/test/X_test.txt")
combinedX <- rbind(TrainingSet, TestSet)

#Bring in the Subject Data Sets and Merge Them

TrainSubject <- read.table("~/Desktop/UCI HAR Dataset/train/subject_train.txt")
TestSubject <- read.table("~/Desktop/UCI HAR Dataset/test/subject_test.txt")
combinedSubject <- rbind(TrainSubject, TestSubject)

#Bring in the Labels and Merge Them

TrainLabel <- read.table("~/Desktop/UCI HAR Dataset/train/y_train.txt")
TestLabel <- read.table("~/Desktop/UCI HAR Dataset/test/y_test.txt")
combinedLabel <- rbind(TrainLabel, TestLabel)

#Get Rid of Unneeded Sets
rm(TrainingSet)
rm(TestSet)
rm(TrainSubject)
rm(TestSubject)
rm(TrainLabel)
rm(TestLabel)

##Extract Measurements for Mean and Standard Deviation for Each Measurement
features <- read.table("~/Desktop/UCI HAR Dataset/features.txt")
features_new <- features$V2

## Logical Vector to keep only std and mean columns
keepColumns <- grepl("(std|mean[^F])", features, perl=TRUE)

## Keep only data we want, and name it human readable
combinedX <- combinedX[, keepColumns]
names(combinedX) <- features_new[keepColumns]
names(combinedX) <- gsub("\\(|\\)", "", names(combinedX))
names(combinedX) <- tolower(names(combinedX))

activity_labels <- read.table("~/Desktop/UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] = gsub("_", "", tolower(as.character(activity_labels[,2])))
combinedLabel[,1] = activity_labels[combinedLabel[,1], 2]
names(combinedLabel) <- "activity" ## Add activity label

## Add human readable labels to activity names
names(combinedSubject) <- "subject"
tidyData <- cbind(combinedSubject, combinedLabel, combinedX)
write.table(tidyData, "tidyData.txt")

## Create second tiny data set with avg of each var for each act and each sub
uniqueSubject = unique(combinedSubject)[,1]
lengthSubject = length(uniqueSubject)
lengthActivities = length(activity_labels[,1])
lengthTidy = length(names(tidyData))
td = tidyData[ 1:(lengthSubject*lengthActivities), ]

row = 1
for (s in 1:lengthSubject) {
  for (a in 1:lengthActivities) {
    td[row,1] = uniqueSubject[s]
    td[row,2] = activity_labels[a, 2]
    tmp <- tidyData[tidyData$subject==s & tidyData$activity==activity_labels[a,2],]
    td[row, 3:nC] <- colMeans(tmp[, 3:lengthTidy])
    row = row + 1
  }
}

write.table(td, "tidyData2.txt")