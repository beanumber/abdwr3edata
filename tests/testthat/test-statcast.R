test_that("statcast works", {
  skip_on_cran()
  expect_null(statcast_daily("2022-08-07", dir = tempdir()))
  expect_null(statcast_daily("2023-06-11", dir = tempdir()))
#  statcast_season(dir = tempdir())
   x <- statcast_read_csv(dir = tempdir())
   expect_s3_class(x, "tbl")
   expect_s3_class(x, "data.frame")
   expect_gt(nrow(x), 0)
   
   y <- statcast_read_csv(dir = tempdir(), pattern = "2023[0-9,-]+\\.csv")
   expect_lt(nrow(y), nrow(x))
   
   expect_length(y <- statcast_write_rds(x, dir = tempdir()), 2)
   z <- readr::read_rds(y[1])
   expect_s3_class(z, "tbl")
   expect_equal(nrow(z), 4354)
   expect_equal(ncol(z), 95)
})
