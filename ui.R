library(shiny)

shinyUI(
  navbarPage("MTCARS APPLICATION",
             tabPanel("About the App",
                      helpText("This application lets you compare how certain variables like Number of Cyclinders or Type of Transmission, etc. affects the Miles Per Gallon(mpg) delivered by the car with the help of boxplots. "),
                      h3("The Data"),
                      p("You can choose any of the below variables to comapare against Miles per Gallon."),
                      
                      tags$ol(
                        tags$li(code("cyl"), "Number of cylinders"),
                        tags$li(code("vs"), "V-engine / Standard"),
                        tags$li(code("am"), "Transmission (0 = automatic, 1 = manual)"),
                        tags$li(code("gear"), "Number of forward gears"),
                        tags$li(code("carb"), "Number of carburetors")
                      ),
                      
                      h4("Head over to the next tab to use the app!"),
                    
                      h5("The code for this app is available at:"),
                      a("")
             ),
             tabPanel("Run",
                      fluidPage(
                        p("Discover which variables affect Miles per Gallon (mpg)."),
                        c("Choose any variable from the list to compare against mpg."),
                        fluidRow(
                          selectInput("variable", "",
                                      c(
                                        "Number of cylinders" = "cyl",
                                        "V-engine / Standard" = "vs",
                                        "Transmission" = "am",
                                        "Number of forward gears" = "gear",
                                        "Number of carburetors" = "carb"
                                      ),
                                      selected = NULL, 
                                      multiple = FALSE
                          ),
                          fluidRow(
                            plotOutput("mpgPlot"),
                            verbatimTextOutput("summaryFit")
                          )
                        )
                      )
             )
  )
)
