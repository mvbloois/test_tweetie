library(rvest)

# Nieuw ingeschreven geneesmiddelen
# https://www.geneesmiddeleninformatiebank.nl/ords/
# f?p=111:2:0:NEWRVG:NO:2:P2_AS_APPDATS,P2_AS_APPDATE,
# P2_OPTIONS,P2_RESPAGE,P2_SORT,P2_RESPPG:
# 06-09-2021,06-10-2021,,1,PRODA,10

end_date <- as.character(format(Sys.Date(), "%d-%m-%Y"))
start_date <- as.character(format(Sys.Date() - 31, "%d-%m-%Y"))
csv_date <- as.character(format(Sys.Date(), "%Y-%m-%d"))
csv <- paste0("data/", csv_date, "_cbg_nieuwe-registraties.csv")

url <- paste0("https://www.geneesmiddeleninformatiebank.nl/ords/f?p=111:2:0:NEWRVG:NO:2:P2_AS_APPDATS,P2_AS_APPDATE,P2_OPTIONS,P2_RESPAGE,P2_SORT,P2_RESPPG:",
  start_date, ",", end_date, ",,1,PRODA,100")

page <- read_html(url)

write.csv(html_table(page)[[1]], csv, row.names = FALSE)
