#' @title Download Statcast data from Baseball Savant
#' @description
#' Baseball Savant downloads are limited to 25,000 rows. These functions help
#' you build a larger database easily. 
#' 
#' @param the_date The date on which you want to download data
#' @param dir Path to a directory to store downloaded files
#' @return NULL
#' @export
#' @seealso [baseballr::statcast_search()]
#' @examples
#' statcast_daily("2023-06-11", dir = tempdir())
#' 

statcast_daily <- function(the_date = lubridate::now(), dir = getwd()) {
  if (!dir.exists(dir)) {
    dir.create(dir, recursive = TRUE)
  }
  
  filename <- paste0("sc_", lubridate::as_date(the_date), ".csv")
  file_path <- fs::path(dir, filename)
  
  # if the file already exists, read it. 
  if (file.exists(file_path)) {
    x <- file_path |>
      readr::read_csv() |>
      suppressMessages()
    if (nrow(x) > 0) {
      message(
        paste(
          "Found", nrow(x), "observations in", file_path, "..."
        )
      )
    }
    return(NULL)
  }
  
  # the file doesn't exist or doesn't have data, get it
  message(paste("Retrieving data from", the_date))
  x <- baseballr::statcast_search(
    start_date = lubridate::as_date(the_date),
    end_date = lubridate::as_date(the_date), 
    player_type = "batter"
  ) |>
    dplyr::filter(game_type == "R")
  
  if (nrow(x) > 0) {
    message(paste("Writing", file_path, "..."))
    x |>
      readr::write_csv(file = fs::path(dir, filename))
  }
  return(NULL)
}

#' @rdname statcast_daily
#' @param year The year for which you want to download data
#' @export

statcast_season <- function(year = lubridate::year(lubridate::now()), dir = getwd()) {
  if (!dir.exists(dir)) {
    dir.create(dir, recursive = TRUE)
  }
  
  mlb_days <- 80:280
  mlb_dates <- mlb_days |>
    paste(year) |>
    lubridate::parse_date_time("%j %Y") |>
    lubridate::as_date()
  
  mlb_dates |>
    purrr::walk(statcast_daily, dir)
}

#' @rdname statcast_daily
#' @export
#' @param pattern passed to [base::list.files()]
#' @examples
#' x <- statcast_read_csv(tempdir())

statcast_read_csv <- function(dir = getwd(), pattern = "*.csv") {
  dir |>
    list.files(pattern = pattern, full.names = TRUE) |>
    readr::read_csv() |>
    dplyr::bind_rows()
}

#' @rdname statcast_daily
#' @param x Data frame to write. See [readr::write_rds()].
#' @param ... arguments passed to [readr::write_rds()]. Currently ignored.
#' @export
#' @examples
#' x <- statcast_read_csv(tempdir())
#' statcast_write_rds(x, tempdir())
#' 

statcast_write_rds <- function(x, dir = getwd(), ...) {
  tmp <- x |>
    dplyr::group_by(year = lubridate::year(game_date))
  years <- tmp |>
    dplyr::group_keys() |> 
    dplyr::pull(year)
  tmp |>
    dplyr::group_split() |>
    rlang::set_names(years) |>
    purrr::map(
      ~readr::write_rds(
        .x, 
        file = fs::path(
          dir,
          paste0(
            "statcast_", 
            max(lubridate::year(dplyr::pull(.x, game_date))), 
            ".rds"
          )
        ), 
        compress = "xz",
#        ...
      )
    )
  list.files(dir, pattern = "*.rds", full.names = TRUE)
}
