##----------------------------------------------------------------------------##
##                    package(s) & timestamp & state info                     ##
##----------------------------------------------------------------------------##

## i like data.table right now
library(data.table)

## data collection time info (couldn't find timestamp on website)
time_stamp <- Sys.time()
time_stamp_utc <- as.POSIXct(format(time_stamp, tz = "UTC"), tz = "UTC")

## no fips code because i'm lazy and don't have them for counties
state_info <- data.table(
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
d1 <- as.data.table(dats[[1]])
names(d1) <- c("county", "state_lab", "other_lab")
d1[, state_lab := ifelse(is.na(state_lab), 0L, state_lab)]
d1[, other_lab := ifelse(is.na(other_lab), 0L, other_lab)]

## by age
d2 <- as.data.table(dats[[2]])
names(d2) <- c("age_range", "cases")
d2[, age_range := sub("Under 20", "0-20", age_range)]

## by transmission type
d3 <- as.data.table(dats[[3]])
names(d3) <- c("transmission", "cases")
d3[, transmission := tolower(transmission)]

## by state (total)
meta <- data.table(
  total_cases = sum(c(d1[, state_lab], d1[, other_lab])),
  state_labs = sum(d1[, state_lab]),
  other_labs = sum(d1[, other_lab]),
  age_70_plus = sum(d2[age_range=="70+", cases]),
  age_under_70 = sum(d2[age_range!="70+", cases]),
  travel_related = sum(d3[transmission == "travel", cases]),
  contact_related = sum(d3[transmission == "contact", cases]),
  unknown_related = sum(d3[transmission == "unknown", cases]),
  time = time_stamp,
  time_utc = time_stamp_utc
)

## all data
d <- list(
  by_state = cbind(state_info, meta),
  by_county = cbind(state_info, d1),
  by_age_range = cbind(state_info, d2),
  by_transmission = cbind(state_info, d3)
)

##----------------------------------------------------------------------------##
##                                 write CSVs                                 ##
##----------------------------------------------------------------------------##

save_as <- function(x) file.path("/home/kmw/rstats/covid-19-missouri/data",
  format(Sys.time(), paste0(x, "-%Y-%m-%d-%I%P.csv")))

write.csv(d$by_state, save_as("mo-total"), na = "", row.names = FALSE)
write.csv(d$by_county, save_as("mo-county"), na = "", row.names = FALSE)
write.csv(d$by_age, save_as("mo-age"), na = "", row.names = FALSE)
write.csv(d$by_transmission, save_as("mo-transmission"), na = "", row.names = FALSE)

