##run_analysis.r

## Read in the training data

subdat <- read.table("./train/subject_train.txt") ##subject_train.txt identifies the volunteers by number for the training set
xtdat <- read.table("./train/X_train.txt") ##x_train.txt contains the training data regarding measurements
ytdat <- read.table("./train/y_train.txt") ##y_train.txt contains the activities by number

adat <- read.table("./activity_labels.txt") #activity_labels.txt is a small table identifing the ids with the 6 activities
fdat <- read.table("./features.txt") #features.txt is a listing of all the measurement data - representing the columns of the x_train.txt file

## create full training data set - activities associated with subjects associated with measurements
masterdat <- cbind(ytdat,subdat,xtdat)

## Read in the test data
xt2dat <- read.table("./test/X_test.txt") ##x_test.txt contains the test data regarding measurements
yt2dat <- read.table("./test/y_test.txt") ##y_test.txt contains the test activities by number
sub2dat <- read.table("./test/subject_test.txt") ##subject_test.txt identifies the volunteers by number for the test set

## create full test data set - activities associated with subjects associated with measurements
testdat <- cbind(yt2dat,sub2dat,xt2dat)

##merge both the training and test data together
masteradat <- rbind(masterdat,testdat)

##2. Reduce the number of columns of the data set to those we are interested in - to include mean and standard deviation measurements 
## and include the activity column data and the subject column data.
## Identifies the measurement data we want from the feature list table
wantedCols <- grep("mean|Mean|std",fdat$V2)
##as the masteradat table already reserved the 1st 2 columns for activity and subject, need to realign the desired column numbers
wantedaCols <- wantedCols +2
##extract the 1st two columns from masteradat file
t <- masteradat[,c(1,2)]
colnames(t) <- c("actID","subject")
##extract the remaining measurement columns
dat <- masteradat[,wantedaCols]
##append desired columns to form new masterdat table
masterdat <- cbind(t,dat)
##dim(masterdat)
## 10299    88

##3. Update the masterdat table to have descriptive column names and include the full name of the activity
colnames(masterdat)[1] <- "actID" 
colnames(adat) <- c("actID","activitylabel")
masterdat <- merge(adat, masterdat, by.x = "actID", by.y = "actID", all = TRUE)

##4. update the masterdat table with descriptive measurement column names
flabel <- as.vector(fdat[,2][wantedCols])
colnames(masterdat) <- c("activityid","activitylabel","subject",flabel)

##5.creating a new data set with summarizes the data set by 

aggdat<- aggregate(. ~ subject - activitylabel, data = masterdat, mean) 
write.table(aggdat, file = "./FinalProject.txt", row.names = FALSE)






