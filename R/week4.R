# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl <- read_delim("../data/week4.dat", delim="-", col_names=c("casenum", "parnum", "stimver", "datadate", "q1", "q2", "q3", "q4", "qs"))
