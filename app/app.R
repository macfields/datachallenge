#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(shinythemes)
library(tools)
library(DT)

#reading in data from rds file into shiny app
happiness_shiny <- read_rds("shiny_data/happiness.rds")


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Regularization in Machine Learning"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         checkboxGroupInput("model",
                     "Choose Regression Model:",
                    choices = c("Ordinary Least Squares", "Ridge", "Lasso"),
                     selected = "Ordinary Least Squares")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("scatter"), 
         verbatimTextOutput("olssummary")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$scatter <- renderPlot({
     if(input$model == "Ordinary Least Squares") {
       happiness_shiny %>% 
         ggplot(aes(x = log_gdp_per_capita, y = life_ladder)) + geom_point() + geom_smooth(method = "lm")
     }
     else {
       happiness_shiny %>% 
       ggplot(aes(x = log_gdp_per_capita, y = life_ladder)) + geom_point()
     }
   })
   
   output$olssummary <- renderPrint ({
     ols_model <- lm(life_ladder ~ log_gdp_per_capita, data = happiness_shiny)
     summary(ols_model)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

