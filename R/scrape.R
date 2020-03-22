##----------------------------------------------------------------------------##
##                          timestamp & state info                            ##
##----------------------------------------------------------------------------##

## get fips info and create county name variable
fips <- maps::county.fips[grepl("missouri,", maps::county.fips$polyname), ]
fips$county <- sub("missouri,", "", fips$polyname)

## capitalize
m <- gregexpr("(^| )[a-z]", fips$county)
regmatches(fips$county, m) <- dapr::lap(regmatches(fips$county, m), toupper)

## add dot after st/ste
fips$county <- sub("((?<=St)|(?<=Ste))(?= )", ".", fips$county, perl = TRUE)

## convert to tibble
fips <- tibble::as_tibble(fips[, c("fips", "county")])

## local file location
dir <- "/home/kmw/rstats/covid-19-missouri"

## data collection time info (couldn't find timestamp on website)
time_stamp <- Sys.time()
#time_stamp_utc <- as.POSIXct(format(time_stamp, tz = "UTC"), tz = "UTC")

## no fips code because i'm lazy and don't have them for counties
state_info <- tibble::tibble(
  state = "Missouri",
  state_abb = "MO"
)

##----------------------------------------------------------------------------##
##                            scrape health.mo.gov                            ##
##----------------------------------------------------------------------------##
h <- xml2::read_html(
  "https://health.mo.gov/living/healthcondiseases/communicable/novel-coronavirus/results.php"
)
dats <- rvest::html_table(h, fill = TRUE)

##----------------------------------------------------------------------------##
##                                 data tables                                ##
##----------------------------------------------------------------------------##
## by county test results
d1 <- tibble::as_tibble(dats[[1]])
while (ncol(d1) > 4) {
  d1[[4]] <- d1[[4]] + d1[[5]]
  d1[[5]] <- NULL
}
names(d1) <- c("county", "total", "state_lab", "other_lab")
d1[["total"]] <- ifelse(is.na(d1[["total"]]), 0L, d1[["total"]])
d1[["state_lab"]] <- ifelse(is.na(d1[["state_lab"]]), 0L, d1[["state_lab"]])
d1[["other_lab"]] <- ifelse(is.na(d1[["other_lab"]]), 0L, d1[["other_lab"]])

## add fips and timestamp info
d1$county <- sub(" County", "", d1$county)
d1 <- dplyr::left_join(d1, fips)
d1$timestamp <- time_stamp

## by age
d2 <- tibble::as_tibble(dats[[2]])
names(d2) <- c("age_range", "cases")
d2[["age_range"]] <- sub("Under 20", "0-20", d2[["age_range"]])

## by transmission type
d3 <- tibble::as_tibble(dats[[3]])
names(d3) <- c("transmission", "cases")
d3[["transmission"]] <- tolower(d3[["transmission"]])

## state of missouri totals
mo <- tibble::tibble(
  total_cases = sum(d1[["total"]]),
  state_labs = sum(d1[["state_lab"]]),
  other_labs = sum(d1[["other_lab"]]),
)
ages <- paste0("ages_", sub("\\+", "_plus", sub("-", "_", d2[["age_range"]])))
for (i in seq_along(ages)) {
  mo[[ages[i]]] <- d2[i, "cases"][[1]]
}

transmissions <- paste0("transmission_", janitor::make_clean_names(d3[["transmission"]]))
for (i in seq_along(transmissions)) {
  mo[[transmissions[i]]] <- d3[i, "cases"][[1]]
}

## add timestamp
mo[[".timestamp"]] <- time_stamp

## combine with state info
mo <- cbind(state_info, mo)

##----------------------------------------------------------------------------##
##                                 write CSVs                                 ##
##----------------------------------------------------------------------------##

mo <- dplyr::bind_rows(mo, readr::read_csv(file.path(dir, "data", "mo-total.csv")))
readr::write_csv(mo, file.path(dir, "data", "mo-total.csv"))
d1 <- dplyr::bind_rows(d1, readr::read_csv(file.path(dir, "data", "mo-county.csv")))
readr::write_csv(d1, file.path(dir, "data", "mo-county.csv"))

rmarkdown::render(file.path(dir, "README.Rmd"))

data_files <- file.path(dir, "data",
  paste0("mo-", c("total", "county"), ".csv"))
system(paste("cd", dir, "&&", "git add", paste(data_files, collapse = " ")))
system(paste("cd", dir, "&&", "git commit -m \"auto update\"", dir))
system(paste("cd", dir, "&&", "git push"))
