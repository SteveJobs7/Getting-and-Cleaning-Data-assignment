The Data
========================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

[Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


The Variables
========================================================
The tidy set contains the following variables:
The set of variables that were estimated from these signals are: 

- mean(): Mean value. Type: Numeric  
- std(): Standard deviation. Type: Numeric  
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency. Type: Numeric  
- Subject: There are 30 subjects. Type: Numeric, Values: 1-30  
- Activity: Type: Factor, Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  



The Transformations
========================================================
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
