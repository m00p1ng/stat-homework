df <- read.csv("econ2558.csv")

x <- c("Bangkok and suburb cities", "Central", "North", "Northeast", "South")
y <- c("Revenue", "Expense", "Debt", "NumVehicles")

group <- aggregate(df[, y], by=list(df$Region), FUN=sum, na.rm = TRUE)

vehicles <- group$NumVehicles
vehicles

p <- plot_ly(group, labels = ~x, values = ~vehicles, type = 'pie') %>%
  layout(title = "Vehicle 2558",
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p
# library(htmlwidgets)
# htmlwidgets::saveWidget(widget=p,"problem1.html", selfcontained = FALSE)

