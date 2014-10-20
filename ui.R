library(shiny)

shinyUI(fluidPage(
    titlePanel("Wage in United States"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("feature1", label = "The 1st feature",
                choices = list("Year" = 1, "Age"=2, "Marriage" =3, "Race" = 4, 
                               "Education"=5, "Job class" = 6,"Health" = 7, 
                               "Insurace" = 8, "Log wage" = 9, "Wage" = 10) ,
                selected = 1
                ),
            br(),
            
            selectInput("feature2", label = "The 2nd feature",
                        choices = list("Year" = 1, "Age"=2, "Marriage" =3, "Race" = 4, 
                                       "Education"=5, "Job class" = 6,"Health" = 7, 
                                       "Insurace" = 8, "Log wage" = 9, "Wage" = 10) ,
                        selected = 2
            ),
            br(),
            
            selectInput("color", label = "Colored by",
                        choices = list("Year" = 1, "Age"=2, "Marriage" =3, "Race" = 4, 
                                       "Education"=5, "Job class" = 6,"Health" = 7, 
                                       "Insurace" = 8, "Log wage" = 9, "Wage" = 10) ,
                        selected = 3
            ),
            br(),
            sliderInput("alpha", label = "Transparency",
                        min = 0, max = 1, value = 0.9, step = 0.01),
            sliderInput("jitter", label = "Jitter",
                        min = 0, max = 1, value = 0, step = 0.01)
        ),
        
        mainPanel(
            plotOutput("map")
        ),
        
    ),
    fluidRow(
        h4("Application Detail"),
        helpText("This is a great scatter plot application for 
                 exploring the relationship between features
                 in Wage dataset of ISLR package. This database 
                 shows the wage and other data for a group of 
                 3000 workers in the Mid-Atlantic region. Below
                 are the function of widgets:"),
        helpText(strong("The first feature:"), "horizontal axis",br(),
                 strong("The second feature:"), "vertical axis", br(),
                 strong("Colored by:"), "define color", br(),
                 strong("Transparency:"), "control transparency of points, 
                 the lower, the more transparent", br(),
                 strong("jitter"), "control the amount of jitter"
                 )
        )
    
))