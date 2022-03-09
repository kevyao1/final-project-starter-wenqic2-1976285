library(ggplot2)
library(shiny)
library(dplyr)
setwd("~/Documents/FinalProject/final-project-starter-wenqic2-1976285/source")
source("Graph-1.R")

# Define UI for application that draws a histogram
Chart_1 <-
  tabPanel(
    "Graph",
    sidebarLayout(
      sidebarPanel(
        h1("Total HIV Cases by Region"),
        radioButtons("region", label = h3("WHO Region"), 
                          c(unique(as.character(hivdata$WHO_Region))))),
#        sliderInput("slider1", label = h3("Case limit"), min = 1990, 
 #                max = 2020, value = 2020)),                
      mainPanel(plotOutput(outputId = "graph"))
    ,
    ))
  

ui <- (
  fluidPage(
    navbarPage (
      
      "Graph_page_1",
      Chart_1
    )
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {

    output$graph <- renderPlot({
      setwd("~/Documents/FinalProject/final-project-starter-wenqic2-1976285/source")
      source("Graph-1.R")
      filter(hivdata, WHO_Region == input$region)
       ggplot(hivdata, aes(year, people_with_hiv, color = WHO_Region)) + geom_line() + 
        scale_y_continuous(labels = scales::comma)+
        labs(x = "Year", y = "Number of people living with HIV", title = "Total People Living With HIV Each Year")
      })
    
    
}
# Run the application 
shinyApp(ui = ui, server = server)
