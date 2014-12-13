require(shiny)

shinyUI(fluidPage(
    titlePanel("Stock Charts"),
    sidebarPanel(
        textInput("symb", label=h6("Enter Stock Ticker:"), "SPY"),
        dateRangeInput("dates",
                       "Date range", 
                       start = "2013-01-01",
                       end = as.character(Sys.Date())),

        hr(),
        radioButtons("chartType",
                     label = h6("Type of Chart:"),
                     choices = list("Bar" = "bar",
                                    "Line" = "line",
                                    "Candlestick" = "candlestick"),
                     inline = TRUE,
                     selected = "bar"),
        hr(),
        h6("Additional Technicals:"),
        checkboxInput("ta_vol", label = "Volume", value = FALSE),
        checkboxInput("ta_sma", label = "Simple Moving Average (SMA)", value = FALSE),
        hr(),
        actionButton("submit", "Submit"),
        br(),br(),
        tags$small(
            tags$small(
                tags$a(href="http://github.com/r0bschneider/DevDataProducts", 
                            "Click here to  Visit my Github page")
            )
        )
    ),
    mainPanel(
        tabsetPanel(type="tab",
            tabPanel("Main Chart Area", 
                    plotOutput("plot")
                    
            ),
            tabPanel("Help / Readme",
                     h5("Help / Readme"),
                     hr(),
                     p("Welcome to MyShinyCharts, the most comprehensive, user frendly charting package. Just follow these four easy steps to get started:"),
                     tags$ol(
                         tags$li("Enter the stock symbol"),
                         tags$li("Select a date range"),
                         tags$li("Select technical analysis"),
                         tags$li("Submit (required for all changes)")
                     ),
                     br(),
                     h6("Attribute Description"),
                     tags$ul(
                         tags$li("Date Range - Sets the start and end points for the chart"),
                         tags$li("Type of Chart - choose between Bar, Line or Candlestick charts")
                     ),
                     br(),
                     h6("Avalable Technicals"),
                     tags$ul(
                         tags$li("Volume - When checked draws daily volume bars in a separate panel below the price chart"),
                         tags$li("Simple Moving Average (SMA) - when checked displays the average price of the 'symbol' over 20 day period")
                     )
            )
        )
        
    )
))
