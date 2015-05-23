##set working directory
#setwd("C:/Users/kennedyal/Desktop/DS/Training/CourseraDS/Course 3 Getting Data/Project/GettingDataProject")

##install package
#install.packages("data.table")
#library(data.table)
#install.packages("data.table")
#library(data.table)
#read training files
x_train<- read.table("X_train.txt")
y_train<- read.table("y_train.txt")
subject_train<- read.table("subject_train.txt")

#read test sets
x_test<- read.table("X_test.txt")
y_test<- read.table("y_test.txt")
subject_test<- read.table("subject_test.txt")

#read in labels
act_labels<- read.table("activity_labels.txt")
features<- read.table("features.txt")

#rename variables in x_train
f<- as.vector(features$V2)
##loop to add names
for (i in 1:561)
{
  names(x_train)[i] <-f[i]
  
}

#rename subject_train column
names(subject_train) <-"subject_id"

#RENAME ACTIVITIES IN Y_TRAIN
y_train$V1[y_train$V1==1] <-'WALKING'
y_train$V1[y_train$V1==2] <-'WALKING_UPSTAIRS'
y_train$V1[y_train$V1==3] <-'WALKING_DOWNSTAIRS'
y_train$V1[y_train$V1==4] <-'SITTING'
y_train$V1[y_train$V1==5] <-'STANDING'
y_train$V1[y_train$V1==6] <-'LAYING'

#rename column in y_train
names(y_train) <-"activities"


#DO SAME FOR TEST VALUUES
#rename variables in x_train
f<- as.vector(features$V2)
##loop to add names
for (i in 1:561)
{
  names(x_test)[i] <-f[i]
  
}

#rename subject_train column
names(subject_test) <-"subject_id"

#RENAME ACTIVITIES IN Y_TRAIN
y_test$V1[y_test$V1==1] <-'WALKING'
y_test$V1[y_test$V1==2] <-'WALKING_UPSTAIRS'
y_test$V1[y_test$V1==3] <-'WALKING_DOWNSTAIRS'
y_test$V1[y_test$V1==4] <-'SITTING'
y_test$V1[y_test$V1==5] <-'STANDING'
y_test$V1[y_test$V1==6] <-'LAYING'

#rename column in y_test
names(y_test) <-"activities"

#add all train columns into one table
train<-cbind(subject_train, x_train)
train<-cbind(train, y_train)

#add all test columns into one table
test<-cbind(subject_test, x_test)
test<-cbind(test, y_test)

#merge both train and test
data<- rbind(train, test)

#install.packages("dplyr")
#library(dplyr)

#take only columns that are the mean or the standard deviation
tidy_data<- data[names(data) %like% "mean" | names(data) %like% "std" | names(data) %like% "subject" | names(data) %like% "activit"]

#create new tidy data with the avergaes for each column grouped by subject and activity
tidy_data_mean<- tidy_data %>% group_by(subject_id, activities) %>% summarise_each(funs(mean))





