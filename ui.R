#########################################################
#########       EAC FACTS & FIGURES             #########
#########################################################


#ABOUT
##############

# This is the user interface file for a basic shiny app
# which provides easier access to data contained in the
# recent East African Community (EAC) publication,
# "Facts and Figures - September 2015"
# The goal of this application is to make it easier to 
# access the wealth of useful information contained in
# this report.

# This script interacts with server.r in the same 
# directory



#SETTING UP
###############

# Loads the required packages
library(shiny) 

# Sets the working directory
#setwd("C:/Users/twilson/Desktop/R/ShinyAppEAC")

Data <- read.csv("Data.csv")
Codebook <- read.csv("Codebook.csv")

#PAGE DESIGN
###############
shinyUI(
   fluidPage(
           titlePanel("EAC Facts and Figures"
                      ),
           p('This tool allows you to automatically access data contained
             in the 2015 Version of the East African Community, Facts and
             Figures Report.'),
           p('Simply choose your desired indicator and the year and it will
             automatically produce a map and the desired data.'),
           h4('Enjoy!'),
           selectInput(inputId = "Year",
                       label = "Year",
                       choices = c(unique(as.character(Data$Year)))
           ),
           selectInput(inputId = "Indicator",
                       label = "Indicator",
                       choices = c(as.character(Codebook$Indicator))
           ),
           submitButton("Submit"),
           h3(textOutput("Year")),
           h3(verbatimTextOutput("Indicator")),
           htmlOutput(outputId = "Mapped"),
           tableOutput("Table"),
           h4('The East African Community Total is:'),
           h3(verbatimTextOutput("Total")),
           p('Note that for some indicators, e.g. inflation, this 
             value is not meaningful'),
           p('NOTE - the East African Community includes the following five
             countries: Burundi, Kenya, Rwanda, Tanzania and Uganda'),
           p('All data is sourced from the following EAC Publication:'),
           p('EAC (2015) Facts and Figures 2015. Arusha: EAC')
   )
)

 
 