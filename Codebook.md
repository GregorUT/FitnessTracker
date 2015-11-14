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
	
To Build up a useable datatable we need to combine the two raw data tables with a row bind.
As per requirements we need to determine which columns based on the column lables.  
So we need to attach the labels via the Features.txt table
We can then limit the column based on a GREP command.

We have two options on determining the required columns as per the requirements.
One is to limit the columns to data lable ending with "mean" or "std"
the second option would include columns that contain "mean" or "std" anywhere in the title
I have opted the first of the two options to avoid including labels refering to the mean or 
standard diviation of calculated variables.





