## Run_Analysis 

####################################
## Data Folder Configuration      ##
####################################

Source("DataFolderConfiguration.R")

PrjLocalBase<- "C:/Project"

## If you already have the files downloaded, comment out the call to DataFolderConfiguration

DataFolderConfiguration(LocalFileBase)

PrjDataLocalDir <- paste(PrjLocalBase,"/Data",sep="")

## Base folder of the Downloaded Dataset
UCIDatasetDir <- paste(PrjDataLocalDir,"/UCI HAR Dataset",sep = "")

## Uncomment the following ling and enter the path to the location of the unzipped following,
#UCIDatasetDir <- "Location of unzipped Files"


###################################
## Script Initialization         ##
###################################

## PUt the Directory structure into variables
TestDataSetDir <- paste(UCIDatasetDir,"/Test",sep = "")
TrainDataSetDir <- paste(UCIDatasetDir,"/Train",sep = "")

## put the File structure into variables
FileColVariableNamesTable <- paste(UCIDatasetDir,"/Features.TXT",sep = "")
FileActivityTable <- paste(UCIDatasetDir,"/activity_labels.TXT",sep = "")
FilePrimaryTrainData <- paste(TrainDataSetDir,"/X_Train.txt",sep = "")
FilePrimaryTestData <- paste(TestDataSetDir,"/X_Test.txt",sep = "")
FileTrainActivityID <- paste(TrainDataSetDir,"/Y_Train.txt",sep = "")
FileTestActivityID <- paste(TestDataSetDir,"/Y_Test.txt",sep = "")

##################################
## Read Tables in               ##
##################################
## Get the Variable Data
tblDataColNames <- read.table(FileColVariableNamesTable)
tblActivity <- read.table(FileActivityTable)

tblTrainActivityID <- read.table(FileTrainActivityID)
tblTestActivityID <- read.table(FileTestActivityID)

## Get the Actual Data
TrainData <- read.table(FilePrimaryTrainData)
TestData <- read.table(FilePrimaryTestData)

## prepair the tabels for the columns
DataColNames <- tblDataColNames[,2]

colnames(TrainData) <- DataColNames
colnames(TestData) <- DataColNames

colnames(tblActivity)[1] <- c("ActivityID")

## Add then name the labels to the table
# colnames(tblTrainActivityID) <- c("ActivityID")
# colnames(tblTestActivityID) <- c("ActivityID")

TrainWithActivity <- cbind(TrainData,tblTrainActivityID)
TestWithActivity <- cbind(TestData,tblTestActivityID)

colnames(TrainWithActivity)[562]<-c("ActivityID")
colnames(TestWithActivity)[562]<-c("ActivityID")

TrainWithActNames <- merge(x=TrainWithActivity, y=tblActivity, by="ActivityID", all.x = TRUE)
TestWithActNames <- merge(x=TestWithActivity, y=tblActivity, by="ActivityID", all.x = TRUE)


## This version returns everything with mean or std and () in the name ** only one set should be used ** 
#meanCols <- grep("mean()",tblDataColNames$V2)
#stdCols <- grep("std()",tblDataColNames$V2)

## This version returns only those with "mean()" and "std()" in the name ** only one set should be used ** 
meanCols <- grep("mean()",tblDataColNames$V2, fixed = TRUE)
stdCols <- grep("std()",tblDataColNames$V2,fixed = TRUE)



## merge then sort the two columns 
DesiredCols <- append(as.numeric(meanCols),as.numeric(stdCols))
DesiredColsSorted <- sort(as.numeric(DesiredCols))

## The merge command is adding the Activity ID to the front of the table.  
## Adding one to offset the additional column - This is a hack for now
DesiredColsIndex <- DesiredColsSorted+1

## Add activty Name 
DesiredColsIndex <- c(DesiredColsIndex,563)


## Desire Column Names - For Troubleshooting
# DesiredColNames <- colnames(TrainWithActivity[,DesiredColsIndex])

## Build the Frames
frmTrainData <- TrainWithActNames[,DesiredColsIndex]
frmTestData <- TestWithActNames[,DesiredColsIndex]

## Process Primary DataTable - Combine then Name Columns
FullSourceData <- rbind(TrainData, TestData)
