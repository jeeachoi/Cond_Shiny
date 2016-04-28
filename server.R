library(shiny)
library(shinyFiles)

# Define server logic for slider examples
shinyServer(function(input, output, session) {
  volumes <- c('home'="~")
  shinyDirChoose(input, 'Outdir', roots=volumes, session=session, restrictions=system.file(package='base'))
  output$Dir <- renderPrint({parseDirPath(volumes, input$Outdir)})
  
  
  In <- reactive({
    print(input$Outdir)
    outdir <- paste0("~/",input$Outdir[[1]][[2]],"/")
    print(outdir)
    
    # Compose data frame
    List <- list(
      NumCond = input$Numcond_inp,
	    NumRep = input$Numrep_inp,
   	  Dir=outdir, 
	    OutCond = paste0(outdir, input$OutCondName,".txt")
    )
	    
	tmpnumrep = as.numeric(strsplit(List$NumRep,split=",")[[1]])
	tmpcond = rep(paste0("C",1:as.numeric(List$NumCond)),tmpnumrep)
	write.table(t(tmpcond), file=List$OutCond,sep=",", col.names = F, row.names = F,quote=F)
	List=c(List, list(Sig=t(tmpcond)))  	
})

Act <- eventReactive(input$Submit,{
   In()})

# Show the values using an HTML table
output$print0 <- renderText({
  tmp <- Act()
  str(tmp)
  paste("output directory:", tmp$Dir)
})

output$tab <- renderDataTable({
  tmp <- Act()$Sig
  t1 <- tmp
  print("done")
  t1
},options = list(lengthManu = c(4,4), pageLength = 20))

#  output$done <- renderText({"Done"})
})





