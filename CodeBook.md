#Code Book for Getting and Cleaning Data

To start the process of obtaining and cleaning the data, first I downloaded the files from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of what comes in the package is here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Once downloaded, the script reads in the data for both the test and training sets.  It then merges together the test and training sets for the information on the Subjects, the Labels, and most importantly the Measurements.

Using the features file given, we can extract the measurements for the mean and standard deviation, then using the activity labels file given, can apply descriptive names for the activities in the data set.

The tidyData set is then the created as the merged product of the measurements, participants identifier, and the descriptive labels.

Finally, tidyData2 is made using the average of each variable for each activity and each subject.

#Data Sets Used
TrainingSet - Data measurements from the training group.
TestSet - Data measurements from the test group.
combinedX - Merged measurements for the test and training groups.
combinedX_sdmean - Combined measurements for test and training groups with only standard deviation and mean measurements.
TrainSubject - Identifiers for the training group.
TestSubject - Identifiers for the test group.
combinedSubject - Merged group of identifiers the test and training groups.
TrainLabel - Labels for the data in training group.
TestLabel - Labels for data in the test group.
combinedLabel - Merged labels for the test and training groups.
features - Different availible features to apply to the data.
activity_labels - Readble, descriptive names for the activities.
tidyData - Combined tidy data set containing measurements, activity labels, and subjects.
tidyData2 - Average measurements for each activity and each subject.

#Variables
In both the tidyData and tidyData2, there are 68 columns displayed.  The first variable in both is the subject identifier number. The second variable is the activity label (i.e. standing, laying, walking).  The next 66 variables are the individual measurements taken, which include things like acceleration, jerk, and gyroscope, all taken at in mean and standard deviation measurements.
