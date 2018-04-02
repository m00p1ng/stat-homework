df <- read.csv("econ2558.csv")

df <- df[df$NumVehicles > quantile(df$NumVehicles, .25) - 1.5*IQR(df$NumVehicles) & df$NumVehicles < quantile(df$NumVehicles, .75) + 1.5*IQR(df$NumVehicles),]
df <- df[df$Revenue > quantile(df$Revenue, .25) - 1.5*IQR(df$Revenue) & df$Revenue < quantile(df$Revenue, .75) + 1.5*IQR(df$Revenue),]
df <- df[df$Expense > quantile(df$Expense, .25) - 1.5*IQR(df$Expense) & df$Expense < quantile(df$Expense, .75) + 1.5*IQR(df$Expense),]
df <- df[df$Debt > quantile(df$Debt, .25) - 1.5*IQR(df$Debt) & df$Debt < quantile(df$Debt, .75) + 1.5*IQR(df$Debt),]

revenue <- df$Revenue
expense <- df$Expense
debt <- df$Debt
vehicle <- df$NumVehicles

library(plotly)


lr1 <- lm(revenue ~ vehicle)
p1 <- plot_ly(data = df, type = 'scatter', mode="markers", x = ~vehicle, y = ~revenue, name="revenue") %>%
  add_trace(data = df, x = ~vehicle, y = fitted(lr1), mode="lines")
p1


lr2 <- lm(expense ~ vehicle)
p2 <- plot_ly(data = df, type = 'scatter', mode="markers", x = ~vehicle, y = ~expense, name="expense") %>%
  add_trace(data = df, x = ~vehicle, y = fitted(lr2), mode="lines")
p2


lr3 <- lm(debt ~ vehicle)
p3 <- plot_ly(data = df, type = 'scatter', mode="markers", x = ~vehicle, y = ~debt, name="debt") %>%
  add_trace(data = df, x = ~vehicle, y = fitted(lr3), mode="lines")
p3

p <- subplot(p1, p2, p3, nrows=3, shareX=T)
p

# library(htmlwidgets)
# htmlwidgets::saveWidget(widget=p,"problem6.html", selfcontained = FALSE)
