Getting-and-Cleaning-Data-assignment
====================================

The script first loads the library "reshape2", if not already loaded, and then procedes to load all relevant files. These are:
- features.txt: List of all features  
- activity_labels.txt: List of class labels and their activity name. 
- test/X_test.txt: Test set.  
- train/X_train.txt: Train set.  
- test/subject_test.txt: ID's of subjects in the test data set.  
- train/subject_train.txt:  ID's of subjects in the training data set.  
- test/y_test.txt: Test labels.  
- train/y_train.txt: Train labels.  

It then 
- Uses descriptive activity names to name the activities in the data set  
- Constructs data frames for the test and train data adding columns for subject id and activity label  
- Merges data and appropriately labels the data set with descriptive activity names. 
- Extract only the measurements on the mean and standard deviation for each measurement.  
- Melts the dataset per Subject and Activity because we need to aggregate under these terms.  
- Groups per activity and subject,  and calculate mean for each variable.  
- Creates a file with the new tidy dataset  
