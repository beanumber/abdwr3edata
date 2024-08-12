#' Ripken's Iron Man game
#' @docType data
"ripken_gamelog"

#' Warren Spahn
#' @docType data
"spahn"

#' American and National League statistics
#' @docType data
"NLbatting"
#' @rdname NLbatting
"ALbatting"
#' @rdname NLbatting
"NLpitching"

#' Hall of Fame batting
#' @docType data
"hof_batting"
#' @rdname hof_batting
"hof_pitching"

#' Retrosheet game logs
#' @docType data
"retro_gl_header"
#' @rdname retro_gl_header
"retro_gl_2011"

#' Retrosheet events data for 2016
#' @docType data
#' @seealso [baseballr::retrosheet_data()]
"retro2016"

#' Ted Williams' and Joe DiMaggio's 1941 seasons
#' @description
#' Game-by-game hitting data for Joe DiMaggio in the 1941 season
#' @docType data
#' @source Baseball-Reference: <https://www.baseball-reference.com/players/gl.fcgi?id=dimagjo01&t=b&year=1941>
"dimaggio_1941"

#' @rdname dimaggio_1941
#' @docType data
#' @description
#' Game-by-game hitting data for Ted Williams in the 1941 season
#' @format
#'   \describe{
#'     \item{Rk}{A ranking index}
#'     \item{Gcar}{Cumulative number of career games}
#'     \item{Gtm}{game number}
#'     \item{Date}{date of game}
#'     \item{Tm}{player team}
#'     \item{X6}{indicates home or awy}
#'     \item{Opp}{opposing team}
#'     \item{Rslt}{game outcome}
#'     \item{Inngs}{number of innings played}
#'     \item{PA}{plate appearances}
#'     \item{AB}{at-bats}
#'     \item{R}{runs scored}
#'     \item{H}{hits}
#'     \item{X2B}{doubles}
#'     \item{X3B}{triples}
#'     \item{HR}{home runs}
#'     \item{RBI}{runs batted in}
#'     \item{BB}{walks}
#'     \item{IBB}{intentional walks}
#'     \item{SO}{strikeouts}
#'     \item{HBP}{hit by pitches}
#'     \item{SH}{sacrifice hits}
#'     \item{SF}{sacrifice flies}
#'     \item{ROE}{reached on an error}
#'     \item{GDP}{grounded in double play}
#'     \item{SB}{stolen bases}
#'     \item{CS}{caught stealing}
#'     \item{BA}{batting average}
#'     \item{OBP}{on-base percentage}
#'     \item{SLG}{slugging percentage}
#'     \item{OPS}{ops statistic}
#'     \item{BOP}{base-out percentage}
#'     \item{Pos}{fielding position}
#' }
#' @source Baseball-Reference: <https://www.baseball-reference.com/players/gl.fcgi?id=willite01&t=b&year=1941>
"williams_1941"

#' Ballparks and temperatures
#' @docType data
"temps_2023"
#' @rdname temps_2023
"parks_2023"

#' Ball-Strike Count data
#' @docType data
#' @details
#' Pitch-by-pitch level detail for several players and umpires. 
#' 
#' @seealso <https://beanumber.github.io/abdwr3e/06-pitchcount.html#behaviors-by-count>
"cabrera"
#' @rdname cabrera
"sanchez"
#' @rdname cabrera
"umpires"
#' @rdname cabrera
"verlander"
