#' @title Shiny app for comparing player trajectories
#' @export
#' @import shiny
#' @import dplyr
#' @import ggplot2
#' @examples
#' \dontrun{
#'   compareTrajectories()
#' }


compareTrajectories <- function() {
  
  # data is read from a Github repository
  fg <- readr::read_csv("https://raw.githubusercontent.com/bayesball/HomeRuns2021/main/woba_wts.csv")
  
  ui <- fluidPage(
    theme = shinythemes::shinytheme("slate"),
    h2("Comparing Career Pitching Trajectories"),
    column(
      3,
      sliderInput("midyear", "Select Range of Mid Season:",
                  1900, 2010,
                  value = c(1975, 1985), sep = ""
      ),
      sliderInput("minpa", "Select Minimum IP:",
                  1000, 5000, 2000,
                  sep = ""
      ),
      selectInput("player_name1",
                  "Select First Pitcher:",
                  choices =
                    selectPlayers2(c(1975, 1985), 2000)$Name
      ),
      selectInput("player_name2",
                  "Select Second Pitcher:",
                  choices =
                    selectPlayers2(c(1975, 1985), 2000)$Name
      ),
      radioButtons("type",
                   "Select Measure:",
                   c(
                     "ERA", "WHIP", "FIP",
                     "SO Rate", "BB Rate"
                   ),
                   inline = TRUE
      ),
      radioButtons("xvar",
                   "Plot Against:",
                   c("year", "age"),
                   inline = TRUE
      ),
      downloadButton("downloadData", "Download Data")
    ),
    column(
      9,
      plotOutput("plot1",
                 height = "500px"
      )
    )
  )
  
  server <- function(input, output, session) {
    options(warn = -1)
    observeEvent(input$midyear, {
      updateSelectInput(
        inputId = "player_name1",
        choices =
          selectPlayers2(
            input$midyear,
            input$minpa
          )$Name
      )
    })
    observeEvent(input$minpa, {
      updateSelectInput(
        inputId = "player_name1",
        choices =
          selectPlayers2(
            input$midyear,
            input$minpa
          )$Name
      )
    })
    observeEvent(input$midyear, {
      updateSelectInput(
        inputId = "player_name2",
        choices =
          selectPlayers2(
            input$midyear,
            input$minpa
          )$Name
      )
    })
    observeEvent(input$minpa, {
      updateSelectInput(
        inputId = "player_name2",
        choices =
          selectPlayers2(
            input$midyear,
            input$minpa
          )$Name
      )
    })
    output$plot1 <- renderPlot(
      {
        S <- selectPlayers2(
          input$midyear,
          input$minpa
        )
        id1 <- filter(
          S,
          Name == input$player_name1
        )$playerID
        id2 <- filter(
          S,
          Name == input$player_name2
        )$playerID
        compare_plot(
          id1, id2, input$type, input$xvar,
          fg
        )$plot1
      },
      res = 96
    )
    output$downloadData <- downloadHandler(
      filename = "trajectory_output.csv",
      content = function(file) {
        S <- selectPlayers2(
          input$midyear,
          input$minpa
        )
        id1 <- filter(
          S,
          Name == input$player_name1
        )$playerID
        id2 <- filter(
          S,
          Name == input$player_name2
        )$playerID
        out <- compare_plot(
          id1, id2, input$type, input$xvar,
          fg
        )
        write_csv(out$S, file)
      }
    )
  }
  
  
  shinyApp(ui = ui, server = server) |>
    runApp()
}


selectPlayers2 <- function(midYearRange, minIP) {
  Lahman::Pitching %>%
    mutate(IP = IPouts / 3) %>%
    group_by(playerID) %>%
    summarize(
      minYear = min(yearID),
      maxYear = max(yearID),
      midYear = (minYear + maxYear) / 2,
      IP = sum(IP),
      .groups = "drop"
    ) %>%
    filter(
      midYear <= midYearRange[2],
      midYear >= midYearRange[1],
      IP >= minIP
    ) %>%
    select(playerID) %>%
    inner_join(Lahman::People, by = "playerID") %>%
    mutate(Name = paste(nameFirst, nameLast)) %>%
    select(playerID, Name)
}

compare_plot <- function(playerid_1, playerid_2,
                         measure, xvar, fg) {
  # check for legitimate input
  if ((length(playerid_1) > 0) &
    (length(playerid_2) > 0)) {
    # collect names of two players
    Name1 <- filter(Lahman::People, playerID == playerid_1) %>%
      mutate(Name = paste(nameFirst, nameLast)) %>%
      select(Name) %>%
      pull()
    Name2 <- filter(Lahman::People, playerID == playerid_2) %>%
      mutate(Name = paste(nameFirst, nameLast)) %>%
      select(Name) %>%
      pull()
    # collect hitting stats for two players for each season
    Lahman::Pitching %>%
      filter(playerID %in% c(playerid_1, playerid_2)) %>%
      inner_join(
        select(
          Lahman::People, playerID,
          nameFirst, nameLast
        ),
        by = "playerID"
      ) %>%
      mutate(Name = paste(nameFirst, nameLast)) %>%
      group_by(Name, yearID) %>%
      summarize(
        IP = sum(IPouts / 3),
        H = sum(H),
        HR = sum(HR),
        ER = sum(ER),
        BB = sum(BB),
        SO = sum(SO),
        HBP = sum(HBP),
        ERA = ER / IP * 9,
        FIP = ((HR * 13) + (3 * (BB + HBP)) -
          (2 * SO)) / IP,
        WHIP = (H + BB) / IP,
        SO_Rate = 9 * SO / IP,
        BB_Rate = 9 * BB / IP,
        .groups = "drop"
      ) -> S
    # merge fangraphs weights for wOBA
    # compute wOBA for each player each season
    inner_join(S, fg, by = c("yearID" = "Season")) %>%
      mutate(FIP = FIP + cFIP) -> S
    # function to obtain birthyear for player
    get_birthyear <- function(playerid) {
      Lahman::People %>%
        filter(playerID == playerid) %>%
        mutate(
          Name = paste(nameFirst, nameLast),
          birthyear = ifelse(birthMonth >= 7,
            birthYear + 1, birthYear
          )
        ) %>%
        select(Name, birthyear)
    }
    # collect birthyears and compute ages for each
    # player and season
    S1 <- rbind(
      get_birthyear(playerid_1),
      get_birthyear(playerid_2)
    )
    inner_join(S, S1, by = "Name") %>%
      mutate(Age = yearID - birthyear) -> S
    # define outcome depending on input
    if (measure == "ERA") {
      S$Outcome <- S$ERA
      S$Weight <- S$IP
      YLAB <- "ERA"
    }
    if (measure == "FIP") {
      S$Outcome <- S$FIP
      S$Weight <- S$IP
      YLAB <- "FIP"
    }
    if (measure == "WHIP") {
      S$Outcome <- S$WHIP
      S$Weight <- S$IP
      YLAB <- "WHIP"
    }
    if (measure == "SO Rate") {
      S$Outcome <- S$SO_Rate
      S$Weight <- S$IP
      YLAB <- "SO Rate"
    }
    if (measure == "BB Rate") {
      S$Outcome <- S$BB_Rate
      S$Weight <- S$IP
      YLAB <- "BB Rate"
    }
    # plot versus season or age?
    if (xvar == "year") {
      S$XVAR <- S$yearID
      XLAB <- "Season"
    }
    if (xvar == "age") {
      S$XVAR <- S$Age
      XLAB <- "Age"
    }
    plot1 <- ggplot(
      S,
      aes(XVAR, Outcome,
        color = Name,
        weight = Weight,
        label = Name
      )
    ) +
      geom_point(size = 3) +
      geomtextpath::geom_textsmooth(
        se = FALSE,
        method = "loess",
        formula = "y ~ x"
      ) +
      ylab(YLAB) +
      xlab(XLAB) +
      labs(
        title = paste(Name1, "and", Name2),
        subtitle = paste(YLAB, "Career Trajectories"),
        color = "Player"
      ) +
      theme(
        text = element_text(size = 15),
        plot.title = element_text(
          colour = "red",
          size = 18,
          hjust = 0.5, vjust = 0.8, angle = 0
        ),
        plot.subtitle = element_text(
          colour = "blue",
          size = 16,
          hjust = 0.5, vjust = 0.8, angle = 0
        )
      )
    list(plot1 = plot1, S = S)
  } # end of initial if statement
}

