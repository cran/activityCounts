## ----include = T, echo= FALSE-------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# install.packages("activityCounts")

## ----eval=FALSE---------------------------------------------------------------
# install.packages("devtools")
# devtools::install_github("walkabillylab/activityCounts")

## ----setup--------------------------------------------------------------------
library(activityCounts)

## ----eval=FALSE---------------------------------------------------------------
# # install.packages("tidyverse")
# raw_accel_data <- tidyverse::read_csv("~/your_raw_accelerometer_data.csv")

## ----eval=FALSE---------------------------------------------------------------
# # assume sampling frequency is 100 Hz
# sampling_frequency <- 100
# counts_measures <- activityCounts::counts(data = raw_accel_data, hertz = sampling_frequency)

## -----------------------------------------------------------------------------
data("sampleXYZ")
head(sampleXYZ)

## ----eval=FALSE---------------------------------------------------------------
# sampleXYZ_counts <- counts(data = sampleXYZ, hertz = 100 ,x_axis = 1,y_axis = 2,z_axis = 3)
# head(sampleXYZ_counts)

## ----eval=FALSE---------------------------------------------------------------
# calculated_output <- counts(data = your_raw_data, hertz = 100, x_axis = 2, y_axis = 3, z_axis = 4)

## ----message=FALSE, warning=FALSE---------------------------------------------
summary(sampleCounts)

## ----echo=FALSE, message=FALSE, warning=FALSE---------------------------------
plot(sampleCounts$activityCounts_x_counts, sampleCounts$ActiLife_x_counts)
plot(sampleCounts$activityCounts_y_counts, sampleCounts$ActiLife_y_counts)
plot(sampleCounts$activityCounts_z_counts, sampleCounts$ActiLife_z_counts)

