library(shiny)

shinyUI(pageWithSidebar(headerPanel("Next Word Prediction Project By Sepand Haghighi")
                        ,sidebarPanel(
                          h4("In This Project That Is Capstone Final Project We Want To Predict Next Word With n-grams Algorithm"),
                          h4("So First You Should Enter Your Input String In Text Box And Show Next Word (Maybe With Some Delay")
                        ),
                        mainPanel(
                          h3("Please Enter Text In This Text Box :"),
                          textInput("text1","Phrase Input"),
                          submitButton(text = "Enter"),
                          h3("Predicted Word : "),
                      verbatimTextOutput("output1")
                          )
))