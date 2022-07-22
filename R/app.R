#' launches the shinyAppDemo app
#'
#' @export launchApp
#' @return shiny application object
#' @import shiny
#'
# wrapper for shiny::shinyApp()
launchApp <- function() {
  print("starting")
  app <- shinyApp(ui = ui, server = server)
  runApp(app, host = "0.0.0.0", port = 3838, launch.browser = TRUE) # launch.browser = FALSE
  print("stopping")
}
