% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parse_retrosheet_pbp.R
\name{download_retrosheet}
\alias{download_retrosheet}
\alias{unzip_retrosheet}
\alias{create_csv_file}
\alias{create_csv_roster}
\alias{cleanup}
\alias{parse_retrosheet_pbp}
\title{Download Retrosheet play-by-play files}
\usage{
download_retrosheet(season)

unzip_retrosheet(season)

create_csv_file(season)

create_csv_roster(season)

cleanup()

parse_retrosheet_pbp(season)
}
\arguments{
\item{season}{Season to download}
}
\description{
Legacy functions from the 2nd edition of \emph{Analyzing Baseball Data with R}.
These functions have been superseded by \code{\link[baseballr:retrosheet_data]{baseballr::retrosheet_data()}}.
Please use those functions instead for new work.
These functions are preserved here for edification.
}
\seealso{
\code{\link[baseballr:retrosheet_data]{baseballr::retrosheet_data()}}
}
