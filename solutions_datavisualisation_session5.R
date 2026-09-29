# Data Visualisation - Session 5 - Worksheet 

## Section 0: Session Setup 
# Package Loading 
library(tidyverse) 

# Options 
options(scipen = 999)

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

# We can subset the data only to focus on those educational activities which occured in "All Areas"
data_region <- subset(data, 
                    Home.region == 'All areas')

## Section 2: Creating Visualisations using ggplot()

## Exercise 1: Creating basic plots
# Exercise 2.1a: Create a scatter plot (using geom_point()) to plot 
  # Number of Activities (x) against Academic Year (y)

ggplot(data = data_region) + 
  geom_point(mapping = aes(y = Academic.year, 
                        x = Number.of.activities))

# Exercise 2.1b: Create a histogram (using geom_histogram()) to plot 
  # Number of Activities (x)

ggplot(data = data_region) + 
  geom_histogram(mapping = aes(x = Number.of.activities))

# Exercise 2.1c: Create a bar chart (using geom_col()) to plot 
  # Academic Year (x) against Number of Activities (y)

ggplot(data = data_region) + 
  geom_col(mapping = aes(x = Academic.year, y = Number.of.activities))

## Exercise 2: Refining Visualisations

# Exercise 2.2a: Using the Scatterplot created in 1a, improve its readability using geom_jitter()

ggplot(data = data_region) + 
  geom_jitter(mapping = aes(y = Academic.year, 
                           x = Number.of.activities))


# Exercise 2.2b: On the histogram created in 1b, set appropriate limits to better view the data
  # Specify scales for both the x and y axis, using scale_x_continuous() and scale_y_continuous()

ggplot(data = data_region) + 
  geom_histogram(mapping = aes(x = Number.of.activities)) +
  scale_x_continuous(limits = c(0,100000)) + 
  scale_y_continuous(limits = c(0,25000))

# Exercise 2.2c: Using the bar chart created in 1c, convert this into a stacked bar chart
  # For this exercise, once again plot Academic Year (x), against Number of Activities (y), 
  # However also include Mode.of.programme as the stacked element (fill)
  # Ensuring to also include position = "stack", and stat = "identity"

ggplot(data = data_region) + 
  geom_bar(mapping = aes(x = Academic.year, 
                         y = Number.of.activities,
                         fill = Mode.of.programme),
           position = "stack", stat = "identity")

# Exercise 2.2d: From the chart created in 2.2c, we can see that "Total" is a total count, so should be dropped.
  # Using subset, drop Total from Mode.of.programme, then rerun Exercise 2.2c. 

data_reduced_region <- subset(data_region, 
                          Mode.of.programme != "Total")

droplevels(data_reduced_region$Mode.of.programme)

ggplot(data = data_reduced_region) + 
  geom_bar(mapping = aes(fill = Mode.of.programme, 
                         x = Academic.year, 
                         y = Number.of.activities),
           position = "stack", stat = "identity")

## Exercise 3: Applying Design Elements 
## Today we will not be applying the kas_style() theme
## However it works identically to other themes

# Exercise 2.3a: Apply one of the preset themes to one of the previous exercises 

ggplot(data = data_region) + 
  geom_jitter(mapping = aes(y = Academic.year, 
                            x = Number.of.activities)) + 
  theme_bw()


# Exercise 2.3b: Whilst applying one of the preset themes, add more information by: 
  # Create a jitter plot which plots Number of Activities (y), against Academic Year (x), 
  # Demonstrating the distribution of points by using colouring points depending on the age group

ggplot(data = data_region) + 
  geom_jitter(mapping = aes(y = Academic.year, 
                            x = Number.of.activities, 
                            colour = Age.group)) + 
  theme_bw()

# Exercise 2.3c: Adding even more information, Expand on the jitter plot from 2.3b, 
  # this time adding a shape variable linked to the Mode of Programme

ggplot(data = data_region) + 
  geom_jitter(mapping = aes(y = Academic.year, 
                            x = Number.of.activities, 
                            colour = Age.group, 
                            shape = Mode.of.programme)) + 
  theme_bw()
  
  
# Exercise 2.3d: Building on the plot created in 2.3a, use `theme(axis.text.x = element_text())` to rotate the axis labels by 90 degrees
  ## Note - you can add vjust = 0.5 and hjust = 1 to make things more readable!

  ggplot(data = data_region) + 
  geom_jitter(mapping = aes(x = Number.of.activities, 
                            y = Academic.year, 
                            colour = Age.group)) + 
  theme_bw() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1))

## Extension: Using all your knowledge learn today, create another data visualisation using different variables or data. 






