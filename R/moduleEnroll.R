#' Enrollment Module
#'
#' UI and Server for Enrollment Module
#' @param id id for bundled module UI and module Server
#' @param site study site (country)
#' @param data engineered data extracted from synapse database
#' @export
#' @rdname moduleEnroll
enroll_uiA <- function(id) {
  fluidRow(
    box(
      status = "primary", width = box_width,
      "Enrollment", br(),
      tableOutput(NS(id, "enroll_uiA_output1")),
      "Study follow up", br(),
      tableOutput(NS(id, "enroll_uiA_output2"))
    )
  )
}

#' @export
#' @rdname moduleEnroll
enroll_uiB <- function(id) {
  fluidRow(
    box(
      status = "primary", width = box_width,
      column(6,
             h5("Enrollment by Country"),
             shiny::plotOutput(NS(id, "enroll_uiB_output1"))
      )
    )
  )
}


#' @export
#' @rdname moduleEnroll
#' @import hrbrthemes
#' @import viridis
#' @import forcats
enroll_serverA <- function(id, site, data) {
  moduleServer(id, function(input, output, session) {

    subData <- reactive({

      # subset data
      if (site == "Pooled") {

        data()
      } else {

        data() %>%
          filter(SITE == site)
      }

    })

    output$enroll_uiA_output1 <- renderTable({

      subData() %>%
        select(SCREEN, ELIGIBLE, ENROLL) %>%
        summarise(N_SCREEN = sum(SCREEN == 1),
                  P_ELIGIBLE = sum(ELIGIBLE == 1)/sum(SCREEN == 1)*100,
                  P_ENROLL = sum(ENROLL == 1)/sum(ELIGIBLE == 1)*100
                  ) %>%
        round(2) %>%
        `colnames<-`(c("SCREEND (N)", "ELIGIBLE (%)", "ENROLLED (%)"))
    })

    output$enroll_uiA_output2 <- renderTable({

      studyStat_names <- c("PREGNANT (%)", "POSTPARTUM (%)",
                           "COMPLETED STUDY (%)", "UNABLE TO REACH (%)", "WITHDRAWN (%)", "MISSING (%)")

      tb <- subData() %>%
        filter(ENROLL == 1) %>%
        mutate(STUDYSTAT = as.character(.data$STUDYSTAT)) %>%
        group_by(STUDYSTAT) %>%
        summarise(n = n()) %>%
        mutate(p = n/sum(n)*100) %>% select(STUDYSTAT, p)

      tbColnames <- studyStat_names[match(tb$STUDYSTAT, c("1", "2", "3", "4", "5", "99"))]

      tb %>%
        select(p) %>%
        t() %>%
        round(2) %>%
        `colnames<-`(tbColnames)

    })
  })
}

#' @export
#' @rdname moduleEnroll
#' @import hrbrthemes
#' @import viridis
#' @import forcats
enroll_serverB <- function(id, site, data) {
  moduleServer(id, function(input, output, session) {

    subData <- reactive({

      # subset data
      if (site == "Pooled") {

        data()
      } else {

        data() %>%
          filter(SITE == site)
      }

    })

    output$enroll_uiB_output1 <- renderPlot({

      # Create Data
      tb <- subData() %>% filter(.data$ENROLL == 1) %>%
        group_by(SITE) %>%
        summarise(VALUE = n()) %>%
        arrange(desc(SITE)) %>%
        mutate(prop = VALUE / sum(VALUE) *100) %>%
        mutate(ypos = cumsum(prop)- 0.5*prop )

      # Basic pie-chart
      ggplot(tb, aes(x="", y=prop, fill=SITE)) +
        geom_bar(stat="identity", width=1, color="white") +
        coord_polar("y", start=0) +
        theme_void() +
        theme(legend.position="none") +
        geom_text(aes(y = ypos, label = paste0(SITE, " ", round(prop,2), "%")),
                  color = "white", size=3) +
        scale_fill_brewer(palette="Set1")
    }, res = 96)

  })
}


