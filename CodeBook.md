###CodeBook
###Main
To successfully execute the codes from the R script (run_analysis.R), you must download the zip file from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
**Steps**
1.setwd(), set up your working directory
2.download.file(), download the zip file from the above link
3.unzip(), unzip the dowloaded file
4.create three variables to store and read each file from text folder using read.table()
4.1.test_set
4.2.test_labels
4.3.test_subjects
5.cbind() to combine the three variables
6.create three variables to store and read each file from the train folder using read.table()
6.1.train_set
6.2.train_labels
6.3.train_subjects
7.cbind() to combine the three variables
8.rbind() to combine training and test data frames
9.extract from the new dataset only needed columns
10.name all the activity labels according to the activity_labels.txt file from the raw dataset
11.name all the variables (columns) using the list of column names
12.install and load reshape2 library
13.use melt() function with ids of Subjects and ActivityLabels
14.use dcast() function to get the mean for Subject and ActivityLabels accordingly
15. use write.table() to extract the new dataset to a new text file tidyData.txt
