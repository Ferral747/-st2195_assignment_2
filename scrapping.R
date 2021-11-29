library(rvest)

csv_wiki <- read_html("https://en.wikipedia.org/wiki/Comma-separated_values") #Reads webpage
csv_tables <- csv_wiki %>%
  html_nodes(xpath= '//h2[contains(., "Example")] //following-sibling::pre') %>%
  html_text()

print(csv_tables)

csv_table <- csv_tables[1] #Get only 1st table

write.table(csv_table, file = "car.csv", quote = FALSE, col.names = FALSE, row.names = FALSE)