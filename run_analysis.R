# Download raw data and load tables
temp = tempfile(fileext = ".zip")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = temp,
              method = "curl")

activity_labels <- read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"))
features <- read.table(unz(temp, "UCI HAR Dataset/features.txt"))

y_test <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt" ))
y_train <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
subject_train <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))
subject_test <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
x_test <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt" ))
x_train <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))

# Set x column names
names(x_test) = features[,2]
names(x_train) = features[,2]

# combine train and test data
x_data <- rbind(x_train,x_test)
y_data <- rbind(y_train,y_test)

# Set y column names
y_data <- merge(y_data,activity_labels,by.x = "V1")
names(y_data) = c("ActivityID","Activity")
subject_data <- rbind(subject_train,subject_test)
names(subject_data) = "Subject"

# Merge data
merged_data <- cbind(subject_data,y_data, x_data)

# Extract data
mean_std <- merged_data[,c(1,2,3, grep(('mean|std'),colnames(merged_data)))]

# Create tidy dataset and write to tidydata.txt

library(reshape2)
melt_test <- melt(mean_std,id = c("Subject", "Activity"))
tidy_data <- dcast(melt_test,formula = Subject +Activity~..., mean)

write.table(tidy_data, file = "tidydata.txt",row.name=FALSE)

# Cleanup data
unlink(temp)
