# Data Analysis - Session 4 - Worksheet 

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

## Section 1: Conducting Simple Analysis 

## Part 1.1: Applying Analytic Functions 

# Exercise 1.1a: Determine the Standard Deviation on the Number of Activities 

# Exercise 1.1b: Determine the Quantiles of the Number of Activities in the Data

# Exercise 1.1c: Grouping by Academic.year, evaluate the mean, min and max number of activities. 

data |> 
  group_by(??) |>
  summarise(mean = mean(??),
            max = max(??),
            min = min(??))

# Exercise 1.1d: Conduct a more complex grouping by now grouping by both Mode of Programme and Academic year, 
  # Evaluating both the mean, min and max number of activities. 

data |> 
  group_by(??) |>
  summarise(mean = mean(??),
            max = max(??),
            min = min(??))

# Exercise 1.1e: Understanding this in the console is tricky, rerun Exercise 1.1d whilst assigning it to a variable. 


## Part 1.2: Using the `apply()` family of functions



## Section 2: Conduction Foundational Statistical Tests 

  # As our data does not contain two numeric variables, lets run some data manipulation. 
# Exercise 2.0a: Split the data using the methods learnt, split the dataset by Academic Year. 

# Exercise 2.0b: Taking two of the years, join them so we can compare the first year, to the second. 

## Part 2.1: Correlations 
 
## Part 2.2: Regressions

## Part 2.3 Other Statistical Tests 

## 