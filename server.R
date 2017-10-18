library(shiny)
library(dplyr)
library(readr)
library(ggplot2)
library(plotly)

# Browsing LEGO Sets using data from www.bricklink.com
shinyServer(function(input, output) {
  showData <- reactive({
    data %>% 
    filter(between(`Year Released`, input$year[1], input$year[2])) %>% 
    group_by(`Year Released`) %>% 
    summarise(nrSets = n())
    })
  
  output$distPlot <- renderPlot({
    dat <- showData()
    ggplot(dat, aes(x = dat$`Year Released`, dat$nrSets)) + 
      geom_line() +
      labs(title = "Number of LEGO sets released per year", x = "Year of release", y = "Number of sets")
  })
  
  output$table <- renderTable(
    data %>% filter(between(`Year Released`, input$year[1], input$year[2]))
  )
})
