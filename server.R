#server.R code
library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  dataset <- reactive( {
    CO2[sample(nrow(CO2), input$sampleSize),]
  })
  
  output$plot <- reactivePlot(function() {
    
    pl <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$color != 'None')
      pl <- pl + aes_string(color=input$color)
    
    facets <- paste(input$facet_row, '~', input$facet_col)
    if (facets != '. ~ .')
      pl <- pl + facet_grid(facets)
    
    if (input$Jitter)
          pl <- pl + geom_jitter()
    # if (input$smooth)
    #   pl <- pl + geom_smooth()
    
    print(pl)
    
  }, height=600
  )
  
})
#This is a sample analysis performed with the shiny app.
#It shows the Carbon Dioxide Uptake in Grass Plants in differrent areas
