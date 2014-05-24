# This script should be run with the data provided by 
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
# Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
# International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
# It merges information from various .txt files and creates a clean data set according to Coursera's 
# requiremens on Getting and Cleaning Data. It finally, saves the tidy data set as tidy_data.csv

# Check for required packages
if (!("reshape2" %in% rownames(installed.packages())) ) {
	print("Please install required package \"reshape2\" before proceeding")
} 
else {
	# Load required libraries
    library(reshape2)

	# Read list of features, i.e. column names for the constructed data frame
	features_mapping <- read.table("features.txt", header = FALSE, colClasses = c("numeric","character"), na.strings = c("N/A"))

	# Read mapping between number id and activity
	activity_labels <- read.table("activity_labels.txt", header = FALSE, colClasses = c("numeric","character"), na.strings = c("N/A")) 
	activity_labels <- activity_labels$V2
	
	# Read the test and trial data
	test_data <- read.table("test/X_test.txt", header = FALSE, colClasses = "numeric", na.strings = c("N/A"))
	train_data <- read.table("train/X_train.txt", header = FALSE, colClasses = "numeric", na.strings = c("N/A"))

	# Read subject id
	test_subject <- read.table("test/subject_test.txt", header = FALSE, colClasses = "numeric", na.strings = c("N/A"))
	train_subject <- read.table("train/subject_train.txt", header = FALSE, colClasses = "numeric", na.strings = c("N/A"))


	# Task 3 in assignment
	# Use descriptive activity names to name the activities in the data set
	test_activity <- read.table("test/y_test.txt", header = FALSE, colClasses = "numeric", na.strings = c("N/A"))
	test_activity <- activity_labels[test_activity$V1]
	train_activity <- read.table("train/y_train.txt", header = FALSE, colClasses = "numeric", na.strings = c("N/A"))
	train_activity <- activity_labels[train_activity$V1]

	# Construct data frame adding columns for subject id and activity label
	total_test <- cbind(test_data, test_subject, test_activity)
	total_train <- cbind(train_data, train_subject, train_activity)

	# Make labels for test and trial identical by assigning same labels.
	# This helps for the next step where we merge them
	colnames(total_test)[length(total_test)] <- "Activity"
	colnames(total_train)[length(total_train)] <- "Activity"

	# Task 1 in assignment
	# Merge the training and the test sets to create one data set.
	total <- rbind(total_train, total_test)

	# Task 4 in assignment
	# Appropriately label the data set with descriptive activity names. 
	column_names <- features_mapping[,2]
	colnames(total) <- c(column_names, "Subject", "Activity")

	# Task 2 in assignment
	# Extract only the measurements on the mean and standard deviation for each measurement. 
	# Mean should not be capital because in the features.txt file, it is described that the
	# mean is typed with "small m".
	total <- total[ , grepl( "mean|std|Subject|Activity" , names( total ), ignore.case= F ) ]

	# Step 5
	# Melt the dataset per Subject and Activity because we need to aggregate under these terms
	melted_total <- melt(total, id = c("Subject", "Activity") )

	# Group per activity and subject,  and calculate mean for each variable
	mean_total <- dcast(melted_total,Subject + Activity ~ variable,mean)
	
	## Create a file with the new tidy dataset
	write.csv(mean_total,"./tidy_data.csv")
}