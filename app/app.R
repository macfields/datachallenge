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
         plotOutput("scatter")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$scatter <- renderPlot({
     if(input$model == "Ordinary Least Squares") {
       x %>% 
         ggplot(aes(x = MP, y = Salary)) + geom_point() + geom_smooth(method = "lm")
     }
     else {
       x %>% 
       ggplot(aes(x = MP, y = Salary)) + geom_point()
     }
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

