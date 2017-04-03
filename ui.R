#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

 library(shiny)

#library(markdown)
shinyUI(navbarPage("Rental Car Selections based on Your need",
                   tabPanel("Result",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                h4("Provide preferences:"),
                                numericInput('distance', 'Estimated Distance to Travel (in miles):', 100, min = 1, max = 2000),
                                numericInput('gas', 'Maximum expense on gas:', 55, min=1, max=1000),
                                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                                radioButtons('am', 'Transmission:', c("Automatic"=0, "Manual"=1)),
                               sliderInput('cost','Gasoline Price ($/gallon):', min=2.50, max=4.50, value=c(2.50,4.50), step =.1),
                               sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10)
                              ),
                              mainPanel(
                                dataTableOutput('table')
                              )
                            )
                   )
                    ,tabPanel("ReadMe",
                             mainPanel(
                               h4("The site is providing a tool to select the most fit car for your trip.
                                  
                                  It requires your inputs prefrence like distance of your trip and the price of gasoline,etc. 
                                  It's needed to calculate the Gasoline Expenditure for each car. Next with provided budget on gasoline, it can  show the car which has Miles per Gallon(MPG) that fit in your budget.
                                  
                                  Second, you can choose your desire cars characteristic in term of : Cylinders, Horse Power and Transmission.
                                  
                                  The result contains selected cars based on selection criteria in a table on the Result tab with using the [mtcars] dataset from [R] repository. You can sort the table according to the variable you want by clicking the arrows at the top of the table.")
                             )
                   )
))
