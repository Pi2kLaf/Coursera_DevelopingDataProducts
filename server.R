#
# This is the server logic of tof a Shiny web application called "WomenWeightandHeight"
#

library(shiny)

# Define server logic required to draw a histogram of the weight and height
shinyServer(function(input, output) {
    set.seed(2019-11-12)

    height <- women[,1]
    weight <- women[,2]

    # Linear model
    model <- lm(weight~height)

    # Predict
    modelPred <- reactive ({
        hgtInput <- input$sliderhgt
        predict(model, newdata=data.frame(height=hgtInput))
    })

    # Render predictions
    output$predHgt <- renderText({
        round(modelPred(),0)
    })

    # Plot
    output$WeightHeight <- renderPlot({
        # draw the scatterplot Weight vs Height
        plot(weight~height, xlab="Height (in)", ylab="Weight (lbs)",
             main="Height vs Weight for American Women",
             pch=16, col = 'gray', border = 'darkgray')

        # draw line model
        abline(model, col="blue", lwd=2)

        # draw line pedicted weight
        abline(h=modelPred(), col="green", lwd=2)

        #legend
        legend("topleft", c("Linear Model", "Model Predictions"), col=c("blue", "green"), lty=c(1,1))
      })
})
