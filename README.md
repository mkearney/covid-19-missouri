
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
(new iteration of the scraper):

  - [State-wide totals](data/mo-total.csv)
  - [Cases by county](data/mo-county.csv)
  - [Cases by age](data/mo-age.csv)
  - [Cases by transmission](data/mo-transmission.csv)
