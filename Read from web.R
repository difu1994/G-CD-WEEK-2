#####Webscraping
#####Programatically extracting data from HTML code of websites
#####Google Scholar

#Getting data from webpage

con <- url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode <- readLines(con)
close(con)
#html code hard to read
#use XML parsing

###Parsing with XML (dont use as it is outdated)
#library(XML)
#library(httr)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"

#Parse with XML
html <- htmlTreeParse(rawToChar(GET(url)$content), useInternalNodes = TRUE)

#Get "title" from html using XML parsing
a <- xpathSApply(html, "//title", xmlValue)

#Get number of times paper cited by
b <- xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)


######GET from httr package (use this instead)
#use GET command to link html page
html2 <- GET("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")

#extract all content from html page as "text" string
content2 <- content(html2, as = "text")

#Parse out using HTML (similar as above)
parsedHtml <- htmlParse(content2, asText = TRUE)

#using XML commands to extract specific data
c <- xpathSApply(parsedHtml, "//title",xmlValue)

######GET from webpage with password protection
#no password protection
pg1 <- GET("http://httpbin.org/basic-auth/user/passwd")

#with password protection
pg2 <- GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user","passwd"))


names(pg1)





