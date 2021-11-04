library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(shinythemes)
library(htmlwidgets)
library(ggplot2)
library(MASS)
library(DT)
library(tidyverse)
library(leaflet)
require(readr)

 navbarPage(title="OHRFP Analysis Tool",
           tabPanel("Home",
                    fluidRow(h1("Fish Population Analysis")),
                    box(title="Introduction", width= 6,
                        p("Dataset for the Fish Population along the Ohio River Main Stem analysis.", style = "text-align : justify"),
                        hr(),
                        DT::dataTableOutput("data")
                    )
              ),
           tabPanel("Imaging",
                    fluidPage(
                      #Create input for domain (single) and variable (multiple)
                      # Define the sidebar with one input
                      box(title="Imaging Description", width = 6,
                          p("Images from Flickr API, corresponds with data to fish Population"))),
                      sidebarPanel(
                        selectInput("areaSelection", "Choose an area", multiple = F, choices = ""),
                        fluidRow(
                          column(width = 10, verbatimTextOutput('areaName'),
                                 verbatimTextOutput('latitude'),
                                 verbatimTextOutput('longitude')
                                 
                          )
                      
                    )
           )
           )
 )
 
 