## Project Folder Creation
DataFolderConfiguration <- function(PrjLocalHome = "C:/Project")
{

	mkdirs <- function(fp) {
		if(!file.exists(fp)) {
           mkdirs(dirname(fp))
           dir.create(fp)
		}	
	}

## The Project Files will go in PrjLocalHome

## The DataFiles will go in PrjDataLocalDir
PrjDataLocalDir <- paste(PrjLocalHome,"/Data",sep="")

## Create Directories on the local system
mkdirs(PrjDataLocalDir)

## Name of the Local Zip file
PrjDataLocalFile <- paste(PrjLocalHome,"/data.zip",sep="")


## Project Data Files Download

PrjDataSourceURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists(PrjDataLocalFile))
{
    download.file(PrjDataSourceURL, PrjDataLocalFile)

## unzip the contents of the data.zip file to PjrDataLocalDir
    unzip(zipfile = PrjDataLocalFile, exdir = PrjDataLocalDir)
}
## Base folder of the Downloaded Dataset
UCIDatasetDir <- paste(PrjDataLocalDir,"/UCI HAR Dataset",sep = "")
}
