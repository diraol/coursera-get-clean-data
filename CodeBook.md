All data files and folders should be inside a data directory placed at the same folder as this script are.

# PART 1 - Merges the training and the test sets to create one data set.
## 1.1 - Reading files
Reading features names
Renaming features col names
Reading activity labels data (y_*.txt files)
Renaming test and train labels col name.
Reading subject files
Renaming test and train subjects col name.
Reading dataset
## 1.2 - 'Merging' 'test_ files' and 'train_ files'
## 1.3 - 'Merging' test and train variables

# Part 2 - Extracts only the measurements on the mean and standard deviation for # each measurement.
We will get all variables that has mean, Mean, Std or std on it's name,
except for that with 'angle', because it's a derivated variable.
Adding the index for the first two columns (subject and activity)
on the list of selected columns
Adding the index of all columns which the name matches the criteria
"mean", "Mean", "Std" or "std"
Getting the index from columns that has 'angle' in it's name
Removing the indexes wich has 'angle' on the name from the col_index list
Filtering the data with the desired columns

# Part 3 - Uses descriptive activity names to name the activities in the data set
## 3.1 - Loading the activity_labels file
## 3.2 - Merging activity_labels with the filtered_data by 'activity_id' column, which is the second column
## 3.3 - Replacing the activity_id values with the 'activity' column values
## 3.4 - Renaming the "activity_id" with "activity"

