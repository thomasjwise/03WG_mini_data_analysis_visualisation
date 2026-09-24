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
sd(data$Number.of.activities, na.rm = TRUE)

# Exercise 1.1b: Determine the Quantiles of the Number of Activities in the Data
quantile(data$Number.of.activities, na.rm = TRUE)

# Exercise 1.1c: Grouping by Academic.year, evaluate the mean, min and max number of activities. 

data |> 
  group_by(Academic.year) |>
  summarise(mean = mean(Number.of.activities, na.rm = TRUE),
            max = max(Number.of.activities, na.rm = TRUE),
            min = min(Number.of.activities, na.rm = TRUE))

# Exercise 1.1d: Conduct a more complex grouping by now grouping by both Mode of Programme and Academic year, 
# Evaluating both the mean, min and max number of activities. 

data |> 
  group_by(Academic.year, Mode.of.programme) |>
  summarise(mean = mean(Number.of.activities, na.rm = TRUE),
            max = max(Number.of.activities, na.rm = TRUE),
            min = min(Number.of.activities, na.rm = TRUE))

# Exercise 1.1e: Understanding this in the console is tricky, rerun Exercise 1.1d whilst assigning it to a variable. 
data_summary <- data |> 
                  group_by(Academic.year, Mode.of.programme) |>
                  summarise(mean = mean(Number.of.activities, na.rm = TRUE),
                            max = max(Number.of.activities, na.rm = TRUE),
                            min = min(Number.of.activities, na.rm = TRUE))

## Part 1.2: Using the `apply()` family of functions

# One of the most effective uses of the `apply()` family of functions, is the manipulation of data. 
# Lets first load in the data again: 
data_new <- read.csv(file = "data/welshgov_data.csv")

# We can still do the first stages again:
data_new <- data_new |>
  select(!Notes) |>
  select(!Data.description) |>
  rename(Number.of.activities = Data.values)

# Exercise 1.2a: Using the sapply function 'sapply()', isolate the columns with the type character. 
# Before assigning it to a variable.
# Hint: You can use the is.character parameter for this. 

chr_cols <- sapply(data_new, is.character)

# Exercise 1.2b: Using the lapply function 'lapply()', set all character columns to factors
# Making sure to reassign them to the columns correctly. 
# Hint: You can use the as.factor parameter for this conversion.

data_new[chr_cols] <- lapply(data_new[chr_cols], as.factor)

# Exercise 1.2c: Using summary(), evaluation the dataset in question again. 

summary(data_new)


## Section 2: Conduction Foundational Statistical Tests 
# As our data does not contain 2 numeric variables, we will skip straight to regressions. 

## Part 2.1: Regressions
# For our regressions, we will want to predict the number of activities based on any number of other variables 
# Exercise 2.1a: Create a simple linear model (using `lm()`) to predict: 
# Number of Activities by Age Group (formula = Number.of.activities ~ Age.group)
# Ensure to assign this to a variable for later use

lm_model_1 <- lm(data = data, formula = Number.of.activities ~ Age.group)

# Exercise 2.1b: Run a summary call on this created linear model, to understand the coefficients, significance level and more! 

summary(lm_model_1)

# Exercise 2.1c: Using the general linear model function (using `glm()`) to predict: 
# Number of activities by Medium of Delivery and Mode of Programme 
# I would recommend you set the family value to gaussian, however please experiment to see the difference! 

glm_region_all <- glm(data = data_cut_region, family = gaussian, 
                      formula = Number.of.activities ~ Medium.of.delivery + Mode.of.programme)

# Exercise 2.1d: Run a summary call on this created generalised linear model. 

summary(glm_region_all)

## Part 2.2: Extension - Other Statistical Tests 
# As an extension, look to apply any other statistical tests to the data. 

# To examine what is needed and other information on the tests, either use: 
# The Help Pane (often bottom right) or prefix the function with ?
