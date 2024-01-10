test_that("counts work", {
  skip()
  if (require(baseballr)) {
    retro2016 <- baseballr::retrosheet_data(tempdir(), 2016)
    events <- retro2016[[1]][["events"]]
    events_states <- retrosheet_add_states(events)
    events_counts <- retrosheet_add_counts(events)
    counts <- events_counts |>
      dplyr::select(dplyr::matches("c[0-9]"))
    counts |>
      tidyr::pivot_longer(cols = everything(), names_to = "count", values_to = "yes") |>
      dplyr::group_by(count) |>
      dplyr::summarize(
        N = sum(yes), 
        pct = sum(yes) / dplyr::n()
      ) |>
      dplyr::arrange(desc(N))
    counts |>
      dplyr::filter(c11, c20) |>
      nrow() |>
      expect_equal(0)
    counts |>
      dplyr::filter(c21, c30) |>
      nrow() |>
      expect_equal(0)
    counts |>
      dplyr::filter(c11, c30) |>
      nrow() |>
      expect_equal(0)
    counts |>
      dplyr::filter(c11, c02) |>
      nrow() |>
      expect_equal(0)
    counts |>
      dplyr::filter(c10, c01) |>
      nrow() |>
      expect_equal(0)
  }
})

