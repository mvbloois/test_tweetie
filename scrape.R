library(rtweet)
library(magrittr)
library(readr)

filename <- paste0("data/", Sys.Date(), "_tweets_sfknieuws.csv")

get_timeline(user = "SFKnieuws") %>%
  write_csv(filename)
