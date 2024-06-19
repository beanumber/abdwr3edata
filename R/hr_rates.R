#' @title Compute home run rates
#' @param age Age of the player
#' @param hr Number of home runs
#' @param ab Number of at-bats
#' @export
#' @return a `list` with two elements:
#'  - `x`: the age of the player
#'  - `y`: the number of home runs per 100 at-bats
#' @references <https://beanumber.github.io/abdwr3e/02-intro.html#sec-rfunctions>
#' @examples
#' hr_rates(35, 4, 200)
#' 
hr_rates <- function(age, hr, ab) {
  rates <- round(100 * hr / ab, 1)
  list(x = age, y = rates)
}
