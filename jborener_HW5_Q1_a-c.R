load("D:/New Folder (2)/Rscripts/house_prices.rda")
library(tidyverse)
library(ggplot2)
library(lubridate)
library(ggrepel)
library(colorspace)
library(dplyr)

ggplot(house_prices, aes(x = date, y = house_price_index)) +
  geom_line() +
  facet_wrap(~ state, scales = "free_y") +
  scale_x_continuous(breaks = c(1980, 2000, 2020), labels = c("'80", "'00", "'20"))

house_reshaped <- house_prices %>%
  gather(key = "measure", value = "value", house_price_index:unemploy_perc, -date, -house_price_perc, -state)

ggplot(house_reshaped, aes(x = date, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~ state, scales = "free_y") +
  scale_x_continuous(breaks = c(1980, 2000, 2020), labels = c("'80", "'00", "'20"))
# It hard to see the difference in the unemploy_perc as on average it has a vastly lower value then House_price_index.
#The graph would be better split in to two separate facet wraps.
#also because of the date column format the breaks and labels don't properly show, this could use some work as well.
