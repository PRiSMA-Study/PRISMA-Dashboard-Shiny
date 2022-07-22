#' @import ggplot2
#' @import dplyr
server <- function(input, output, session) {


  dataEnroll <- reactive({

    dataPath <- system.file("extdata","statusOutcome.rds", package = "PRiSMAxDashboard")
    readRDS(dataPath)

  })


  # activate Aim 1 module servers for Pooled data
  enroll_serverA("Pooled", site = "Pooled", dataEnroll)
  enroll_serverB("Pooled", site = "Pooled", dataEnroll)

  # activate Aim 1 module servers for site Ghana
  enroll_serverA("Ghana", site = "Ghana", dataEnroll)

  # activate Aim 1 module servers for site Kenya
  enroll_serverA("Kenya", site = "Kenya", dataEnroll)

  # activate Aim 1 module servers for site Pakistan
  enroll_serverA("Pakistan", site = "Pakistan", dataEnroll)

  # activate Aim 1 module servers for site Zambia
  enroll_serverA("Zambia", site = "Zambia", dataEnroll)

}
