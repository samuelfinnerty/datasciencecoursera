# libraries

library(tidyverse)

outcome <- data.table::fread('outcome-of-care-measures.csv')



outcome <- read.csv("outcome-of-care-measures.csv")

outcome <- outcome %>%
  rename(state = State)

table_cor_entgroups_mes_t1 <- table_cor_entgroups_mes_t1 %>%
  rename( MES = m_sum_t1) %>%
  



###############################################################################