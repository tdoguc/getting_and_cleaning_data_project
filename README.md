

<h1>Getting and Cleaning Data</h1>
<h2>Course Project</h2>

You should see one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.<br>
Extracts only the measurements on the mean and standard deviation for each measurement.<br>
Uses descriptive activity names to name the activities in the data set<br>
Appropriately labels the data set with descriptive activity names.<br>
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br><br>


<h2>Reproducing Data Manual;</h2>

Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.
<br><br>Put run_analysis.R under thefolder of UCI HAR Dataset, then set your working directory to sub directory under UCI HAR Dataset using setwd() function in RStudio. Ex: setwd("~/R Files/UCI HAR Dataset")

Run source("run_analysis.R"), then it will generate a new file gettingandcleaningdata_project.txt in your working directory

Dependent Libraries: "stringi", "dplyr"
