# Data sets derived from Lahman

library(tidyverse)
library(Lahman)

hof_batting <- Batting |>
  group_by(playerID) |>
  summarize(
    HR = sum(HR),
    AB = sum(AB),
    From = min(yearID),
    To = max(yearID),
    tH = sum(H),
    walks = sum(BB, na.rm = TRUE) + sum(HBP, na.rm = TRUE),
    PA = sum(AB + walks) + sum(SF, na.rm = TRUE),
    TB = sum(H) + sum(X2B) + 2*sum(X3B) + 3*sum(HR)
  ) |>
  mutate(
    OBP = (tH + walks) / PA,
    SLG = TB / AB,
    OPS = OBP + SLG
  ) |>
  filter(PA > 4000 | (PA > 2500 & OPS > 0.8)) |>
  inner_join(
    HallOfFame |>
      filter(inducted == "Y", category == "Player"), 
    by = "playerID"
  ) |>
  inner_join(People, by = "playerID") |>
  mutate(Player = paste(nameFirst, nameLast))

usethis::use_data(hof_batting, overwrite = TRUE, compress = "xz")
