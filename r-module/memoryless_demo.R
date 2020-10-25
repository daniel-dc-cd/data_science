install.packages("shinydashboard")
install.packages("expm")


## ui.R ##
library(shinydashboard)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

## app.R ##
library(shinydashboard)
library(shiny)
ui <- dashboardPage(
  dashboardHeader(title = "Memoryless Bar's"),
  dashboardSidebar(sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
  )),
  dashboardBody(tabItems(
    # First tab content
    tabItem(tabName = "dashboard",
            fluidRow(
              box(title = "Histogram" , status = "primary" , solidHeader = TRUE ,
                  collapsible = TRUE ,
                  plotOutput("plot1", height = 250)),
              
              box(
                title = "Orders", status = "warning" , solidHeader = TRUE,
                "Number of orders", br(), "Memoryless Bar's",
                sliderInput("slider", "Slider input:", 1, 100, 50),
                
              )
              
            )
    )
  )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)


