## Code Book

Description of the Human Activity Recognition Using Smartphones Data Set preprocessing and cleaning to a resulting tidy data set.

### Abstract

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

### Files imported

* `features.txt`: Names of the 561 features.
* `activity_labels.txt`: Names and IDs for each of the 6 activities.

* `X_train.txt`: 7352 observations of the 561 features, for 21 of the 30 volunteers.
* `subject_train.txt`: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in `X_train.txt`.
* `y_train.txt`: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in `X_train.txt`.

* `X_test.txt`: 2947 samples of the 561 features.
* `subject_test.txt`: A vector of 2947 samples, related to observations in `X_test.txt`.
* `y_test.txt`: A vector of 2947 samples, of the activity related to each of the observations in `X_test.txt`.