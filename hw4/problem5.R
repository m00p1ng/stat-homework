df <- read.csv("econ2558.csv", header=T, as.is=T)

northeast <- df[df[,"Region"] == "Northeast", ]
sortdata <- northeast[order(-northeast$NumVehicles),]

vehicles <- sortdata$NumVehicles
name <- sortdata$X...Province

library(plotly)

p <- plot_ly(
  x = name,
  y = vehicles,
  name = "Vehicles in Northeast",
  type = "bar",
  xaxis=name
)
p

# library(htmlwidgets)
# htmlwidgets::saveWidget(widget=p,"problem5.html", selfcontained = FALSE)
