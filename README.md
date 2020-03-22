
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covid-19-missouri

<!-- badges: start -->

<!-- badges: end -->

This repo is for collecting testing and case-tracking information about
COVID-19 in the great state of Missouri. Currently, [this
code](R/scrape.R) is used to scrape updates from
[health.mo.gov](https://health.mo.gov).

## Data

Data are saved as CSV files with each row representing a new observation
at the state or county level:

  - [State-wide totals](data/mo-total.csv)
  - [Cases by county](data/mo-county.csv)

<!-- end list -->

``` r
## state totals daya
suppressMessages(readr::read_csv("data/mo-total.csv"))
#> # A tibble: 11 x 18
#>    state state_abb total_cases state_labs other_labs ages_0_20 ages_20_29
#>    <chr> <chr>           <dbl>      <dbl>      <dbl>     <dbl>      <dbl>
#>  1 Miss… MO                 90         38         52         1         24
#>  2 Miss… MO                 90         38         52         1         24
#>  3 Miss… MO                 90         38         52         1         24
#>  4 Miss… MO                 90         38         52         1         24
#>  5 Miss… MO                 90         38         52         1         24
#>  6 Miss… MO                 90         38         52         1         24
#>  7 Miss… MO                 90         38         52         1         24
#>  8 Miss… MO                 90         38         52         1         24
#>  9 Miss… MO                 90         38         52         1         24
#> 10 Miss… MO                 90         38         52         1         24
#> 11 Miss… MO                 69         NA         NA        NA         NA
#> # … with 11 more variables: ages_30_39 <dbl>, ages_40_49 <dbl>,
#> #   ages_50_59 <dbl>, ages_60_69 <dbl>, ages_70_plus <dbl>,
#> #   transmission_travel <dbl>, transmission_contact <dbl>,
#> #   transmission_no_contact <dbl>, transmission_unknown <dbl>,
#> #   .timestamp <dttm>, .last_updated <dttm>

## county data
suppressMessages(readr::read_csv("data/mo-county.csv"))
#> # A tibble: 180 x 6
#>    county    total state_lab other_lab  fips timestamp          
#>    <chr>     <dbl>     <dbl>     <dbl> <dbl> <dttm>             
#>  1 Bates         1         0         1 29013 2020-03-22 23:45:21
#>  2 Boone        10         1         9 29019 2020-03-22 23:45:21
#>  3 Cass          6         2         4 29037 2020-03-22 23:45:21
#>  4 Christian     1         1         0 29043 2020-03-22 23:45:21
#>  5 Cole          3         2         1 29051 2020-03-22 23:45:21
#>  6 Dunklin       1         0         1 29069 2020-03-22 23:45:21
#>  7 Greene       10         8         2 29077 2020-03-22 23:45:21
#>  8 Henry         1         1         0 29083 2020-03-22 23:45:21
#>  9 Jackson       5         1         4 29095 2020-03-22 23:45:21
#> 10 Jasper        1         1         0 29097 2020-03-22 23:45:21
#> # … with 170 more rows
```

![](img/timeseries.png)
