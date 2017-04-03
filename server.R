#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

 library(shiny)
 library(datasets)
 library(dplyr)

 shinyServer(function(input, output) {
   output$table <- renderDataTable({
     hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
     data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg,
                       GasolineExpenditure = input$distance/mpg*input$cost,
                       Cylinders = cyl,  Horsepower = hp,
                       Transmission = am)
     data <- filter(data,GasolineExpenditure <= input$gas, Cylinders %in% input$cyl,
                     Horsepower %in% hp_seq, Transmission %in% input$am)
     data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
     data <- arrange(data, GasolineExpenditure)
     data
   }, options = list(lengthMenu = c(10, 20, 30,40), pageLength = 20))
 })
# ShinyServer(function(input, output) {
#   output$data <- renderTable({
#     mtcars[, c("mpg", input$variable), drop = FALSE]
#   }, rownames = TRUE)
# }
# )