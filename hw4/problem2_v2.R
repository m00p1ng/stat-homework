df <- read.csv("revenue_50_58.csv")

x <- c("Central", "North", "Northeast", "South")
y <- c("X2550", "X2552", "X2554", "X2556", "X2558")


library(plotly)

central <- df[df[,"Region"] == "Central", ]
north <- df[df[,"Region"] == "North", ]
northeast <- df[df[,"Region"] == "Northeast", ]
south <- df[df[,"Region"] == "South", ]

mean_revenue <- as.numeric(colMeans(df[c(-1, -2)], na.rm = TRUE))

plot_ly(x = ~c(0.75), y=c(-2,2), type='scatter', mode='lines') %>% 
  add_boxplot(x = ~rnorm(50), inherit = F)

plot_ly(y = c(mean_revenue[1]), x=c(-1, 4), type='scatter', mode='lines', name="Mean") %>% 
  add_boxplot(y = central$X2550, name=x[1], inherit = F) %>%
  add_boxplot(y = north$X2550, name=x[2], inherit = F) %>%
  add_boxplot(y = northeast$X2550, name=x[3], inherit = F) %>%
  add_boxplot(y = south$X2550, name=x[4], inherit = F) %>%
  layout(title = "Revenue at X2550" )

plot_ly(y = c(mean_revenue[1]), x=c(-1, 4), type='scatter', mode='lines', name="Mean") %>% 
  add_boxplot(y = central$X2552, name=x[1], inherit = F) %>%
  add_boxplot(y = north$X2552, name=x[2], inherit = F) %>%
  add_boxplot(y = northeast$X2552, name=x[3], inherit = F) %>%
  add_boxplot(y = south$X2552, name=x[4], inherit = F) %>%
  layout(title = "Revenue at X2552")

plot_ly(y = c(mean_revenue[1]), x=c(-1, 4), type='scatter', mode='lines', name="Mean") %>% 
  add_boxplot(y = central$X2554, name=x[1], inherit = F) %>%
  add_boxplot(y = north$X2554, name=x[2], inherit = F) %>%
  add_boxplot(y = northeast$X2554, name=x[3], inherit = F) %>%
  add_boxplot(y = south$X2554, name=x[4], inherit = F) %>%
  layout(title = "Revenue at X2554")

plot_ly(y = c(mean_revenue[1]), x=c(-1, 4), type='scatter', mode='lines', name="Mean") %>% 
  add_boxplot(y = central$X2556, name=x[1], inherit = F) %>%
  add_boxplot(y = north$X2556, name=x[2], inherit = F) %>%
  add_boxplot(y = northeast$X2556, name=x[3], inherit = F) %>%
  add_boxplot(y = south$X2556, name=x[4], inherit = F) %>%
  layout(title = "Revenue at X2556")

plot_ly(y = c(mean_revenue[1]), x=c(-1, 4), type='scatter', mode='lines', name="Mean") %>% 
  add_boxplot(y = central$X2558, name=x[1], inherit = F) %>%
  add_boxplot(y = north$X2558, name=x[2], inherit = F) %>%
  add_boxplot(y = northeast$X2558, name=x[3], inherit = F) %>%
  add_boxplot(y = south$X2558, name=x[4], inherit = F) %>%
  layout(title = "Revenue at X2558")


# library(htmlwidgets)
# htmlwidgets::saveWidget(widget=p,"problem1.html", selfcontained = FALSE)

