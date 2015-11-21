CodeBook.md

We have multiple files in multiple folders.
The files can contain one of the following
	Raw Data (various columns X various rows)
	Merge Table or lookup table(2 columns X multiple rows - ID to Lable lookup)
	Single Vector (single dimension with various entries)
	
We need to reconstruct the data in a way that attaches labels to the correct raw data 
and combines the data into useful tables

Raw Data is found in two tables
\UCI HAR Dataset\train\X_train.TXT
	7352 Records in 561 columns
\UCI HAR Dataset\test\x_test.TXT
	2947 Records in 561 columns

Merge Tables are 
UCI HAR Dataset\Actvity_lables.TXT
	ActivityID to ActivityLabel
UCI HAR Dataset\features.TXT
	RawData Column to Column Name
	
Single Dimension vector
\UCI HAR Dataset\train\y_train.txt
	Lines up activity_ID to train Raw Data
\UCI HAR Dataset\test\y_test.txt	
	Lines up activity_ID to test Raw Data
\UCI HAR Dataset\train\subject_train.txt
    Lines of the subject/user  to the train data
\UCI HAR Dataset\train\subject_test.txt	
    Lines of the subject/user  to the test data
	
To Build up a useable datatable we need to combine the two raw data tables with a row bind.
As per requirements we need to determine which columns based on the column lables.  
So we need to attach the labels via the Features.txt table
We can then limit the column based on a GREP command.

We have two options on determining the required columns as per the requirements.
One is to limit the columns to data lable ending with "mean" or "std"
the second option would include columns that contain "mean" or "std" anywhere in the title
I have opted the first of the two options to avoid including labels refering to the mean or 
standard diviation of calculated variables.

The variable names are determined base on columns with mean() or std().  
Only the columns that meet the given citeria are kept.  Variable columns are labled.

The AcivityID will be added to the two data tables.
An additional column will be created by merging the activityID with the activity Label table.

The two (test and train) tables are combined.

The subject IDs are combined to a single vector then added to the combined table.

The table is written as a text file - ClassProject_Tidy.txt

Data is grouped by activity.  Averages are computed by each variable column.
The group by activity averages are written to a txt file - ClassProject_MeanByActivity.txt

Data is groubed by Subject.  Averages are computed by each variable column.
The group by subject averages are written tao a txt file - ClassProject_MeanBySubject.txt

Variable Definition
Activity - Walking, Walking Upstairs, Walking Downstairs, sitting, standing, laying

SubjectID - Identify subject / user in test or trial data

Data was caputured in the following variables:

t Body Acceleration - mean in (X,Y,Z) - axis
"tBodyAcc-mean()-X"           
"tBodyAcc-mean()-Y"           
"tBodyAcc-mean()-Z"           

t Body Accelearation - standard deviation in (X,Y,Z) - axis
"tBodyAcc-std()-X"           
"tBodyAcc-std()-Y"            
"tBodyAcc-std()-Z"            

t Acceleration due to gravity - mean in (X,Y,Z) - axis
"tGravityAcc-mean()-X"        
"tGravityAcc-mean()-Y"       
"tGravityAcc-mean()-Z"        

t Acceleration due to gravity - standard deviation in (X,Y,Z) - axis
"tGravityAcc-std()-X"         
"tGravityAcc-std()-Y"         
"tGravityAcc-std()-Z" 

t Body Acceleration Jerk - mean in (X,Y,Z) - axis    
"tBodyAccJerk-mean()-X"       
"tBodyAccJerk-mean()-Y"       
"tBodyAccJerk-mean()-Z"       

t Body Acceleration Jerk - standard deviation in (X,Y,Z) - axis  
"tBodyAccJerk-std()-X"       
"tBodyAccJerk-std()-Y"        
"tBodyAccJerk-std()-Z"        

t Body Gyro - mean in (X,Y,Z) - axis
"tBodyGyro-mean()-X"          
"tBodyGyro-mean()-Y"         
"tBodyGyro-mean()-Z"          

t Body Gyro - standard deviation in (X,Y,Z) - axis
"tBodyGyro-std()-X"           
"tBodyGyro-std()-Y"           
"tBodyGyro-std()-Z"          

t Body Gyro Jerk - mean in (X,Y,Z) - axis
"tBodyGyroJerk-mean()-X"      
"tBodyGyroJerk-mean()-Y"      
"tBodyGyroJerk-mean()-Z"      

t Body Gyro Jerk - standard deviation in (X,Y,Z) - axis
"tBodyGyroJerk-std()-X"      
"tBodyGyroJerk-std()-Y"       
"tBodyGyroJerk-std()-Z"       

t Body Acceleration Magnitude Mean
"tBodyAccMag-mean()"          

t Body Acceleration Magnitude standard deviation
"tBodyAccMag-std()"          

t Body Acceleration due to gravity Mean
"tGravityAccMag-mean()"

t Body Acceleration due to gravity standard deviation    
"tGravityAccMag-std()" 

t Body Acceleration Jerk Magnitude Mean       
"tBodyAccJerkMag-mean()" 

t Body Acceleration Jerk Magnitude standard deviation  
"tBodyAccJerkMag-std()"

t Body Gyro Magnitude mean       
"tBodyGyroMag-mean()"         

t Body Gyro Magnitude standard deviation 
"tBodyGyroMag-std()"          

t Body Gyro Jerk Magnitude Mean
"tBodyGyroJerkMag-mean()"

t Body Gyro Jerk Magnitude Standard Deviation     
"tBodyGyroJerkMag-std()" 

f Body Acceleration - mean in (X,Y,Z) - axis
"fBodyAcc-mean()-X"           
"fBodyAcc-mean()-Y"           
"fBodyAcc-mean()-Z"           

t Boby Accelearation - standard deviation in (X,Y,Z) - axis
"fBodyAcc-std()-X"           
"fBodyAcc-std()-Y"            
"fBodyAcc-std()-Z"            

f Body Acceleration Jerk - mean in (X,Y,Z) - axis   
"fBodyAccJerk-mean()-X"       
"fBodyAccJerk-mean()-Y"      
"fBodyAccJerk-mean()-Z"       

f Body Acceleration Jerk - standard deviation in (X,Y,Z) - axis  
"fBodyAccJerk-std()-X"        
"fBodyAccJerk-std()-Y"        
"fBodyAccJerk-std()-Z"

f Body Gyro - mean in (X,Y,Z) - axis      
"fBodyGyro-mean()-X"          
"fBodyGyro-mean()-Y"          
"fBodyGyro-mean()-Z"          

f Body Gyro - standard deviation in (X,Y,Z) - axis
"fBodyGyro-std()-X"          
"fBodyGyro-std()-Y"           
"fBodyGyro-std()-Z" 
          
f Body Acceleration Magnitude Mean
"fBodyAccMag-mean()"          

f Body Acceleration Magnitude standard deviation
"fBodyAccMag-std()"
          
f Body Acceleration Jerk Mean 
"fBodyBodyAccJerkMag-mean()"  

f Body Acceleration Jerk Standard deviation
"fBodyBodyAccJerkMag-std()"   

f Body Gyro Magnitude Mean
"fBodyBodyGyroMag-mean()"     

f Body Gyro Magnitude Standard Deviation
"fBodyBodyGyroMag-std()"     

f Body Gyro Jerk Magnitude Mean
"fBodyBodyGyroJerkMag-mean()" 

f Body Gyro Jerk Magnitude Standard Deviation
"fBodyBodyGyroJerkMag-std()" 
 



