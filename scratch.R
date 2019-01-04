library(readr)
library(tidyverse)
library(janitor)

#Reading in csv file from 2017 World Happiness Report. Data queried from World
#Happiness Report Data on data.world.  Use clean names to handle problematic
#variable names.

z <- read_csv("world-happiness-report-data-QueryResult.csv") %>% clean_names()


#Want to get an idea of what my dataset looks like. 
glimpse(z)

#Univariate Analysis
summary(z)

#The Statistical Appendix on data.world for the World Happiness Report says that
#there are some countries which which log_gdp_per_capita is not given. I wanted
#to see how many observations had missing values. I then remove observations
#with missing values.

colSums(is.na(z))

z <- z %>% na.omit()

#Want to get a sense of the relationship between log GDP per capita and Happiness
#score, so I use ggplot to create a scatter plot.

z %>% 
  ggplot(aes(x = z$log_gdp_per_capita, y = z$life_ladder)) + geom_point()


#Creating RDS file to use in my Shiny App. I write the RDS file to a folder
#inside of my Shiny App directory called shiny_data.

write_rds(z, path = "app/shiny_data/happiness.rds")




