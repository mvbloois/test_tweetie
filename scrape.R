library(rvest)

end_date <- as.character(format(Sys.Date(), "%d-%m-%Y"))
start_date <- as.character(format(Sys.Date() - 31, "%d-%m-%Y"))
csv <- paste0("data/", end_date, "_cbg_nieuwe-registraties.csv")

url <- paste0("https://www.geneesmiddeleninformatiebank.nl/ords/f?p=111:2:0:NEWRVG:NO:2:P2_AS_APPDATS,P2_AS_APPDATE,P2_OPTIONS,P2_RESPAGE,P2_SORT,P2_RESPPG:",
  start_date, ",", end_date, ",,1,PRODA,100")

page <- read_html(url)

write.csv(html_table(page)[[1]], csv)
