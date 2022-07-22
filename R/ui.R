# layout parameters
sideBar_width <- 300
valueBox_width <- 3
box_width <- 10

# user-interface layout
ui <- function(req) {shinydashboard::dashboardPage(

  # dashboard color
  skin = "blue",

  # header title
  header = dashboard_title(sideBar_width),

  # sidebar
  sidebar = shinydashboard::dashboardSidebar(
    tags$head(
      tags$style(HTML("
                      .main-sidebar {
                      padding-left: 10px;
                      padding-right: 10px;
                      }"
      ))
    ),
    width = sideBar_width,
    br(),
    h4('Dashboard of PRiSMA Study'),
    br(),
    br(),

    # sidebar menu
    shinydashboard::sidebarMenu(
      shinydashboard::menuItem(text = h4("Overview"), tabName = "overview", startExpanded = TRUE,
                               menuSubItem(text = "Enrollment", tabName = "tab_enroll", selected = TRUE)
      ))
  ),

  # dashboard body
  body = shinydashboard::dashboardBody(

    # box style
    tags$head(tags$style(HTML(".small-box {height: 100px}"))),

    # dashboard body
    shinydashboard::tabItems(
      shinydashboard::tabItem(tabName = "tab_enroll",
                              tab_enroll_output())
    )
  )
)
}

