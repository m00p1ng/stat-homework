df <- read.csv("revenue_50_58.csv")

x <- c("Bangkok and suburb cities", "Central", "North", "Northeast", "South")
y <- c("X2550", "X2552", "X2554", "X2556", "X2558")

group <- aggregate(df[, y], by=list(df$Region), FUN=mean, na.rm = TRUE)
group

library(plotly)

group <- group[-1]
bangkok <- as.numeric(group[1, ])
central <- as.numeric(group[2, ])
north <- as.numeric(group[3, ])
northeast <- as.numeric(group[4, ])
south <- as.numeric(group[5, ])


p1 <- plot_ly(group, x = ~y, y = ~bangkok) %>%
  add_lines(name = ~"Bangkok and suburb cities")
p2 <- plot_ly(group, x = ~y, y = ~central) %>%
  add_lines(name = ~"Central")
p3 <- plot_ly(group, x = ~y, y = ~north) %>%
  add_lines(name = ~"North")
p4 <- plot_ly(group, x = ~y, y = ~northeast) %>%
  add_lines(name = ~"Northeast")
p5 <- plot_ly(group, x = ~y, y = ~south) %>%
  add_lines(name = ~"South")
p <- subplot(p1, p2, p3, p4, p5, nrows = 5, shareX = TRUE)
p

# library(htmlwidgets)
# htmlwidgets::saveWidget(widget=p,"problem1.html", selfcontained = FALSE)

