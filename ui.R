library(shiny)

shinyUI(pageWithSidebar(headerPanel("salam")
                        ,sidebarPanel(
                          h3("SALAM")
                        ),
                        mainPanel(
                          h3("Test")
                          )
))