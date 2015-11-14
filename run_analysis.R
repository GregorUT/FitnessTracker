## Run_Analysis 

####################################
## Data Folder Configuration      ##
####################################

Source("DataFolderConfiguration.R")

LocalFileBase <- "C:/Project"

## If you already have the files downloaded, comment out the call to DataFolderConfiguration

DataFolderConfiguration(LocalFileBase)

PrjDataLocalDir <- paste(PrjLocalHome,"/Data",sep="")

## Base folder of the Downloaded Dataset
UCIDatasetDir <- paste(PrjDataLocalDir,"/UCI HAR Dataset",sep = "")

## Uncomment the following ling and enter the path to the location of the unzipped following,
#UCIDatasetDir <- "Location of unzipped Files"

