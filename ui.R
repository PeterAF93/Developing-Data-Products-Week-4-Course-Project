library(shiny)
library(ggplot2)

dataset <- CO2

shinyUI(pageWithSidebar(
  
  headerPanel("Carbon Dioxide Uptake in Grass Plants"),
  
  
  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min=10, max=nrow(dataset),
                value=min(10, nrow(dataset)), step=5, round=0),
    
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset))),
    
    checkboxInput('Jitter', 'Jitter'),
    #checkboxInput('Density', 'Density'),
    #curve(aes(x = input$x, y = input$y, xend = input$x, yend = input$y, colour = "curve"), data = dataset)
    
    selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
    selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
))
