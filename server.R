library(shiny)
library(datasets)

mpgData <- mtcars
shinyServer(function(input, output) {
  
  inputVar <- reactive({
    paste("mpg ~ ", input$variable)
  })
  
  output$mpgPlot <- renderPlot({
    with(mpgData, {
      boxplot(as.formula(inputVar()), main = inputVar(), xlab = input$variable, ylab = "mpg")
      
    })
  })
})