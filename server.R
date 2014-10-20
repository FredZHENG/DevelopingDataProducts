library(shiny)
library(ggplot2)
library(ISLR)
data(Wage)
Wage <- Wage[, !names(Wage) %in% c("sex", "region")]

shinyServer(
    function(input, output) {
        output$map <- renderPlot({
            name1 <- switch(input$feature1,
                         "1" = "year", 
                         "2"= "age", 
                         "3" = "marrage", 
                         "4" = "race", 
                         "5"= "education", 
                         "6" = "jobclass",
                         "7" = "health", 
                         "8" = "insurance", 
                         "9" = "logwage", 
                         "10" = "wage"
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
            
            f1 <- switch(input$feature1,
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
            name2 <- switch(input$feature2,
                            "1" = "year", 
                            "2"= "age", 
                            "3" = "marrage", 
                            "4" = "race", 
                            "5"= "education", 
                            "6" = "jobclass",
                            "7" = "health", 
                            "8" = "insurance", 
                            "9" = "logwage", 
                            "10" = "wage"
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
                  position = position_jitter(w = j, h = j), xlab=name1, ylab=name2) + theme_bw()
        })
    }
)