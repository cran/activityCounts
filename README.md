
<!-- README.md is generated from README.Rmd. Please edit that file -->

# activityCounts

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/activityCounts)](https://cran.r-project.org/package=activityCounts)
[![CRAN_latest_release_date](https://www.r-pkg.org/badges/last-release/activityCounts)](https://cran.r-project.org/package=activityCounts)
[![metacran
downloads](https://cranlogs.r-pkg.org/badges/activityCounts)](https://cran.r-project.org/package=activityCounts)
[![R-CMD-check](https://github.com/walkabillylab/activityCounts/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/walkabillylab/activityCounts/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Introduction

Many research areas use accelerometers to study people’s activities
including sleep, sedentary behaviour, and physical activity. Actigraph
is one of the most common research grade accelerometers. Actigraph
accelerometers include ActiLife is a closed-source software, which
generates [activity
counts](https://s3.amazonaws.com/actigraphcorp.com/wp-content/uploads/2017/11/26205758/ActiGraph-White-Paper_What-is-a-Count_.pdf).
There is considerable research validating and developing algorithms for
human activity using Actilife counts. Unfortunately, Actilife counts are
proprietary and difficult to implement if researchers use different
accelerometer brands. Recently, [Brond et
al.](https://pubmed.ncbi.nlm.nih.gov/28604558/) developed a
[code](https://github.com/jbrond/ActigraphCounts) in MATLAB, which can
convert raw accelerometer data to Actilife counts. Their work can help
researchers use different accelerometers and calculate Actilife counts,
MATLAB is a commercial program. Unlike MATLAB, R is open-source, and
also R is very popular among health and activity researchers. The
package activityCounts allow users to convert the accelerometer data to
Actilife counts.

### The goal of activityCounts is to calculate ActiLife counts based on the raw acceleration data.

## Installation

Please see
[NEWS.md](https://github.com/walkabillylab/activityCounts/blob/master/NEWS.md)
for a differences between the current CRAN release (0.1.2) and the
development version (0.2.0). The current development version will be
submitted to CRAN shortly.

You can install the version 0.1.2 of activityCounts from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("activityCounts")
```

You can install the development version 0.2.0 from
[GitHub](https://github.com/walkabillylab/activityCounts) with:

``` r
#install.packages("devtools")
devtools::install_github("walkabillylab/activityCounts")
```

## How to use

### Import the accelerometer data

Your dataset should contain at least three columns. Typically the first
column is the raw accelerometer data for the x-axis and the second and
the third columns are raw accelerometer data for the y and z-axes,
respectively. There is sample dataset available with this package, which
you can check the sample data format. To see the sample dataset run:

``` r
library(activityCounts)
View(sampleXYZ)
```

### Calculate counts

To calculate counts for your data, use the `counts()` function. Here is
an example of using the counts() function. We use the included sampleXYZ
dataset and then call the `counts()` function. The sampling frequency of
our data is 100Hz, so we need to pass this value when calling the
function counts:

``` r
calculated_output <- counts(data = sampleXYZ, hertz = 100)
```

The default value for `hertz()` function is 30. The user should be aware
of the data sampling frequency and pass the correct value to `hertz()`.
If the data frequency is less than 30 Hz, first resample your data and
increase the frequency to more than 30 Hz and then calculate the counts.

### Input data format.

activityCounts is flexible, and it can handle different data formats.
However, to use the function, you need to provide x, y, and z raw data.
The rest of the arguments are optional. The package assumes x, y, and z
raw data are stored in the first, second, and the third columns,
respectively. If the order is different use the `x_axis`, `y_axis`, and
`z_axis` functions to indicated each column of your input has which one
the axes. You should use the `hertz` argument to pass the sampling
frequency. The default value for sampling frequency is 30 Hz. If your
data contains a column of the time of the measurements, you can use
`time_column` argument to indicate your desired column, otherwise, use
the `start_time` argument to designate the starting time of your
analysis.<br> If none of these methods are used to indicate the start
time, the current time is considered as the start time.

In this example code, the first column has the time stamp for the data.
The second column has the x-axis data, the third column has the y-axis
data, and the fourth column has the z-axis data. Therefore, assuming the
sampling frequency is 100 Hz, we call the function like this:

``` r
calculated_output <- counts(data = your_raw_data, hertz = 100, x_axis = 2, y_axis = 3, z_axis = 4)
```

The default values for x_axis, y_axis, and z_axis are one, two, and
three respectively. So if you don’t specify them, the function assumes
the first column is for the x-axis, the second for the y-axis and the
third is for the z-axis.

In the following example, starting time is given:

``` r
my_start_time <- "2017-08-22 12:30:10"
my_counts <- counts(data = sampleXYZ, hertz = 100, start_time = my_start_time)
```

### Check the results

To verify the accuracy of the calculated counts for this particular
dataset, you can compare them with the provided `sampleCounts` dataset.
It contains counts calculated by ActiLife software and the `counts()`
function.

``` r
summary(sampleCounts)
```

To see the package help page run:

``` r
?activityCounts
```
