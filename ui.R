#---------------------------UI-----------------------------------------------------------

ui <- dashboardPage(
  skin = "black",
  
  dashboardHeader(
    
    
    # Set height of dashboardHeader using CSS
    tags$li(class = "dropdown",
            tags$style(".main-header {max-height: 75px}"),
            tags$style(".main-header .logo {height: 75px}")
    ),
    
    title = 
      #add logo title using css
      tags$a(href= "https://www.explainingatheism.org/", 
             tags$img(src = "ealogo.jpg", height= "75px"))
    
  ),
  dashboardSidebar(
    tags$style(".left-side, .main-sidebar {padding-top: 75px}"),
    sidebarMenu(
      menuItem("Info", tabName = "info", icon = icon("info")),
      
      menuItem("Survey 1 (Morals/Values)", tabName = "Survey 1", icon = icon("bars"),
               startExpanded = TRUE,
               menuSubItem("Survey 1 Plots",
                           tabName = "surv1_plots",
                           icon = icon("chart-simple")),
               menuSubItem("Survey 1 Tables",
                           tabName = "surv1_tabs",
                           icon = icon("table"))),
      
      menuItem("Survey 2", tabName = "Survey 2", icon = icon("bars"),
               startExpanded = TRUE,
               menuSubItem("Survey 2 Plots",
                           tabName = "surv2_plots",
                           icon = icon("chart-simple")),
               menuSubItem("Survey 2 Tables",
                           tabName = "surv2_tabs",
                           icon = icon("table"))),
      
      menuItem("Survey 3", tabName = "Survey 3", icon = icon("bars"),
               startExpanded = TRUE,
               menuSubItem("Survey 3 Plots",
                           tabName = "surv3_plots",
                           icon = icon("chart-simple")),
               menuSubItem("Survey 3 Tables",
                           tabName = "surv3_tabs",
                           icon = icon("table"))),
      
      menuItem("Survey 4", tabName = "Survey 4", icon = icon("bars"),
               startExpanded = TRUE,
               menuSubItem("Survey 4 Plots",
                           tabName = "surv4_plots",
                           icon = icon("chart-simple")),
               menuSubItem("Survey 4 Tables",
                           tabName = "surv4_tabs",
                           icon = icon("table"))),
      
      menuItem("Survey 5", tabName = "Survey 5", icon = icon("bars"),
               startExpanded = TRUE,
               menuSubItem("Survey 5 Plots",
                           tabName = "surv5_plots",
                           icon = icon("chart-simple")),
               menuSubItem("Survey 5 Tables",
                           tabName = "surv5_tabs",
                           icon = icon("table")))
      
)

  ),
  dashboardBody(
    
    # some css styling:
    
    tags$style(HTML(".sidebar-menu li a { font-size: 18px; }")), 
    tags$head(tags$style(HTML('
            .skin-black .sidebar a {
                color: #253f8c !important;}'
    ))),
    
    use_theme(mytheme),
    tabItems(
      
      #------------------------------------------ Info -----------------------------------
      
      tabItem(tabName = "info",
              fluidRow(
                box(
                  width = 9,
                  htmlOutput("text1")
                )
              )
              ),
      
      
      
      #------------------------------------------ Survey 1 -----------------------------------
      
      #Items/boxes in survey plots tab     
      
      tabItem(tabName = "surv1_plots",
              fluidRow(
                #plot box                
                box( 
                  width = 9,
                  title = "Survey 1 (Morals/Values) Plots",
                  solidHeader = TRUE,
                  plotOutput("plot_s1", height = 800)),
                
                #settings boxes                
                box(
                  width = 3,
                  title = "Settings",
                  solidHeader = TRUE,
                  status = "primary",
                  "If categorical variables are selected violin plots will be shown, unless both are categorical in which case stacked bar charts will be shown",
                  #inputs
                  #var 1 input
                  selectInput(
                    inputId = "select_var1_p1",
                    label = "Select Variable 1 (x-axis)",
                    choices = list(
                      
                      "Age", 
                      "Sex", 
                      "Country",
                      
                      "Individualism",
                      "Rebelliousness",
                      "Choice Norms",
                      
                      "Belief In God (categorical)",
                      "Religious Identification (y/n)",
                      "Belief in God (continuous)",
                      "Religious Identity",
                      "Life After Death", 
                      "Reincarnation",
                      "Astrology", 
                      "Good and Evil Powers", 
                      "Universal Life Force",
                      "Karma", 
                      "Fate", 
                      "Supernatural Beings", 
                      "Evil Eye"
                    ),
                    multiple = FALSE
                  ),
                  #var2 input
                  selectInput(
                    "select_var2_p1",
                    "Select Variable 2 (y-axis)",
                    list(
                      
                      "Age", 
                      "Sex", 
                      "Country",
                      
                      "Individualism",
                      "Rebelliousness",
                      "Choice Norms",
                      
                      "Belief In God (categorical)",
                      "Religious Identification (y/n)",
                      "Belief in God (continuous)",
                      "Religious Identity",
                      "Life After Death", 
                      "Reincarnation",
                      "Astrology", 
                      "Good and Evil Powers", 
                      "Universal Life Force",
                      "Karma", 
                      "Fate", 
                      "Supernatural Beings", 
                      "Evil Eye"
                      
                      ),
                    multiple = FALSE
                  ),
                  #countries input
                  selectInput(
                    inputId = "select_country_s1",
                    label = "Select Country",
                    choices = c(
                      "All Countries",
                      "Brazil",
                      "Japan",
                      "UK"                    ),
                    selected = "All Countries",
                    multiple = TRUE
                  ),
                  #line input
                  selectInput(
                    inputId = "line_s1",
                    label = "Plot Line",
                    choices = c(
                      "Yes",
                      "No"
                    ),
                    selected = "Yes"
                  )
                ),
                
                box(
                  title = "Variable Info",
                  width = 3,
                  status = "warning",
                  solidHeader = TRUE,
                  uiOutput("varinfo1"),
                  uiOutput("varinfo2")
                )),
              
      ),
      
      
      #Items/boxes in survey tables tab   
      
      #table box
      
      tabItem(tabName = "surv1_tabs",
              fluidRow(
                #table boxes  
                
                #for demographics
                conditionalPanel(
                  condition = "input.tabletype_s1 == 'Demographic'",
                  box(
                    title = "Survey 1 (Morals/Values) Demograpics",
                    width = 9,
                    solidHeader = TRUE,
                    tableOutput("demotab.s1"))),
                
                
                #for cor matrix          
                conditionalPanel(
                  condition = "input.tabletype_s1 == 'Correlation Matrix'",
                  box(
                    title = "Survey 1 (Morals/Values) Correlations",
                    width = 9,
                    solidHeader = TRUE,
                    div(
                      style = "overflow-x: scroll; overflow-y: scroll",
                      tableOutput("cormat.s1")))),
                
                #for crosstabs           
                conditionalPanel(
                  condition = "input.tabletype_s1 == 'Crosstabs'",
                  box(
                    title = "Survey 1 (Morals/Values) Crosstabs",
                    width = 9,
                    solidHeader = TRUE,
                    gt_output("crosstabs.s1"))),
                
                #for summary stats
                
                conditionalPanel(
                  condition = "input.tabletype_s1 == 'Summary Stats'",
                  box(
                    title = "Survey 1 (Morals/Values) Summary",
                    width = 9,
                    solidHeader = TRUE,
                    gt_output("summarystats.s1"))),
                
                
                #settings box                
                box(
                  width = 3,
                  title = "Settings",
                  solidHeader = TRUE,
                  #table type
                  
                  selectInput(
                    inputId = "tabletype_s1",
                    label = "Select Table",
                    choices = c(
                      "Demographic",
                      "Correlation Matrix",
                      "Crosstabs",
                      "Summary Stats"),
                    selected = "Demographics"),
                  
                  # conditional countries input(s)
                  
                  conditionalPanel(
                    condition = "input.tabletype_s1 == 'Correlation Matrix'",
                    selectInput(
                      inputId = "select_countryx",
                      label = "Select Country",
                      choices = c("All Countries", "Brazil", "Japan", "UK"),
                      selected = "All Countries",
                      multiple = TRUE
                    )),
                  
                  conditionalPanel(
                    condition = "input.tabletype_s1 == 'Crosstabs'",
                    selectInput(
                      inputId = "select_countryx",
                      label = "Select Country",
                      choices = c("All Countries", "Brazil", "Japan", "UK"),
                      selected = "All Countries",
                      multiple = TRUE
                    )),
                  
                  
                  # variable inputs for correlation matrix
                  
                  conditionalPanel(
                    condition = "input.tabletype_s1 == 'Correlation Matrix'",
                    selectInput(
                      inputId = "cormatvars",
                      label = "Select Variables",
                      choices = list(
                        
                        "Age", 
                        "Individualism",
                        "Rebelliousness",
                        "Choice Norms",
                        "Religious Identification (y/n)",
                        "Belief in God (continuous)",
                        "Life After Death", 
                        "Reincarnation",
                        "Astrology", 
                        "Good and Evil Powers", 
                        "Universal Life Force",
                        "Karma", 
                        "Fate", 
                        "Supernatural Beings", 
                        "Evil Eye"
                        ),
                      selected = c("Age",
                                   "Belief in God (continuous)",
                                   "Individualism",
                                   "Rebelliousness",
                                   "Choice Norms",
                                   "Religious Identification (y/n)",
                                   "Belief in God (continuous)",
                                   "Evil Eye"),
                      multiple = TRUE
                  )),
                  
                  #rows inputs for crosstabs
                  
                  conditionalPanel(
                    condition = "input.tabletype_s1 == 'Crosstabs'",
                    selectInput(
                      inputId = "ctabsrow",
                      label = "Select Row Variable",
                      choices = c(
                        "Country",
                        "Sex",
                        "Religious Identification"
                      ),
                    )
                  ),
                  
                  conditionalPanel(
                    condition = "input.tabletype_s1 == 'Crosstabs'",
                    selectInput(
                      inputId = "ctabscol",
                      label = "Select Column Variable",
                      choices = c(
                        "Religious Identification",
                        "Country",
                        "Sex"))),
                  
                  
                  # group and variable selection for summary stats
                  
                  conditionalPanel(
                    condition = "input.tabletype_s1 == 'Summary Stats'",
                    selectInput(
                      inputId = "sumstatsgrp.s1",
                      label = "Group By",
                      choices = c(
                        "Sex",
                        "Country",
                        "Religious Identification"
                      ),
                      selected = "None",
                      multiple = FALSE)),
                  
                  
                  conditionalPanel(
                    condition = "input.tabletype_s1 == 'Summary Stats'",
                    selectInput(
                      inputId = "sumstatsvars.s1",
                      label = "Select Variable 1",
                      choices = list(
                        "Age", 
                        "Individualism",
                        "Rebelliousness",
                        "Choice Norms",
                        "Religious Identification (y/n)",
                        "Belief in God (continuous)",
                        "Life After Death", 
                        "Reincarnation",
                        "Astrology", 
                        "Good and Evil Powers", 
                        "Universal Life Force",
                        "Karma", 
                        "Fate", 
                        "Supernatural Beings", 
                        "Evil Eye"
                      ),
                      selected = "Belief in God (continuous)",
                      multiple = TRUE)),
                  
                  
                ),
                
                
                #Plot
                
                # correlation coefficients for correlation matrix          
                conditionalPanel(
                  condition = "input.tabletype_s1 == 'Correlation Matrix'",
                  box( 
                    width = 9,
                    title = "Survey 1 (Morals/Values) Table Plots",
                    solidHeader = TRUE,
                    plotOutput("cormatplot", height = "600px", width = "100%"))), 
                
                
                
              )),
      #------------------------------------------ Pilot 2 tab-----------------------------------           
      
      tabItem(tabName = "Pilot2",
              fluidRow(
                box(plotOutput("plot2", height = 450)),
                box(
                  title = "Settings",
                  sliderInput("slider2", "Number of observations:", 1, 100, 50)
                )
              )
      )
    )
  )
)


