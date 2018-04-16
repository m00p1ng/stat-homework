df <- read.csv('autoprice.csv')

length <- df$length
width <- df$width
height <- df$height
weight <- df$weight
engine_size <- df$engine.size
price <- df$price

model <- lm(price ~ length + width + height + weight + engine_size)
summary(model)
cor(df)


model2 <- lm(log(price) ~ length + width + height + weight + engine_size)
summary(model2)
