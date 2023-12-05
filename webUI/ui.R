
library(shiny)

# Define UI for application that draws a histogram
fluidPage(
  shiny::headerPanel (title = "Create an alternative image"),

  HTML("<p style='padding: 10px; font-style: italic;'>Please note:
       <br><b> If you select a .jpg file the file will be overwritten as png, please use a copy</b>.
       <br>The generation process may take up to a minute.
       </p>"),
  fileInput("upload", "Select a file"),

  shiny::mainPanel (
  tableOutput("files" ),
  h3("Original Image:"),
  imageOutput("photo"),
  h3("Alternative Image:"),
  imageOutput("photo_alt")
  )
)
