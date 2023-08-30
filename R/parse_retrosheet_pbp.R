#' @title Download Retrosheet play-by-play files
#' @export
#' @param season Season to download
#' @description
#' Legacy functions from the 2nd edition of *Analyzing Baseball Data with R*.
#' These functions have been superseded by [baseballr::retrosheet_data()].
#' Please use those functions instead for new work.
#' These functions are preserved here for edification.
#' @seealso [baseballr::retrosheet_data()]
download_retrosheet <- function(season) {
  # get zip file from retrosheet website
  utils::download.file(
    url = paste0(
      "http://www.retrosheet.org/events/", season, "eve.zip"
    ),
    destfile = file.path(
      "retrosheet", "zipped",
      paste0(season, "eve.zip")
    )
  )
}

#' @rdname download_retrosheet
#' @export
unzip_retrosheet <- function(season) {
  # unzip retrosheet files
  utils::unzip(
    file.path(
      "retrosheet", "zipped",
      paste0(season, "eve.zip")
    ),
    exdir = file.path("retrosheet", "unzipped")
  )
}

#' @rdname download_retrosheet
#' @export
create_csv_file <- function(season) {
  # http://chadwick.sourceforge.net/doc/cwevent.html
  # shell("cwevent -y 2000 2000TOR.EVA > 2000TOR.bev")
  wd <- getwd()
  setwd("retrosheet/unzipped")
  cmd <- paste0(
    "cwevent -y ", season, " -f 0-96 ",
    season, "*.EV*", " > all", season, ".csv"
  )
  message(cmd)
  if (.Platform$OS.type == "unix") {
    system(cmd)
  } else {
    shell(cmd)
  }
  setwd(wd)
}

#' @rdname download_retrosheet
#' @export
create_csv_roster <- function(season) {
  # creates a CSV file of the rosters
  rosters <- list.files(
    path = file.path("retrosheet", "unzipped"),
    pattern = paste0(season, ".ROS"),
    full.names = TRUE
  )

  rosters |>
    purrr::map_df(readr::read_csv,
      col_names = c(
        "PlayerID", "LastName", "FirstName",
        "Bats", "Pitches", "Team"
      )
    ) |>
    readr::write_csv(path = file.path(
      "retrosheet",
      "unzipped",
      paste0("roster", season, ".csv")
    ))
}

#' @rdname download_retrosheet
#' @export
cleanup <- function() {
  # removes retrosheet files not needed
  files <- list.files(
    path = file.path("retrosheet", "unzipped"),
    pattern = "(*.EV|*.ROS|TEAM*)",
    full.names = TRUE
  )
  unlink(files)

  zips <- list.files(
    path = file.path("retrosheet", "zipped"),
    pattern = "*.zip",
    full.names = TRUE
  )
  unlink(zips)
}

#' @rdname download_retrosheet
#' @export
parse_retrosheet_pbp <- function(season) {
  download_retrosheet(season)
  unzip_retrosheet(season)
  create_csv_file(season)
  create_csv_roster(season)
  cleanup()
}
