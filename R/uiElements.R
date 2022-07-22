#' UI Elements
#'
#' Elements for UI.
#' @param sideBar_width (numeric) width of sidebar
#' @param ... UI elements for the box
#' @param id id for bundled module UI and module Server
#' @param site study site (country)
#' @param data engineered data extracted from synapse database
#' @import shiny
#' @import shinydashboard
#' @export
#' @rdname uiElements
box <- function(...) {
  shinydashboard::box(...)
}

#' @export
#' @rdname uiElements
dashboard_title <- function(sideBar_width) {
  shinydashboard::dashboardHeader(
    title = "PRiSMA Dashboard",
    titleWidth = sideBar_width
  )
}

#' @export
#' @rdname uiElements
tab_enroll_output <- function() {

  # panel
  tabsetPanel(

    # panel1 - Pooled data
    tabPanel("Pooled",
             h4("Pooled data - Enrollment Report", style = "color:#9C38D6"), enroll_uiA("Pooled"),
             h4("Pooled data - Enrollment Pie Chart", style = "color:#9C38D6"), enroll_uiB("Pooled")
             ),

    # panel2 - site data
    tabPanel("Ghana",
             h4("Ghana data - Enrollment Report", style = "color:#9C38D6"), enroll_uiA("Ghana")
             ),

    # panel3 - site data
    tabPanel("Kenya",
             h4("Kenya data - Enrollment Report", style = "color:#9C38D6"), enroll_uiA("Kenya")
             ),

    # panel4 - site data
    tabPanel("Pakistan",
             h4("Pakistan data - Enrollment Report", style = "color:#9C38D6"), enroll_uiA("Pakistan")
             ),

    # panel5 - site data
    tabPanel("Zambia",
             h4("Zambia data - Enrollment Report", style = "color:#9C38D6"), enroll_uiA("Zambia")
             )
  )
}





