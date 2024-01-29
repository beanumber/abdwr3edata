library(tidyverse)

retro_data <- baseballr::retrosheet_data(
  here::here("data-large/retrosheet"),
  c(2016)
)

retro2016 <- retro_data |>
  pluck("2016") |>
  pluck("events")

usethis::use_data(retro2016, compress = "xz", overwrite = TRUE)
