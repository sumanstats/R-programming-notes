Reads the web and returns a data frame with words in one column and meaning in the other

```r
library(tidyverse)
library(rvest)


WORDS=c()
MEANING=c()


for (i in c(LETTERS[1:23],"XYZ")){
  data <- read_html(paste0("https://www.englishclub.com/ref/Phrasal_Verbs/",i,"/"))
  col1 <- data %>% html_nodes("h3") %>% html_text() %>% gsub("\n","",.)
  col2 <- data %>% html_nodes("#ec-main") %>% html_nodes(".linkdescription") %>% html_text()
  # print(col1)
  # print(col2)
  WORDS=c(WORDS, col1)
  MEANING=c(MEANING, col2)
}


data.frame(WORDS,MEANING) %>% View()

```

