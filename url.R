
siteUrl <- "http://headacheaustralia.org.au/types-of-headaches/"

dataSynthesis <- function(url) {
  raw_html <- read_html(siteUrl)
  link_tags <- html_nodes(dataHtml, ".disorder-links a")
  links <- html_attr(link_tags, "href")
  
  return (links)
}
