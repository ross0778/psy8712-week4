# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl <- read_delim("../data/week4.dat", delim="-", col_names=c("casenum", "parnum", "stimver", "datadate", "qs"))
glimpse(import_tbl)
wide_tbl<- import_tbl %>% separate(qs, into=c("q1", "q2", "q3", "q4", "q5"), sep="-")
wide_tbl[c("q1", "q2", "q3", "q4", "q5")]<- sapply(wide_tbl[c("q1", "q2", "q3", "q4", "q5")], as.integer)
wide_tbl$datadate<- mdy_hms(wide_tbl$datadate)
wide_tbl <- wide_tbl %>% mutate(q1 = na_if(q1, 0L), q2 = na_if(q2, 0L), q3 = na_if(q3, 0L), q4 = na_if(q4, 0L), q5 = na_if(q5, 0L))
