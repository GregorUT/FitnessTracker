# FitnessTracker
Fitness Tracker - Getting and Cleaning Data - Course Project

Required Libraries
dplyr

scripts
DataFolderConfiguration.R - Checks Data.Zip in existing file structure.  Downloads Zip fir from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
extract into a subfolder structure.

run_analysis.R - Calls DataFolderConfiguration, Cleans data into a tidy format writes 3 tables to files.

Using your own downloaded data:

If you have manually downloaded data it should be in a subfolder structure under your current working directory
CurrentWorkingDirectory\TidyData\Data\UCI HAR Dataset
If you have met these requirements then comment out the call to:
DataFolderConfiguration(PrjLocalBase) 
about line 19 of the run_analysis.R script.

The run_analysis.R script reads in the data tables.

It will then select the columns with "mean()" or "std()" columns only from the train and test data.
The activity ID is then appedned to both of train and test tables.
A readable activty is added to the table.

The variable names are then added to the tables

The subject ID is read in.
The subject ID are added onto the table.

The Table is written to the current directory.

The data is the organized by Activity 
The averages are calculated.
The by Activity average for each variable is written to ClassProject_MeanByActivity.txt.

The data is organinzed by subject ID
The averages are calculated.
The by Subject average for each variable is writtent to ClassProject_MeanBySubject.txt.





