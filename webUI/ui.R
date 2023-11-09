
library(shiny)

# Define UI for application that draws a histogram
fluidPage(
  shiny::headerPanel (title = "Create an alternative image"),
  fileInput("upload", "Select a file"),

  shiny::mainPanel (
  tableOutput("files" ),
  h3("Original Image:"),
  imageOutput("photo"),
  h3("Alternative Image:"),
  imageOutput("photo_alt")
  )
)
