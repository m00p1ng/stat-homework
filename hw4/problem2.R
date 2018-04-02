df <- read.csv("revenue_50_58.csv")

x <- c("Central", "North", "Northeast", "South", "MEAN")
y <- c("X2550", "X2552", "X2554", "X2556", "X2558")

group <- aggregate(df[, y], by=list(df$Region), FUN=mean, na.rm = TRUE)


library(plotly)


group <- group[-1,-1]
group


central <- as.numeric(group[1, ])
north <- as.numeric(group[2, ])
northeast <- as.numeric(group[3, ])
south <- as.numeric(group[4, ])

mean_revenue <- as.numeric(colMeans(df[c(-1, -2)], na.rm = TRUE))
mean_revenue

p <- plot_ly(group, x = ~y, y = ~central, type = 'bar', name=x[1]) %>%
  add_trace(y = ~north, type="bar", name=x[2]) %>%
  add_trace(y = ~northeast, type="bar", name=x[3]) %>%
  add_trace(y = ~south, type='bar', name=x[4]) %>%
  add_trace(y = ~mean_revenue, type='bar', name=x[5]) %>%
  layout(xaxis = list(title = ""),
         yaxis = list(title = ""),
         barmode = 'group')
p

# library(htmlwidgets)
# htmlwidgets::saveWidget(widget=p,"problem1.html", selfcontained = FALSE)

