library(shiny)
shinyUI(fluidPage(
  titlePanel("k-means clustering on mtcars data set"),
  sidebarLayout(
    sidebarPanel(
      h3("Select features and number of clusters"),
      selectInput("xcol", "Pick the feature for the X-axis", names(mtcars), selected = names(mtcars)[[1]]),
      selectInput("ycol", "Pick the feature for the Y-axis", names(mtcars), selected = names(mtcars)[[6]]),
      numericInput('clusters', 'In how many clusters should the data be grouped?', 5,
                   min = 1, max = 9),
      submitButton("Recalculate")
    ),
    mainPanel(
         tabsetPanel(type = "tabs",
                     tabPanel("Plot", br(),plotOutput("plot1")),
                     tabPanel("Help", br(),HTML("The purpose of this app is to make some exploratory data analysis 
                              using <b>k-means clustering algorithms,</b>. <br><br>
                              It allows you to play with the features from the default dataset 'mtcars'.<br>
                              You can select any of the features from the mtcars dataset. Additionally, you can
                              select a number of clusters that you would like the k-means algorithm to calculate.<br>
                              Once you've made the selection, you need to press on 'Recalculate'.<br><br>
                              Note, you need to return to the 'Plot' tab to see the results."))
         )
    )
  )
))
