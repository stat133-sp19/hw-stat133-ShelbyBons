#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library (ggplot2)
library(tidyr)

# Functions to be used


future_value <- function(amount3 = 100, rate = 0.05, years = 1) {
  return (amount3 * (1+rate)^years)
}

annuity <- function(contrib = 200, rate = 0.05, years = 1) {
  return (contrib*((1+rate)^years - 1) / rate)
}

growing_annuity <- function(contrib = 200, rate = 0.05, growth = 0.03, years = 1) {
  return (contrib*((1+rate)^years - (1+growth)^years) / (rate-growth))
}

create_modalities <- function(years, amount, contrib, rate_percent, growth_percent) {
  
  no_contrib <- c()
  fixed_contrib <- c()
  growing_contrib <- c()
  year <- 0:years
  rate <- rate_percent / 100
  growth <- growth_percent /100
  
  for (t in year) {
    no_contrib[t+1] <- future_value(amount, rate, t)
    fixed_contrib[t+1] <- future_value(amount, rate, t) + annuity(contrib, rate, t)
    growing_contrib[t+1] <- future_value(amount, rate, t) + growing_annuity(contrib, rate, growth, t)
  }
  
  return (data.frame(year, no_contrib, fixed_contrib, growing_contrib))
}



# Define UI for application
ui <- fluidPage(
  titlePanel("MoneyOnTrees"),
  
     fluidRow(
      column(4,
         sliderInput("amount",
                     "Initial Amount:",
                     min = 0,
                     max = 100000,
                     value = 1000,
                     step = 500)
      ),
      
      column(4,
             sliderInput("rate",
                         "Return Rate (in %):",
                         min = 0,
                         max = 20,
                         value = 5,
                         step = 0.1)
      ),
      column(4,
             sliderInput("year",
                         "Years:",
                         min = 0,
                         max = 50,
                         value = 20,
                         step = 1)
      ),
      column(4,
             sliderInput("contrib",
                         "Annual Contribution:",
                         min = 0,
                         max = 50000,
                         value = 2000,
                         step = 500)
      ),
      column(4,
             sliderInput("growth",
                         "Growth Rate (in %):",
                         min = 0,
                         max = 20,
                         value = 2,
                         step = 0.1)
      ),
      column(4,
             selectInput("facet",
                         "Facet?:",
                         choices = c("No", "Yes"))
      )
      
      # Show a plot of the generated distribution
      

   ),
  
  textOutput("plot_title"),
  
  plotOutput("newPlot"),
  
  textOutput("balance_title"),
  
  verbatimTextOutput("Balances")
  
  
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  # Code to generate balances data table 
  
   output$balance_title <- renderText({'Balances'})
   
   output$Balances <- renderPrint({
     modalities <- create_modalities(as.numeric(input$year), as.numeric(input$amount), as.numeric(input$contrib), as.numeric(input$rate), as.numeric(input$growth))
     print(modalities)})
   
   # Code to generate plot
   
   output$plot_title <- renderText({'Timelines'})
   
   output$newPlot <- renderPlot({
     modalities <- create_modalities(as.numeric(input$year), as.numeric(input$amount), as.numeric(input$contrib), as.numeric(input$rate), as.numeric(input$growth))
     
     if (input$facet == "No") {
        ggplot(modalities, aes(year)) +
            geom_line(aes(y = no_contrib, colour = "no contribution")) +
            geom_line(aes(y = fixed_contrib, colour = "fixed contribution")) +
            geom_line(aes(y = growing_contrib, colour = "growing contribution")) +   
            scale_colour_manual("", 
                           breaks = c("no contribution", "fixed contribution", "growing contribution"),
                           values = c("red", "green", "blue")) +
            labs( title = "Three modes of investing", x = "Year", y = "Value ($)")
     }
     
     else {
        modalities_long <- gather(modalities, investment_mode, value, no_contrib, fixed_contrib, growing_contrib)
        ggplot(modalities_long, aes(year, colour = investment_mode, fill = investment_mode)) +
            geom_area(aes(y = value), alpha = 0.5) + 
            labs( title = "Three modes of investing", x = "Year", y = "Value ($)") +
            facet_grid(.~investment_mode)
     }
     
   })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

