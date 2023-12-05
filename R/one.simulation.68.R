globalVariables(c(
  "Home", "League", "Talent", "Talent.Home", "Talent.Visitor",  "Visitor", "Winner.Lg",
  "Winner.WS", "Wins", "outcome", "prob", "prob.Home", "winner"
))

#' @title Simulate one season from 1968
#' @param s.talent Proportion of talent (vs. luck)
#' @export
#' @examples
#' one_simulation_68()
#' 

one_simulation_68 <- function(s.talent = 0.20) {
  make.schedule <- function(teams, k) {
    n.teams <- length(teams)
    Home <- rep(rep(teams, each = n.teams), k)
    Visitor <- rep(rep(teams, n.teams), k)
    schedule <- tibble::tibble(
      Home = Home,
      Visitor = Visitor
    )
    dplyr::filter(schedule, Home != Visitor)
  }

  NL <- c(
    "ATL", "CHN", "CIN", "HOU", "LAN",
    "NYN", "PHI", "PIT", "SFN", "SLN"
  )
  AL <- c(
    "BAL", "BOS", "CAL", "CHA", "CLE",
    "DET", "MIN", "NYA", "OAK", "WS2"
  )
  teams <- c(NL, AL)
  league <- c(rep(1, 10), rep(2, 10))

  schedule <- dplyr::bind_rows(
    make.schedule(NL, 9),
    make.schedule(AL, 9)
  )

  # simulate talents
  talents <- stats::rnorm(20, 0, s.talent)
  TAL <- tibble::tibble(
    Team = teams, League = league,
    Talent = talents
  )

  # merge talents and win probs with schedule data frame
  SCH <- schedule |>
    dplyr::inner_join(TAL, by = c("Home" = "Team")) |>
    dplyr::rename(Talent.Home = Talent) |>
    dplyr::inner_join(TAL, by = c("Visitor" = "Team", "League")) |>
    dplyr::rename(Talent.Visitor = Talent)

  # play season of games
  SCH |>
    dplyr::mutate(prob.Home = exp(Talent.Home) /
      (exp(Talent.Home) + exp(Talent.Visitor))) -> SCH

  SCH |>
    dplyr::mutate(
      outcome = stats::rbinom(nrow(SCH), 1, prob.Home),
      winner = ifelse(outcome, Home, Visitor)
    ) -> SCH

  # compute number of games won for all teams
  SCH |>
    dplyr::group_by(winner) |>
    dplyr::summarize(Wins = dplyr::n()) |>
    dplyr::inner_join(TAL, by = c("winner" = "Team")) -> RESULTS

  win_league <- function(RR) {
    out <- RR |>
      dplyr::mutate(
        Winner.Lg = 0,
        prob = exp(Talent),
        outcome = sample(nrow(RR), prob = prob)
      ) |>
      dplyr::arrange(League, dplyr::desc(Wins), outcome) |>
      dplyr::select(-outcome)
    out[1 + c(0, nrow(RR) / 2), "Winner.Lg"] <- 1
    out
  }

  # record if eligible for wild card (Wild), in playoffs (Playoff)
  # in conference playoff (CS), World Series (WS), or winner (B)

  RESULTS <- win_league(RESULTS)

  ws_winner <- RESULTS |>
    dplyr::filter(Winner.Lg == 1) |>
    dplyr::mutate(
      outcome = c(stats::rmultinom(1, 7, prob)),
      Winner.WS = ifelse(outcome > 3, 1, 0)
    ) |>
    dplyr::filter(outcome > 3) |>
    dplyr::select(winner, Winner.WS)

  # data frame has teams, division, talent, wins, and diff playoff results
  RESULTS |>
    dplyr::left_join(ws_winner, by = c("winner")) |>
    tidyr::replace_na(list(Winner.WS = 0)) |>
    dplyr::rename(Team = winner) |>
    dplyr::select(-prob)
}
