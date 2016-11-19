library(shiny)
# credit: this app is based on the k-means example on the shiny gallery by Joe Cheng <joe@rstudio.com>
shinyServer(function(input, output, session) {
     # build new data frame from selection
     new_df <- reactive({
       mtcars[, c(input$xcol, input$ycol)]
     })
     # build clusters from the new data frame
     # combined with the input on the number of clusters to build
     clusters <- reactive({
       kmeans(new_df(), input$clusters)
     })
     # Generate the plot to display clusters by colour and highlight ther centeroids.
     output$plot1 <- renderPlot({
          palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                    "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
          
          par(mar = c(5.1, 4.1, 3, 1))
          plot(new_df(),
               col = clusters()$cluster,
               pch = 20, cex = 3, main = paste("Scatterplot with ",input$clusters," clusters."))
          points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
     })
})