#
# User-interface definition of a Shiny web application called "WomenWeightandHeight"
##

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Women Weight vs Height"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Select your height in inches:"),
            sliderInput("sliderhgt",
                        "Height:",
                        min = 50,
                        max = 100,
                        value = 65),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Height vs Weight"),
            plotOutput("WeightHeight"),
            h4("Predicted Weight based on the selected Height:"),
            textOutput("predHgt")
        )
    )
))
