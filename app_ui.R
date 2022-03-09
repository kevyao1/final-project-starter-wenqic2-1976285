library("shiny")
library("plotly")
source("app_server.R")

## UI

intro_page <- tabPanel(
  titlePanel("Investigation of the size of the HIV/AIDS epidemic from 1990 - 2020."),
  mainPanel("What we care about is the survival rate of patients infected with AIDS.
            This question is important because it can help scientists investigate the
            change pattern of this disease. AIDS usually have long incubation periods
            and serious complications. Investigation of the survival rate and time 
            period can help us better understand the incubation periods. To address the
            question, we will focus on the number of alived patient and area distribution factors
             through 1990-2020 to analyze the disease.")
)