Study Design and Processing:

The experiments have been carried out with a group of 30 volunteers within ages 19-48. Each person performed WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING wearing a smartphone. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). . From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Creating the tidy data file:

run_analysis first reads in all of the data. Next, it combines the subjects and activity (but the activity is still a number) for the train data. Next, it gets all the column names from the features.txt file.Then it changes names in the data to the correct column names. Next, all of the data for train (the subject, activity, and the data) all get combined. In a similar fashion, all of this ten happens for the test data. Next, the test and train data gets merged. Next, the code filters for columns with only the words subject, activity, mean, or std. Finally, it changes the activities to actual activity names and changes the column names into mroe descriptive variable names. Aggdata creates a data where the data is split by activity and subject and the mean is taken of each column and finally, the data is cleaned up. # ioiqecnofiqeb
