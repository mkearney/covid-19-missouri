
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
#> # A tibble: 16 x 81
#>    state state_abb total_cases state_labs other_labs ages_0_20 ages_20_24
#>    <chr> <chr>           <dbl>      <dbl>      <dbl>     <dbl>      <dbl>
#>  1 Miss… MO               3037        211       2826        76        212
#>  2 Miss… MO               2112        160       1952        NA         NA
#>  3 Miss… MO               1834        140       1694        NA         NA
#>  4 Miss… MO               1581        135       1446        NA         NA
#>  5 Miss… MO               1327        121       1206        NA         NA
#>  6 Miss… MO               1039        124        915        NA         NA
#>  7 Miss… MO                903         92        811        NA         NA
#>  8 Miss… MO                838         98        740        NA         NA
#>  9 Miss… MO                670         90        580        NA         NA
#> 10 Miss… MO                502         72        430        NA         NA
#> 11 Miss… MO                356         62        294        NA         NA
#> 12 Miss… MO                255         55        200         8         NA
#> 13 Miss… MO                183         47        136         3         NA
#> 14 Miss… MO                106         47         59         1         NA
#> 15 Miss… MO                 90         38         52         1         NA
#> 16 Miss… MO                 69         NA         NA        NA         NA
#> # … with 74 more variables: ages_25_29 <dbl>, ages_30_34 <dbl>,
#> #   ages_35_39 <dbl>, ages_40_44 <dbl>, ages_45_49 <dbl>, ages_50_54 <dbl>,
#> #   ages_55_59 <dbl>, ages_60_64 <dbl>, ages_65_69 <dbl>, ages_70_74 <dbl>,
#> #   ages_75_79 <dbl>, ages_80_plus <dbl>, ages_Unknown <dbl>,
#> #   transmission_boone <dbl>, transmission_callaway <dbl>,
#> #   transmission_camden <dbl>, transmission_carter <dbl>,
#> #   transmission_cass <dbl>, transmission_clay <dbl>, transmission_cole <dbl>,
#> #   transmission_franklin <dbl>, transmission_greene <dbl>,
#> #   transmission_henry <dbl>, transmission_jackson <dbl>,
#> #   transmission_kansas_city <dbl>, transmission_lafayette <dbl>,
#> #   transmission_st_charles_county <dbl>, transmission_st_louis_city <dbl>,
#> #   transmission_st_louis_county <dbl>, transmission_tbd <dbl>,
#> #   .timestamp <dttm>, .last_updated <dttm>, ages_Boone <dbl>,
#> #   ages_Camden <dbl>, ages_Cass <dbl>, ages_Greene <dbl>, ages_Henry <dbl>,
#> #   ages_Jackson <dbl>, ages_Lafayette <dbl>, `ages_St. Charles County` <dbl>,
#> #   `ages_St. Louis City` <dbl>, `ages_St. Louis County` <dbl>,
#> #   transmission_under_20 <dbl>, transmission_x20_24 <dbl>,
#> #   transmission_x25_29 <dbl>, transmission_x30_34 <dbl>,
#> #   transmission_x35_39 <dbl>, transmission_x40_44 <dbl>,
#> #   transmission_x45_49 <dbl>, transmission_x50_54 <dbl>,
#> #   transmission_x55_59 <dbl>, transmission_x60_64 <dbl>,
#> #   transmission_x65_69 <dbl>, transmission_x70_74 <dbl>,
#> #   transmission_x75_79 <dbl>, transmission_x80 <dbl>,
#> #   transmission_unknown <dbl>, `ages_St. Charles` <dbl>,
#> #   transmission_x20_29 <dbl>, transmission_x30_39 <dbl>,
#> #   transmission_x40_49 <dbl>, transmission_x50_59 <dbl>,
#> #   transmission_x60_69 <dbl>, transmission_x70 <dbl>, ages_20_29 <dbl>,
#> #   ages_30_39 <dbl>, ages_40_49 <dbl>, ages_50_59 <dbl>, ages_60_69 <dbl>,
#> #   ages_70_plus <dbl>, transmission_travel <dbl>, transmission_contact <dbl>,
#> #   transmission_no_known_contact <dbl>, transmission_no_contact <dbl>

## county data
suppressMessages(readr::read_csv("data/mo-county.csv"))
#> # A tibble: 4,487 x 6
#>    county    total state_lab other_lab  fips timestamp          
#>    <chr>     <dbl>     <dbl>     <dbl> <dbl> <dttm>             
#>  1 Adair        11         0        11 29001 2020-04-08 01:16:01
#>  2 Andrew        0         0         0 29003 2020-04-08 01:16:01
#>  3 Atchison      1         1         0 29005 2020-04-08 01:16:01
#>  4 Audrain       0         0         0 29007 2020-04-08 01:16:01
#>  5 Barry         1         0         1 29009 2020-04-08 01:16:01
#>  6 Barton        0         0         0 29011 2020-04-08 01:16:01
#>  7 Bates         3         0         3 29013 2020-04-08 01:16:01
#>  8 Benton        3         0         3 29015 2020-04-08 01:16:01
#>  9 Bollinger     2         0         2 29017 2020-04-08 01:16:01
#> 10 Boone        77         5        72 29019 2020-04-08 01:16:01
#> # … with 4,477 more rows
```

![](img/timeseries.png)
