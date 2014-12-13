require(shiny)
require(quantmod)

shinyServer(function(input, output){
    
    dataInput <- reactive({ 
                       getSymbols(input$symb, src = "yahoo", 
                       from = input$dates[1],
                       to = input$dates[2],
                       auto.assign = FALSE)
    })
    
     taSelect <- reactive({
        if (input$submit == 0)
            return("NULL")
        
         tas <- isolate({c(input$ta_vol, input$ta_sma)})
         funcs <- c(addVo(), addSMA())
         
         if (any(tas)) funcs[tas]
         else "NULL"
     })

    output$plot <- renderPlot({    
                     chartSeries(dataInput(), 
                     theme = chartTheme("white"), 
                     type = input$chartType, 
                     log.scale = FALSE, 
                     TA = taSelect())
    })
#    TA="addVo();addBBands();addCCI()"

})
