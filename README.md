
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
#> # A tibble: 4 x 17
#>   state state_abb total_cases state_labs other_labs ages_0_20 ages_20_29
#>   <chr> <chr>           <dbl>      <dbl>      <dbl>     <dbl>      <dbl>
#> 1 Miss… MO                 90         38         52         1         24
#> 2 Miss… MO                 90         38         52         1         24
#> 3 Miss… MO                 90         38         52         1         24
#> 4 Miss… MO                 90         38         52         1         24
#> # … with 10 more variables: ages_30_39 <dbl>, ages_40_49 <dbl>,
#> #   ages_50_59 <dbl>, ages_60_69 <dbl>, ages_70_plus <dbl>,
#> #   transmission_travel <dbl>, transmission_contact <dbl>,
#> #   transmission_no_contact <dbl>, transmission_unknown <dbl>,
#> #   .timestamp <dttm>

## county data
suppressMessages(readr::read_csv("data/mo-county.csv"))
#> # A tibble: 72 x 6
#>    county    total state_lab other_lab  fips timestamp          
#>    <chr>     <dbl>     <dbl>     <dbl> <dbl> <dttm>             
#>  1 Bates         1         0         1 29013 2020-03-22 19:33:15
#>  2 Boone        10         1         9 29019 2020-03-22 19:33:15
#>  3 Cass          6         2         4 29037 2020-03-22 19:33:15
#>  4 Christian     1         1         0 29043 2020-03-22 19:33:15
#>  5 Cole          3         2         1 29051 2020-03-22 19:33:15
#>  6 Dunklin       1         0         1 29069 2020-03-22 19:33:15
#>  7 Greene       10         8         2 29077 2020-03-22 19:33:15
#>  8 Henry         1         1         0 29083 2020-03-22 19:33:15
#>  9 Jackson       5         1         4 29095 2020-03-22 19:33:15
#> 10 Jasper        1         1         0 29097 2020-03-22 19:33:15
#> # … with 62 more rows
```

![](/home/kmw/rstats/covid-19-missouri/img/timeseries.png)
