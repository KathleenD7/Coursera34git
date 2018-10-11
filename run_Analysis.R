##reads in all of the data
xtest <- read.table("~/Documents/X_test.txt", quote="\"", comment.char="")
xtrain <- read.table("~/Documents/X_train.txt", quote="\"", comment.char="")
subjecttest <- read.table("~/Documents/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
ytest <- read.table("~/Documents/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
ytrain <- read.table("~/Documents/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
subjecttrain <- read.table("~/Documents/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
features <- read.table("~/Documents/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
activitylabels <- read.table("~/Documents/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
##combines the subjects and activity (but the activity is still a number) for the train data
fulltrain<-data.frame(subjecttrain,ytrain)
names(fulltrain)<-c("subject","activity")
##gets all of the correct column names
features1<-features[,2]
##changes names in the data to the correct column names
names(xtrain)<-features1
##combines all the data for train(the subject,activity,and the data)
train<-data.frame(fulltrain,xtrain)
##repeats same steps but for test
fulltest<-data.frame(subjecttest,ytest)
names(fulltest)<-c("subject","activity")
features1<-features[,2]
names(xtest)<-features1
test<-data.frame(fulltest,xtest)
##merges the train and test data
merged<-merge(train,test,all=TRUE)
##only get the columns with the words subject,activity,mean, or std
justmeanstd<-merged[ , grepl( "subject|activity|[Mm]ean|[Ss]td" , names(merged) ) ]
activitylabels<-as.character(activitylabels[,2])
##change numbers for activites to actual activity names
justmeanstd$activity<-activitylabels[justmeanstd$activity]
##changing the column names into descriptive variable names
names(justmeanstd) <- gsub("^t", " time ", names(justmeanstd))
names(justmeanstd) <- gsub("^fBody", " frequency Body", names(justmeanstd))
names(justmeanstd) <- gsub("Gyro", "Gyroscope", names(justmeanstd))
names(justmeanstd) <- gsub("Acc", "Accelerometer", names(justmeanstd))
names(justmeanstd) <- gsub("std", "standard deviation ", names(justmeanstd))
names(justmeanstd) <- gsub("[Mm]ag.", " magnitude ", names(justmeanstd))
names(justmeanstd) <- gsub("[Bb]ody", " Body ", names(justmeanstd))
names(justmeanstd) <- gsub("[Gg]ravity", " Gravity ", names(justmeanstd))
names(justmeanstd) <- gsub("Freq", " frequency ", names(justmeanstd))
##making a new dataset where the data set splits by the activity and subject and takes the mean of each column
aggdata <-aggregate(justmeanstd, by=list(activity2=justmeanstd$activity,subject2=justmeanstd$subject),FUN=mean, na.rm=TRUE)
##cleans up the new data set
aggdata$subject<-NULL
aggdata$activity<-NULL
colnames(aggdata) [2]<-"subject"
colnames(aggdata) [1]<-"activity"
