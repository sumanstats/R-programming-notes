### Why manipulate strings ?
**Two main possible reasons:**

+ So that we can easily work on texts (novels, press articles, reports, scientific articles, websites, tweets, facebook and so on), and can do 
text mining, machine learning on these data.
+ To clean / retrieve info "imprisoned" in strings ... 
  + For example, you have a sensor that creates files with the name 
"monsuperfichier_02032017_X330441.22_Y402933.54.txt" and you want Retrieve the date (02/03/2017) and the coordinates (X and Y) 
corresponding to each of these files. 
  + Or you have a table column containing information about the style 
"Bruce Wayne, Batman, masked judge" and you want to have this information separated into "Bruce Wayne", "Batman", and "masked judge" ...


In all these cases, knowing how to perform basic operations (detection of patterns, replacement of patterns, cutting of strings) 
will prove indispensable. 
The package stringr, in particular, is of invaluable help. 
The functions of this package are easily recognizable since all their names begin with "str_".

Here is a small "aide-mémoire" showing the usefulness of the important ones in `stringr` package.

![](http://perso.ens-lyon.fr/lise.vaudor/Rfigures/Manip_de_strings/stringr.png)

---
## Load `stringr` package

library(stringr)

### These are the functions in stringr package
---
**str_c ()** combines strings
``` 
library(stringr)
str_c("abra","ca","dabra")

 ## [1] "abracadabra"

str_c("Les jeux","de mots laids","sont pour","les gens bêtes", sep=" ")

 ## [1] "Les jeux de mots laids sont pour les gens bêtes"
```

---
**str_length ()** counts the number of characters in a string
```
str_length("anticonstitutionnellement")

## [1] 25
```

---
**str_sub ()** extracts the characters from the string, from the start location to the end location
```
str_sub("youpiyaya",start=1,end=5)

## [1] "youpi"

str_sub("youpiyaya",start=-4)

## [1] "yaya"

str_sub("youpiyaya",start=4)

## [1] "piyaya"

```

---
**str_split ()** breaks the strings wherever a pattern (or pattern) is present

```
str_split(c("beau_gros_chat",
            "joli_chien",
            "vilain_petit_canard"),
          "_")

## [[1]]
## [1] "beau" "gros" "chat"
## 
## [[2]]
## [1] "joli"  "chien"
## 
## [[3]]
## [1] "vilain" "petit"  "canard"

```

The pattern (here "_") can be present a variable number of times, so the output elements are not necessarily of the same size. That is why this function returns a list.

On the other hand, if we know that all the elements of the input will be cut into as many pieces, then we can ask for an output in the form of a matrix, more practical to manipulate later, using the argument `simplify=TRUE`.

```
str_split(c("beau_gros_chat",
            "joli_petit_chien",
            "vilain_petit_canard"),
          "_",
          simplify=TRUE)

##      [,1]     [,2]    [,3]    
## [1,] "beau"   "gros"  "chat"  
## [2,] "joli"   "petit" "chien" 
## [3,] "vilain" "petit" "canard"

```

---

**str_detect ()** detects a pattern

```
str_detect(c("Quarante","carottes","crues",
             "croient","que","croquer",
             "crée","des","crampes."),
           pattern="cr")

## [1] FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE
```

---
**str_count ()** counts the instances of a pattern

```
str_count(c("L'âne","Trotro","trotte","à une allure","traitreusement","tranquille"),
           pattern="tr")

## [1] 0 1 1 0 2 1
```

---

**str_subset ()** creates a subset of the vector where the pattern is present

```
str_subset(c("Quarante","carottes","crues",
             "croient","que","croquer",
             "crée","des","crampes."),
           pattern="cr")

## [1] "crues"    "croient"  "croquer"  "crée"     "crampes."
```

---

**str_extract ()** extracts the pattern (where it is present)

```
str_extract(c("L'âne","Trotro","trotte","à une allure","traitreusement","tranquille"),
           pattern="tr")

## [1] NA   "tr" "tr" NA   "tr" "tr"
```


*Note the difference between str_extract () and str_extract_all ():*

```
str_extract_all(c("L'âne","Trotro","trotte","à une allure","traitreusement","tranquille"),
           pattern="tr")

## [[1]]
## character(0)
## 
## [[2]]
## [1] "tr"
## 
## [[3]]
## [1] "tr"
## 
## [[4]]
## character(0)
## 
## [[5]]
## [1] "tr" "tr"
## 
## [[6]]
## [1] "tr"

```

If a pattern is present several times in one of the elements of the vector in input, then it will correspond to several elements in the output (thus the output corresponds not to a vector of the same size as the input but to a list) .

---
**str_replace ()** replaces the pattern with another pattern

```
str_replace("All we hear is Radio ga ga Radio goo goo Radio ga ga",
            pattern="goo",
            replacement="ga")

## [1] "All we hear is Radio ga ga Radio ga goo Radio ga ga"

str_replace_all("All we hear is Radio ga ga Radio goo goo Radio ga ga",
            pattern="goo",
            replacement="ga")

## [1] "All we hear is Radio ga ga Radio ga ga Radio ga ga"
```

*Again, notice the difference between str_replace () and str_replace_all () !!*
