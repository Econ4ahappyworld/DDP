#########################################################
#########       EAC FACTS & FIGURES             #########
#########################################################


#ABOUT
##############

# This is the server file for a basic shiny app
# which provides easier access to data contained in the
# recent East African Community (EAC) publication,
# "Facts and Figures - September 2015"
# The goal of this application is to make it easier to 
# access the wealth of useful information contained in
# this report.

# This script interacts with ui.R in the same 
# directory





#SETTING UP
###############

# Loads the required packages
library(shiny) 
library(ggplot2)
library(googleVis)
library(RCurl)
library(dplyr)

# Sets the working directory
#setwd("C:/Users/twilson/Desktop/R/ShinyAppEAC")




#DATA ANALYSIS
################

Data <- read.csv("Data.csv")

# Mapped_data <- function(period) {
#   Data[which(Data$Year == "period" & Data$Region != "EAC"),c(1,3)]
# } 


#SERVER ACTION
##############

shinyServer(function(input,output){
        
#         myYear <- reactive({
#                 as.numeric(input$Year)
#                 })
#         
        myIndicator <- reactive({
                as.character(input$Indicator)
                })
       
        Data_map <- reactive({
                Data[which(Data$Year == input$Year), 
                     c("Region", "Year", input$Indicator)]
        })
        
        output$Table <- renderTable(Data_map())
        
        output$Total <- renderText(sum(Data_map()[,3]))
        
        output$Mapped <- renderGvis({
                gvisGeoChart(Data_map(),
                             locationvar = "Region",
                             colorvar = myIndicator(),
                             options = list(region = "014",
                                            resolution = "countries"))
        })
        
})












        
#         (Year > (myYear()-1)) & (Year < (myYear()+1)))
# #                 
# #                 gvisGeoChart(Mapped_, 
# #                              locationvar = "Region",
#                              colorvar = "Population_mid_year",
#                              options=list(region = "014",
#                                           resolution = "countries",
#                                           width = 556,
#                                           height = 347,
#                                           keepAspectRatio = TRUE))
#         )
# }
# )
# 
# 
# Map <- 
# # )
# # 
# # 
# # plot(Map)
# 
# 

# shinyServer(
#        function(input,output) {
#         output$oid1 <- renderPrint({input$id1})
#         output$oid2 <- renderPrint({Population_data(input$id1, input$id2)})
#         }
# )
# 



