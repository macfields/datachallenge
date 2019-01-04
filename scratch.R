library(readr)
library(tidyverse)
library(janitor)

#Reading in csv file froml 2017 World Happiness Report. Use clean names to
#handle problematic variable names.

y <- read_csv("2017.csv") %>% 
  clean_names()

#Want to get an idea of what my dataset looks like. 
glimpse(y)

#Univariate Analysis
summary(y)

#Want to get a sense of the relationship between GDP per capita and Happiness
#score, so I use ggplot to create a scatter plot.

y %>% 
ggplot(aes(x = y$economy_gdp_per_capita, y = y$happiness_score)) + geom_point()

#Creating RDS file to use in my Shiny App. I write the RDS file to a folder
#inside of my Shiny App directory called shiny_data.

write_rds(y, path = "app/shiny_data/happiness.rds")

