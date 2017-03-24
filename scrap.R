

scrapUrl <- function (url) {
  
  raw_html <- read_html(url)
  domElement <- html_node(raw_html, ".page-header .single-title")
  page_header <- html_text(domElement)
  
  divDomP <- html_nodes(raw_html, ".bn-row.first-row p")
  paragraphs <- html_text(divDomP)
  paragraphs[paragraphs == ""] <- FALSE
  paragraph <- paragraphs[paragraphs != FALSE]
  
  divDomSubHeaders <- html_nodes(raw_html, ".bn-row.first-row h2")
  sub_headers <- html_text(divDomSubHeaders)
  
  ache_type <- list(sub_headers, paragraph)
  return (ache_type)
}

data <- function(urls) {
  for (url in urls) {
    headache <- scrapUrl(url)
    headaches <- list(headaches, headache)
  }
  return (headaches)
}