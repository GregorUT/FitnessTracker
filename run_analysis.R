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

## prepair the tabels for the Column Names
DataColNames <- tblDataColNames[,2]

colnames(TrainData) <- DataColNames
colnames(TestData) <- DataColNames


## This version returns everything with mean or std and () in the name ** only one set should be used ** 
#meanCols <- grep("mean()",tblDataColNames$V2)
#stdCols <- grep("std()",tblDataColNames$V2)

## This version returns only those with "mean()" and "std()" in the name ** only one set should be used ** 
meanCols <- grep("mean()",tblDataColNames$V2, fixed = TRUE)
stdCols <- grep("std()",tblDataColNames$V2,fixed = TRUE)


## merge then sort the two columns 
DesiredCols <- append(as.numeric(meanCols),as.numeric(stdCols))
DesiredColsSorted <- sort(as.numeric(DesiredCols))

## Build the Frames
DesiredTrainData <- TrainData[,DesiredColsSorted]
DesiredTestData <- TestData[,DesiredColsSorted]

## Add the ActivityID then Activity Name
colnames(tblActivity)[1] <- c("ActivityID")

TrainWithActivity <- cbind(DesiredTrainData,tblTrainActivityID)
TestWithActivity <- cbind(DesiredTestData,tblTestActivityID)

colnames(TrainWithActivity)[67]<-c("ActivityID")
colnames(TestWithActivity)[67]<-c("ActivityID")

TrainWithActNames <- merge(x=TrainWithActivity, y=tblActivity, by="ActivityID", all.x = TRUE)
TestWithActNames <- merge(x=TestWithActivity, y=tblActivity, by="ActivityID", all.x = TRUE)

colnames(TrainWithActNames)[68]<-c("Activity")
colnames(TestWithActNames)[68]<-c("Activity")

#############################################################
## First set of tidy data                                  ##
#############################################################

# Combine Train and Test Datasets
TidyData <- rbind(TrainWithActNames, TestWithActNames)
write.table(TidyData, file = "ClassProject_Tidy.txt", row.names=FALSE)

#############################################################
## Add Subject ID to Tidy Data                             ##
#############################################################

FileSubjectIDTrain <- paste(TrainDataSetDir,"/Subject_Train.txt",sep = "")
FileSubjectIDTest <- paste(TestDataSetDir,"/Subject_Test.txt",sep = "")

SubjectIDTrain <- as.vector(read.table(FileSubjectIDTrain))
SubjectIDTest <- as.vector(read.table(FileSubjectIDTest))

## Add the test and train vectors into a single subject ID vector
SubjectIDs <- c(SubjectIDTrain, SubjecIDTest)

## Connect the Subject ID vector to the Tidy Data
TidyDataWithSubjects <- cbind(TidyData,SubjectIDs)
colnames(TidyDataWithSubjects)[69] <- c("SubjectID")
