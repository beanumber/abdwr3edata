
<!-- README.md is generated from README.Rmd. Please edit that file -->

# abdwr3edata

<!-- badges: start -->

[![R-CMD-check](https://github.com/beanumber/abdwr3edata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/beanumber/abdwr3edata/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `abdwr3edata` is to facilitate computations made in the [3rd
edition of *Analyzing Baseball Data with
R*](https://beanumber.github.io/abdwr3e/).

## Installation

You can install the development version of `abdwr3edata` from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("beanumber/abdwr3edata")
```

## Example

Compare the mean batting average for all those events that passed
through a 1-1 count to those that didn’t.

``` r
library(dplyr)
library(abdwr3edata)
retro2016 |>
  retrosheet_add_counts() |>
  group_by(c11) |>
  summarize(
    num_events = n(),
    num_batters = n_distinct(bat_id),
    num_pitchers = n_distinct(pit_id),
    mean_ba = sum(h_fl) / sum(ab_fl)
  )
#> # A tibble: 2 × 5
#>   c11   num_events num_batters num_pitchers mean_ba
#>   <lgl>      <int>       <int>        <int>   <dbl>
#> 1 FALSE     115487         937          741   0.443
#> 2 TRUE       75226         888          737   0.379
```

## Citation

``` r
citation("abdwr3edata")
#> To cite package 'abdwr3edata' in publications use:
#> 
#>   Baumer B, Albert J (2024). _abdwr3edata: Companion to 'Analyzing
#>   Baseball Data with R', 3rd edition_. R package version 0.0.2,
#>   <https://github.com/beanumber/abdwr3edata>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {abdwr3edata: Companion to 'Analyzing Baseball Data with R', 3rd edition},
#>     author = {Benjamin S. Baumer and Jim Albert},
#>     year = {2024},
#>     note = {R package version 0.0.2},
#>     url = {https://github.com/beanumber/abdwr3edata},
#>   }
```
