## Delete files recursively

To delete files with the name matching a certain pattern recursively in folders, subfolders, run the command:

```r
library(magrittr)
list.files(pattern = "<regular expression>",recursive = TRUE) %>% file.remove(.)
```
