# Data Visualisation - Session 5 - Worksheet 

## Section 0: Session Setup 
# Package Loading 
library(tidyverse) 

# Reload the data in: 

data <- read.csv(file = "data/welshgov_data.csv")

# Prepare Data for Analysis 

data <- data |>
  select(!Notes) |>
  select(!Data.description) |>
  rename(Number.of.activities = Data.values)

data$Number.of.activities <- as.numeric(data$Number.of.activities)
data$Academic.year <- as.factor(data$Academic.year)
data$Mode.of.programme <- as.factor(data$Mode.of.programme)
data$Home.region<- as.factor(data$Home.region)
data$Standardised.activity <- as.factor(data$Standardised.activity)
data$Age.group <- as.factor(data$Age.group)
data$Activity.level <- as.factor(data$Activity.level)
data$Welsh.fluency <- as.factor(data$Welsh.fluency)
data$Medium.of.delivery <- as.factor(data$Medium.of.delivery)

summary(data)