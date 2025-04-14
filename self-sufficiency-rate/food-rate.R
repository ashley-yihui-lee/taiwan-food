library(tidyverse)
library(data.table)
library(ggplot2)
library(showtext)

setwd('~/desktop/taiwan-food/self-sufficiency-rate')

# Load data
df <- read.csv("self-sufficiency-rate.csv")
df$Year <- as.factor(df$Year)

# Add Montserrat Bold font
font_add(family = "MontserratBold", regular = "Montserrat-Bold.ttf")
showtext_auto()

# Plot
ggplot(data = df, aes(x = Year, y = Food.Self.sufficiency.Rate)) +
  geom_line(aes(group = 1), color = "#6a7a1e", size = 1) +
  geom_point(color = "#6a7a1e", size = 2) +
  scale_y_continuous(
    limits = c(1, 100),
    breaks = c(0, 10, 20, 30, 40, 50, 100),
    labels = function(x) paste0(x, "%")
  ) +
  labs(
    x = "Year",
    y = "Food Self-sufficiency Rate (%)"
  ) +
  theme_minimal() +
  theme(
    axis.title.x = element_text(color = "#6a7a1e", family = "MontserratBold", size = 50),
    axis.title.y = element_text(color = "#6a7a1e", family = "MontserratBold", size = 50),
    axis.text.x = element_text(size = 40, family = "MontserratBold"),
    axis.text.y = element_text(size = 40, family = "MontserratBold"),
    panel.grid.minor = element_blank()
  )

# Save plot
ggsave("food-rate-vertical.png", width = 10, height = 8, dpi = 300)
