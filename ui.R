library(shiny)
library(shinyFiles)

options(shiny.maxRequestSize=500*1024^2) 
# Define UI for slider demo application
shinyUI(pageWithSidebar(
  #  Application title
  headerPanel("Generating Condition Vector"),
  
  # Sidebar with sliders that demonstrate various available options
  sidebarPanel(width=10,height=15,
          column(10,
		      numericInput("Numcond_inp",
                      label = "How many conditions do you have? (# of biological conditions, # of time points, etc)",
                      value = 3),							
 				  textInput("Numrep_inp",
				               label = "How many replicates in each condition? (e.g., if # of biological condition is 3, three numbers of corresponding replicates should be entered)",
				               value = "5,5,5"),

          # output dir
          shinyDirButton('Outdir', 'output folder select', 'Please select a folder'),
          br(),
          br(),
          textInput("OutCondName", 
                    label = "Export file name for the condition vector?", 
                    value = "ConditionsOut")
               ),
               
			          br(),
               actionButton("Submit","Submit for processing")
  ),
  
  # Show a table summarizing the values entered
  mainPanel(
    h4(textOutput("print0")),
    #tableOutput("values")
    dataTableOutput("tab")
  )
))
