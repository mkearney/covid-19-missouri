
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
#> # A tibble: 5 x 19
#>   state state_abb total_cases state_labs other_labs ages_0_20 ages_20_29
#>   <chr> <chr>           <dbl>      <dbl>      <dbl>     <dbl>      <dbl>
#> 1 Miss… MO                255         55        200         8         60
#> 2 Miss… MO                183         47        136         3         46
#> 3 Miss… MO                106         47         59         1         26
#> 4 Miss… MO                 90         38         52         1         24
#> 5 Miss… MO                 69         NA         NA        NA         NA
#> # … with 12 more variables: ages_30_39 <dbl>, ages_40_49 <dbl>,
#> #   ages_50_59 <dbl>, ages_60_69 <dbl>, ages_70_plus <dbl>,
#> #   transmission_travel <dbl>, transmission_contact <dbl>,
#> #   transmission_no_known_contact <dbl>, transmission_unknown <dbl>,
#> #   .timestamp <dttm>, .last_updated <dttm>, transmission_no_contact <dbl>

## county data
suppressMessages(readr::read_csv("data/mo-county.csv"))
#> # A tibble: 463 x 6
#>    county    total state_lab other_lab  fips timestamp          
#>    <chr>     <dbl>     <dbl>     <dbl> <dbl> <dttm>             
#>  1 Adair         1         0         1 29001 2020-03-25 13:16:01
#>  2 Bates         1         0         1 29013 2020-03-25 13:16:01
#>  3 Boone        20         1        19 29019 2020-03-25 13:16:01
#>  4 Callaway      2         0         2 29027 2020-03-25 13:16:01
#>  5 Camden        1         1         0 29029 2020-03-25 13:16:01
#>  6 Cass          6         2         4 29037 2020-03-25 13:16:01
#>  7 Christian     1         1         0 29043 2020-03-25 13:16:01
#>  8 Clay          2         0         2 29047 2020-03-25 13:16:01
#>  9 Clinton       1         0         1 29049 2020-03-25 13:16:01
#> 10 Cole          5         3         2 29051 2020-03-25 13:16:01
#> # … with 453 more rows
```

![](img/timeseries.png)
