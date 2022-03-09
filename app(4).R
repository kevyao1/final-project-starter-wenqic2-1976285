library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)
library(readr)
library(stringr)

data <- read_csv("http://apps.who.int/gho/athena/data/GHO/HIV_0000000006?filter=COUNTRY:-;REGION:*&ead=&x-sideaxis=REGION;YEAR&x-topaxis=GHO&profile=crosstable&format=csv")
data_g <- data %>% filter(`WHO region` == "Global")
data_g$`Number of deaths due to HIV/AIDS` <- 
  gsub(" ", "", str_sub(str_extract(data_g$`Number of deaths due to HIV/AIDS`, ".* \\["), start = 1, end = -3))
data_g$`Number of deaths due to HIV/AIDS` <- as.numeric(data_g$`Number of deaths due to HIV/AIDS`)
p1<- ggplot(data_g, aes(x= Year, y=`Number of deaths due to HIV/AIDS`)) + 
  geom_line() + geom_point() + theme_bw(base_size = 12)

# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("WHO Data on HIV deaths due to HIV"),
    plotlyOutput("distPlot")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$distPlot <- renderPlotly({
        ggplotly(p1)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
