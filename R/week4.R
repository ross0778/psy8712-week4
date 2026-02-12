# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl <- read_delim("../data/week4.dat", delim="-", col_names=c("casenum", "parnum", "stimver", "datadate", "qs"))
glimpse(import_tbl)
wide_tbl<- separate(import_tbl, qs, into=c("q1", "q2", "q3", "q4", "q5"), sep="-")
wide_tbl[c("q1", "q2", "q3", "q4", "q5")]<- sapply(wide_tbl[c("q1", "q2", "q3", "q4", "q5")], as.integer)
wide_tbl$datadate<- mdy_hms(wide_tbl$datadate)
wide_tbl <- mutate(wide_tbl, q1 = na_if(q1, 0L), q2 = na_if(q2, 0L), q3 = na_if(q3, 0L), q4 = na_if(q4, 0L), q5 = na_if(q5, 0L))
wide_tbl<- drop_na(wide_tbl, q2)
long_tbl<- pivot_longer(wide_tbl, cols=q1:q5, names_to="q", values_to="response")