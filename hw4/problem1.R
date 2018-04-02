df <- read.csv("revenue_50_58.csv")

x <- c("Bangkok and suburb cities", "Central", "North", "Northeast", "South")
y <- c("X2550", "X2552", "X2554", "X2556", "X2558")

group <- aggregate(df[, y], by=list(df$Region), FUN=mean, na.rm = TRUE)

library(plotly)

X2550 <- as.numeric(group[, 2])
X2552 <- as.numeric(group[, 3])
X2554 <- as.numeric(group[, 4])
X2556 <- as.numeric(group[, 5])
X2558 <- as.numeric(group[, 5])


p <- plot_ly(group[-1], x = ~x, y = ~X2550, type = 'bar', name=y[1]) %>%
  add_trace(y = ~X2552, type="bar", name=y[2]) %>%
  add_trace(y = ~X2554, type="bar", name=y[3]) %>%
  add_trace(y = ~X2556, type="bar", name=y[4]) %>%
  add_trace(y = ~X2558, type='bar', name=y[5]) %>%
  layout(xaxis = list(title = ""),
         yaxis = list(title = ""),
         barmode = 'group')
p

# library(htmlwidgets)
# htmlwidgets::saveWidget(widget=p,"problem1.html", selfcontained = FALSE)

