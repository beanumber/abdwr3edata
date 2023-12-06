# Data sets recovered from 2e

library(tidyverse)

# Ripken
ripken_gamelog <- here::here("data-raw", "gamelogfile.csv") |>
  read_csv()

usethis::use_data(ripken_gamelog, overwrite = TRUE, compress = "xz")

# Spahn
spahn <- here::here("data-raw", "spahn.csv") |>
  read_csv()

usethis::use_data(spahn, overwrite = TRUE, compress = "xz")

# AL & NL batting and pitching
NLbatting <- here::here("data-raw", "NLbatting.csv") |>
  read_csv()
usethis::use_data(NLbatting, overwrite = TRUE, compress = "xz")

ALbatting <- here::here("data-raw", "ALbatting.csv") |>
  read_csv()
usethis::use_data(ALbatting, overwrite = TRUE, compress = "xz")

NLpitching <- here::here("data-raw", "NLpitching.csv") |>
  read_csv()
usethis::use_data(NLpitching, overwrite = TRUE, compress = "xz")

# Hall of Fame
hof_pitching <- here::here("data-raw", "hofpitching.csv") |>
  read_csv()
usethis::use_data(hof_pitching, overwrite = TRUE, compress = "xz")

# Retrosheet game logs
retro_gl_header <- here::here("data-raw", "game_log_header.csv") |>
  read_csv()
usethis::use_data(retro_gl_header, overwrite = TRUE, compress = "xz")

retro_gl_2011 <- here::here("data-raw", "gl2011.txt") |>
  read_csv(
    col_names = names(retro_gl_header),
    na = character()
  )
usethis::use_data(retro_gl_2011, overwrite = TRUE, compress = "xz")

# DiMaggio
library(rvest)
url <- paste0(
  "https://www.baseball-reference.com/players/",
  "gl.fcgi?id=dimagjo01&t=b&year=1941"
)
dimaggio_1941 <- url |>
  read_html() |>
  html_table() |>
  pluck(5) |>
  as_tibble(.name_repair = "universal") |>
  mutate(
    Rk = parse_number(Rk),
    across(PA:RE24, as.numeric)
  ) |>
  filter(!is.na(Rk))

usethis::use_data(dimaggio_1941, overwrite = TRUE, compress = "xz")

# Ballpark temperatures
temps_2023 <- here::here("data-raw", "temps_2023.csv") |>
  read_csv()
usethis::use_data(temps_2023, overwrite = TRUE, compress = "xz")

parks_2023 <- here::here("data-raw", "parks_2023.csv") |>
  read_csv()
usethis::use_data(parks_2023, overwrite = TRUE, compress = "xz")
