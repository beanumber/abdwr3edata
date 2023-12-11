#' @title Compute home run rates
#' @param age Age of the player
#' @param hr Number of home runs
#' @param ab Number of at-bats
#' @export
#' @return a `list` with two elements
#' @examples
#' hr_rates(35, 4, 200)
#' 
hr_rates <- function(age, hr, ab) {
  rates <- round(100 * hr / ab, 1)
  list(x = age, y = rates)
}
