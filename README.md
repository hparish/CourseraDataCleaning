# CourseraDataCleaning
Final Project run_analysis script and readme.md
===========================================================================================
Coursera Data Cleaning Course
Week 4 Final Course Project
Holly Parish
===========================================================================================

BACKGROUND:
As part of an analysis of the data, a group of 30 volunteers participated in an experiment that included 
partaking in 6 activities: Walking, Walking upstairs, walking downstairs, laying down, sitting, standing.
A number of measurements were taken in order to perform a detailed analysis. The volunteers were split into 
2 groups which generated 2 different sets of data; the training set and the test set over a number of different
data files. 
For more details on the experiment and data collection, you can reference the UCI HAR Dataset 
found here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

THIS ANALYSIS:
The run_analysis_r script joins the training and test data from the numerous data files
and creates 1 tidy data text file that meets the principles of tidy data according to 
Hadley's paper. 
The sequence of the script is as follows:
1-Read both the test and training data into separate txt files.
2-Include the corresponding activity and subject (volunteer) data to each row.
At this point there are 2 data files with 563 columns.
3- Merged the test and training files together to create one master data file.
4- We're only interested in the column variables that indicate they are mean or 
standard deviation measurements, and thus the others were excluded once identified
through the column name - which was originally found in the features.txt file.
5- Tidied the column names to be more descriptive (instead of the assigned default 
Vn names)

You can read the output generated, once the script is sourced, by typing the following in R or R studio:
data <- read.table("./FinalProject.txt", header=TRUE)
View(data)

There is a codebook that defines the 89 fields in the FinalProject.txt file provind a 
description of each field. You can refer to it while decomposing the FinalProject.txt data.

ASSUMPTIONS:  
The Samsung data is already downloaded, already unzipped, and the resulting directory structure is a child under the current working directory. 
