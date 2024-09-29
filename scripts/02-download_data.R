#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto about homeless deaths by month.
# Author: Marcus Emmanuel Barnes
# Date: 29 September 2023
# Contact: marcus.e.barnes@utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(readr)
library(conflicted) # forces all conflicts to become errors.

#### Download data ####
# Code Reference: https://cran.r-project.org/web/packages/opendatatoronto/opendatatoronto.pdf

# get the package
package <- show_package("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e")

# get all the resources for this package
resources <- list_package_resources("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e")


# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- dplyr::filter(resources, tolower(format) %in% c('csv', 'geojson')) 

# We are interested in particular, the data on homeless deaths by month,
# which has id dc4ec2fa-d655-46ca-af32-f216d26e9804.
raw_data <- datastore_resources |> 
  dplyr::filter(grepl("dc4ec2fa-d655-46ca-af32-f216d26e9804", id)) |>
  head(1) |>
  get_resource()

#### Save the data ####
write_csv(raw_data, "data/01-raw_data/raw_homeless_deaths_by_month_data.csv") 

### Read the data ###

# Read in the homeless deaths by month.
# This is a check to confirm that the data was properly written and can be read.
readr:: read_csv("data/01-raw_data/raw_data.csv")
