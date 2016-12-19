#PART-1
# setting the directory
setwd("~/Desktop/Look/Education/Coursera/Data_Science_Certification/3_Getting_and_Cleaning_Data/assignments/assign4")
# saving the url of the file
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# downloading the file
download.file(fileUrl, destfile="./samsunggs.zip", method="curl")
# unziping the file
unzip("samsunggs.zip", exdir="samsunggs")
# using test_set, test_labels, and test_subject to read files from text directory, same process for the train directory
test_set <- read.table("./samsunggs/UCI HAR Dataset/test/X_test.txt")
test_subject <- read.table("./samsunggs/UCI HAR Dataset/test/subject_test.txt")
test_labels <- read.table("./samsunggs/UCI HAR Dataset/test/y_test.txt")
# using cbind to combine the test_set, test_subject, and test_labels files, same process for the train files
test <- cbind(test_set, test_subject, test_labels)
train_set <- read.table("./samsunggs/UCI HAR Dataset/train/X_train.txt")
train_subject <- read.table("./samsunggs/UCI HAR Dataset/train/subject_train.txt")
train_labels <- read.table("./samsunggs/UCI HAR Dataset/train/y_train.txt")
training <- cbind(train_set, train_subject, train_labels)
# using rbind to combine the rows of training and test files
training_and_test <- rbind(training, test)
# finding the dimension of the training_and_test file
dim(training_and_test)
# getting more information about the training_and_test file
head(training_and_test)

#PART-2
# extracting only mean and standard deviation columns
mean_std <- training_and_test[,c(562,563,1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543)]
dim(mean_std)

#PART-3
# naming the activity labels instead of numbers (1-6)
mean_std$V1.1 <- gsub("1",as.character("WALKING"),mean_std$V1.1)
mean_std$V1.1 <- gsub("2",as.character("WALKING_UPSTAIRS"),mean_std$V1.1)
mean_std$V1.1 <- gsub("3",as.character("WALKING_DOWNSTAIRS"),mean_std$V1.1)
mean_std$V1.1 <- gsub("4",as.character("SITTING"),mean_std$V1.1)
mean_std$V1.1 <- gsub("5",as.character("STANDING"),mean_std$V1.1)
mean_std$V1.1 <- gsub("6",as.character("LAYING"),mean_std$V1.1)

#PART-4
# providing column names for all of the variables in the file (68 columns total)
names(mean_std) <- c("Subjects", "ActivityLabels", "timeBodyAccelerationMeanX", "timeBodyAccelerationMeanTimeY", "timeBodyAccelerationMeanTimeZ", "timeBodyAccelerationStandardDeviationX", "timeBodyAccelerationStandardDeviationY", "timeBodyAccelerationStandardDeviationZ", "timeGravityAccelerationMeanTimeX", "timeGravityAccelerationMeanTimeY", "timeGravityAccelerationMeanTimeZ", "timeGravityAccelerationStandardDeviationX", "timeGravityAccelerationStandardDeviationY", "timeGravityAccelerationStandardDeviationZ", "timeBodyAccelerationJerkMeanX", "timeBodyAccelerationJerkMeanY", "timeBodyAccelerationJerkMeanZ", "timeBodyAccelerationJerkStandardDeviationX", "timeBodyAccelerationJerkStandardDeviationY", "timeBodyAccelerationJerkStandardDeviationZ", "timeBodyGyroscopeMeanX", "timeBodyGyroscopeMeanY", "timeBodyGyroscopeMeanZ", "timeBodyGyroscopeStandardDeviationX", "timeBodyGyroscopeStandardDeviationY", "timeBodyGyroscopeStandardDeviationZ", "timeBodyGyroscopeJerkMeanX", "timeBodyGyroscopeJerkMeanY", "timeBodyGyroscopeJerkMeanZ", "timeBodyGyroscopeJerkStandardDeviationX", "timeBodyGyroscopeJerkStandardDeviationY", "timeBodyGyroscopeJerkStandardDeviationZ", "timeBodyAccelerationMagnitudeMean", "timeBodyAccelerationMagnitudeStandardDeviation", "timeGravityAccelerationMagnitudeMean", "timeGravityAccelerationMagnitudeStandardDeviation", "timeBodyAccelerationJerkMagnitudeMean", "timeBodyAccelerationJerkMagnitudeStandardDeviation", "timeBodyGyroscopeMagnitudeMean", "timeBodyGyroscopeMagnitudeStandardDeviation", "timeBodyGyroscopeJerkMagnitudeMean", "timeBodyGyroscopeJerkMagnitudeStandardDeviation", "frequencyBodyAccelerationMeanX", "frequencyBodyAccelerationMeanY", "frequencyBodyAccelerationMeanZ", "frequencyBodyAccelerationStandardDeviationX", "frequencyBodyAccelerationStandardDeviationY", "frequencyBodyAccelerationStandardDeviationZ", "frequencyBodyAccelerationJerkMeanX", "frequencyBodyAccelerationJerkMeanY", "frequencyBodyAccelerationJerkMeanZ", "frequencyBodyAccelerationJerkStandardDeviationX", "frequencyBodyAccelerationJerkStandardDeviationY", "frequencyBodyAccelerationJerkStandardDeviationZ", "frequencyBodyGyroscopeMeanX", "frequencyBodyGyroscopeMeanY", "frequencyBodyGyroscopeMeanZ", "frequencyBodyGyroscopeStandardDeviationX", "frequencyBodyGyroscopeStandardDeviationY", "frequencyBodyGyroscopeStandardDeviationZ", "frequencyBodyAccelerationMagnitudeMean", "frequencyBodyAccelerationMagnitudeStandardDeviation", "frequencyBodyBodyAccelerationJerkMagnitudeMean", "frequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation", "frequencyBodyBodyGyroscopeMagnitudeMean", "frequencyBodyBodyGyroscopeMagnitudeStandardDeviation", "frequencyBodyBodyGyroscopeJerkMagnitudeMean", "frequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation")
# confirming the column names
names(mean_std)

#PART-5
# installing reshape2 package
install.packages("reshape2")
# loading the reshape2 package
library(reshape2)
# melting the mean_std data.frame by Subjects and ActivityLabels
meltmean_std <- melt(mean_std, id=c("Subjects", "ActivityLabels"), measure.vars=c("timeBodyAccelerationMeanX", "timeBodyAccelerationMeanTimeY", "timeBodyAccelerationMeanTimeZ", "timeBodyAccelerationStandardDeviationX", "timeBodyAccelerationStandardDeviationY", "timeBodyAccelerationStandardDeviationZ", "timeGravityAccelerationMeanTimeX", "timeGravityAccelerationMeanTimeY", "timeGravityAccelerationMeanTimeZ", "timeGravityAccelerationStandardDeviationX", "timeGravityAccelerationStandardDeviationY", "timeGravityAccelerationStandardDeviationZ", "timeBodyAccelerationJerkMeanX", "timeBodyAccelerationJerkMeanY", "timeBodyAccelerationJerkMeanZ", "timeBodyAccelerationJerkStandardDeviationX", "timeBodyAccelerationJerkStandardDeviationY", "timeBodyAccelerationJerkStandardDeviationZ", "timeBodyGyroscopeMeanX", "timeBodyGyroscopeMeanY", "timeBodyGyroscopeMeanZ", "timeBodyGyroscopeStandardDeviationX", "timeBodyGyroscopeStandardDeviationY", "timeBodyGyroscopeStandardDeviationZ", "timeBodyGyroscopeJerkMeanX", "timeBodyGyroscopeJerkMeanY", "timeBodyGyroscopeJerkMeanZ", "timeBodyGyroscopeJerkStandardDeviationX", "timeBodyGyroscopeJerkStandardDeviationY", "timeBodyGyroscopeJerkStandardDeviationZ", "timeBodyAccelerationMagnitudeMean", "timeBodyAccelerationMagnitudeStandardDeviation", "timeGravityAccelerationMagnitudeMean", "timeGravityAccelerationMagnitudeStandardDeviation", "timeBodyAccelerationJerkMagnitudeMean", "timeBodyAccelerationJerkMagnitudeStandardDeviation", "timeBodyGyroscopeMagnitudeMean", "timeBodyGyroscopeMagnitudeStandardDeviation", "timeBodyGyroscopeJerkMagnitudeMean", "timeBodyGyroscopeJerkMagnitudeStandardDeviation", "frequencyBodyAccelerationMeanX", "frequencyBodyAccelerationMeanY", "frequencyBodyAccelerationMeanZ", "frequencyBodyAccelerationStandardDeviationX", "frequencyBodyAccelerationStandardDeviationY", "frequencyBodyAccelerationStandardDeviationZ", "frequencyBodyAccelerationJerkMeanX", "frequencyBodyAccelerationJerkMeanY", "frequencyBodyAccelerationJerkMeanZ", "frequencyBodyAccelerationJerkStandardDeviationX", "frequencyBodyAccelerationJerkStandardDeviationY", "frequencyBodyAccelerationJerkStandardDeviationZ", "frequencyBodyGyroscopeMeanX", "frequencyBodyGyroscopeMeanY", "frequencyBodyGyroscopeMeanZ", "frequencyBodyGyroscopeStandardDeviationX", "frequencyBodyGyroscopeStandardDeviationY", "frequencyBodyGyroscopeStandardDeviationZ", "frequencyBodyAccelerationMagnitudeMean", "frequencyBodyAccelerationMagnitudeStandardDeviation", "frequencyBodyBodyAccelerationJerkMagnitudeMean", "frequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation", "frequencyBodyBodyGyroscopeMagnitudeMean", "frequencyBodyBodyGyroscopeMagnitudeStandardDeviation", "frequencyBodyBodyGyroscopeJerkMagnitudeMean", "frequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation"))
head(meltmean_std)
dim(meltmean_std)
# using dcast to get the mean of all the 30 subjest + 6 ActivityLabels with the correcsponding 66 colums
tidyData <- dcast(meltmean_std, Subjects + ActivityLabels~variable, mean)
# displaying the dimensions of the tidyData, which is 180 by 68
dim(tidyData)
# writing the dataset into the text file
write.table(tidyData, file="~/Desktop/Look/Education/Coursera/Data_Science_Certification/3_Getting_and_Cleaning_Data/assignments/assign4/tidydata.txt", row.names = FALSE)
