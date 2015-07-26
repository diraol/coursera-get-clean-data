setwd("~/Cursos/coursera-get-clean-data")

# All data files and folders should be inside a data directory placed at the same
# folder as this script are.

# PART 1 - Merges the training and the test sets to create one data set.

## 1.1 - Reading files
    # Reading features names
    features = read.table('data/features.txt')
    # Renaming features col names
    names(features) = c('featureID', 'featureName')

    # Reading activity labels data (y_*.txt files)
    test_labels = read.table('data/test/y_test.txt')
    train_labels = read.table('data/train/y_train.txt')
    # Renaming test and train labels col name.
    names(test_labels) = c('activity_id')
    names(train_labels) = c('activity_id')

    # Reading subject files
    test_subject = read.table('data/test/subject_test.txt')
    train_subject = read.table('data/train/subject_train.txt')
    # Renaming test and train subjects col name.
    names(test_subject) = c('subject')
    names(train_subject) = c('subject')

    # Reading dataset
    xtest_file = 'data/test/X_test.txt'
    test_Xset = read.table(xtest_file, col.names = features$featureName)
    xtrain_file = 'data/train/X_train.txt'
    train_Xset = read.table(xtrain_file, col.names = features$featureName)

## 1.2 - 'Merging' 'test_ files' and 'train_ files'
    test = cbind(test_subject, test_labels, test_Xset)
    train = cbind(train_subject, train_labels, train_Xset)

## 1.3 - 'Merging' test and train variables
    full_data = rbind(test, train)


# Part 2 - Extracts only the measurements on the mean and standard deviation for
#           each measurement.

    # We will get all variables that has mean, Mean, Std or std on it's name,
    # except for that with 'angle', because it's a derivated variable.

    # Adding the index for the first two columns (subject and activity)
    # on the list of selected columns
    col_index = c(1,2)

    # Adding the index of all columns which the name matches the criteria
    # "mean", "Mean", "Std" or "std"
    col_index = c(col_index, grep('([Mm]ean)|([Ss]td)',names(full_data)))

    # Getting the index from columns that has 'angle' in it's name
    to_remove = grep('angle', names(full_data))

    # Removing the indexes wich has 'angle' on the name from the col_index list
    col_index = col_index[! col_index %in% to_remove]

    # Filtering the data with the desired columns
    filtered_data = full_data[,col_index]


# Part 3 - Uses descriptive activity names to name the activities in the
#           data set

    # 3.1 - Loading the activity_labels file
    activity_labels = read.table('data/activity_labels.txt', col.names = c('id','activity'))

    # 3.2 - Merging activity_labels with the filtered_data by 'activity_id'
    #       column, which is the second column
    merged_df = merge(filtered_data, activity_labels, by.x='activity_id', by.y='id')

    # 3.3 - Replacing the activity_id values with the 'activity' column values
    filtered_data$activity_id = merged_df$activity

    # 3.4 - Renaming the "activity_id" with "activity"
    names(filtered_data)[names(filtered_data) == 'activity_id'] <- 'activity'


# Part 4 - Appropriately labels the data set with descriptive variable names

    # Replacing variable names with descriptive ones.
    names(filtered_data) = c("Subject", "Activity", "Time-Body-Acceleration-Mean-axis-X", "Time-Body-Acceleration-Mean-axis-Y", "Time-Body-Acceleration-Mean-axis-Z", "Time-Body-Acceleration-StandardDeviation-axis-X", "Time-Body-Acceleration-StandardDeviation-axis-Y", "Time-Body-Acceleration-StandardDeviation-axis-Z", "Time-Gravity-Acceleration-Mean-axis-X", "Time-Gravity-Acceleration-Mean-axis-Y", "Time-Gravity-Acceleration-Mean-axis-Z", "Time-Gravity-Acceleration-StandardDeviation-axis-X", "Time-Gravity-Acceleration-StandardDeviation-axis-Y", "Time-Gravity-Acceleration-StandardDeviation-axis-Z", "Time-Body-Acceleration-Jerk-Mean-axis-X", "Time-Body-Acceleration-Jerk-Mean-axis-Y", "Time-Body-Acceleration-Jerk-Mean-axis-Z", "Time-Body-Acceleration-Jerk-StandardDeviation-axis-X", "Time-Body-Acceleration-Jerk-StandardDeviation-axis-Y", "Time-Body-Acceleration-Jerk-StandardDeviation-axis-Z", "Time-Body-Gyroscope-Mean-axis-X", "Time-Body-Gyroscope-Mean-axis-Y", "Time-Body-Gyroscope-Mean-axis-Z", "Time-Body-Gyroscope-StandardDeviation-axis-X", "Time-Body-Gyroscope-StandardDeviation-axis-Y", "Time-Body-Gyroscope-StandardDeviation-axis-Z", "Time-Body-Gyroscope-Jerk-Mean-axis-X", "Time-Body-Gyroscope-Jerk-Mean-axis-Y", "Time-Body-Gyroscope-Jerk-Mean-axis-Z", "Time-Body-Gyroscope-Jerk-StandardDeviation-axis-X", "Time-Body-Gyroscope-Jerk-StandardDeviation-axis-Y", "Time-Body-Gyroscope-Jerk-StandardDeviation-axis-Z", "Time-Body-Acceleration-Magnitude-Mean", "Time-Body-Acceleration-Magnitude-StandardDeviation", "Time-Gravity-Acceleration-Magnitude-Mean", "Time-Gravity-Acceleration-Magnitude-StandardDeviation", "Time-Body-Acceleration-Jerk-Magnitude-Mean", "Time-Body-Acceleration-Jerk-Magnitude-StandardDeviation", "Time-Body-Gyroscope-Magnitude-Mean", "Time-Body-Gyroscope-Magnitude-StandardDeviation", "Time-Body-Gyroscope-Jerk-Magnitude-Mean", "Time-Body-Gyroscope-Jerk-Magnitude-StandardDeviation", "Frequency-Body-Acceleration-Mean-axis-X", "Frequency-Body-Acceleration-Mean-axis-Y", "Frequency-Body-Acceleration-Mean-axis-Z", "Frequency-Body-Acceleration-StandardDeviation-axis-X", "Frequency-Body-Acceleration-StandardDeviation-axis-Y", "Frequency-Body-Acceleration-StandardDeviation-axis-Z", "Frequency-Body-Acceleration-Mean-Frequency-axis-X", "Frequency-Body-Acceleration-Mean-Frequency-axis-Y", "Frequency-Body-Acceleration-Mean-Frequency-axis-Z", "Frequency-Body-Acceleration-Jerk-Mean-axis-X", "Frequency-Body-Acceleration-Jerk-Mean-axis-Y", "Frequency-Body-Acceleration-Jerk-Mean-axis-Z", "Frequency-Body-Acceleration-Jerk-StandardDeviation-axis-X", "Frequency-Body-Acceleration-Jerk-StandardDeviation-axis-Y", "Frequency-Body-Acceleration-Jerk-StandardDeviation-axis-Z", "Frequency-Body-Acceleration-Jerk-Mean-Frequency-axis-X", "Frequency-Body-Acceleration-Jerk-Mean-Frequency-axis-Y", "Frequency-Body-Acceleration-Jerk-Mean-Frequency-axis-Z", "Frequency-Body-Gyroscope-Mean-axis-X", "Frequency-Body-Gyroscope-Mean-axis-Y", "Frequency-Body-Gyroscope-Mean-axis-Z", "Frequency-Body-Gyroscope-StandardDeviation-axis-X", "Frequency-Body-Gyroscope-StandardDeviation-axis-Y", "Frequency-Body-Gyroscope-StandardDeviation-axis-Z", "Frequency-Body-Gyroscope-Mean-Frequency-axis-X", "Frequency-Body-Gyroscope-Mean-Frequency-axis-Y", "Frequency-Body-Gyroscope-Mean-Frequency-axis-Z", "Frequency-Body-Acceleration-Magnitude-Mean", "Frequency-Body-Acceleration-Magnitude-StandardDeviation", "Frequency-Body-Acceleration-Magnitude-Mean-Frequency", "Frequency-Body-Body-Acceleration-Jerk-Magnitude-Mean", "Frequency-Body-Body-Acceleration-Jerk-Magnitude-StandardDeviation", "Frequency-Body-Body-Acceleration-Jerk-Magnitude-Mean-Frequency", "Frequency-Body-Body-Gyroscope-Magnitude-Mean", "Frequency-Body-Body-Gyroscope-Magnitude-StandardDeviation", "Frequency-Body-Body-Gyroscope-Magnitude-Mean-Frequency", "Frequency-Body-Body-Gyroscope-Jerk-Magnitude-Mean", "Frequency-Body-Body-Gyroscope-Jerk-Magnitude-StandardDeviation", "Frequency-Body-Body-Gyroscope-Jerk-Magnitude-Mean-Frequency")


# Part 5 - From the data set in step 4, creates a second, independent tidy data
#      set with the average of each variable for each activity and each subject.

    #

