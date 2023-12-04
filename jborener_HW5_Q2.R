load("D:/New Folder (2)/Rscripts/house_prices.rda")
library(tidyverse)
library(ggplot2)
library(lubridate)
library(ggrepel)
library(colorspace)
library(dplyr)

house_prices%>%gather(key=measure, value=value, -c(house_price_index, date, state))->house_reshaped

ggplot(house_reshaped, aes(x = date, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~ state, scales = "free_x") + 
  scale_x_continuous(breaks = ymd(c("1980-01-01", 
                                    "2000-01-01", "2020-01-01")), labels = c("80", "00", "20"))
