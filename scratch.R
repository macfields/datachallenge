library(readr)
library(tidyverse)


x<- read_csv("2017-18_NBA_salary.csv") %>% 
  select(Player,Salary,Age,MP)

glimpse(x)
names(x)
summary(x)

write_rds(x, path = "app/shiny_data/x.rds")
