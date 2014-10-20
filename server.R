library(shiny)
library(ggplot2)
library(ISLR)
data(Wage)
Wage <- Wage[, !names(Wage) %in% c("sex", "region")]

shinyServer(
    function(input, output) {
        output$map <- renderPlot({
            f1 <- switch(input$feature1,
                         "1" = Wage$year, 
                         "2"= Wage$age, 
                         "3" = Wage$maritl, 
                         "4" = Wage$race, 
                         "5"= Wage$education, 
                         "6" = Wage$jobclass,
                         "7" = Wage$health, 
                         "8" = Wage$health_ins, 
                         "9" = Wage$logwage, 
                         "10" = Wage$wage
                         )
            
            f2 <- switch(input$feature2,
                         "1" = Wage$year, 
                         "2"= Wage$age, 
                         "3" =Wage$maritl, 
                         "4" = Wage$race, 
                         "5"= Wage$education, 
                         "6" = Wage$jobclass,
                         "7" = Wage$health, 
                         "8" = Wage$health_ins, 
                         "9" = Wage$logwage, 
                         "10" = Wage$wage
            )
            
            col <- switch(input$color,
                         "1" = Wage$year, 
                         "2"= Wage$age, 
                         "3" =Wage$maritl, 
                         "4" = Wage$race, 
                         "5"= Wage$education, 
                         "6" = Wage$jobclass,
                         "7" = Wage$health, 
                         "8" = Wage$health_ins, 
                         "9" = Wage$logwage, 
                         "10" = Wage$wage,
            )
            
            a <- input$alpha
            j <- input$jitter
            
            qplot(f1, f2, color = col, alpha = I(a), 
                  position = position_jitter(w = j, h = j)) + theme_bw()
        })
    }
)