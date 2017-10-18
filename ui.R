library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("A LEGO Sets Browser"),
  h3("View either plots or the data in a table"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       h3("Settings for you to change"),
       sliderInput("year",
                   "Show sets between:",
                   min = 1950,
                   max = 2017,
                   value = c(1971, 1999),
                   sep = "")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("distPlot")),
        tabPanel("Table", tableOutput("table"))
      )
    )
  )
))
