
library(pacman)
pacman::p_load(data.table,ggplot2,gapminder,hrbrthemes, gganimate, scales)

input <- "https://raw.githubusercontent.com/Rdatatable/data.table/master/vignettes/flights14.csv"
data <- fread(input)

head(data)

p <- ggplot(data=gapminder, aes(x=gdpPercap,y=lifeExp,size=pop,col=continent))
p

p2 <- p +
  geom_point(aes(size=pop,col=continent),alpha=0.3)
  scale_color_brewer(name="Continent", palette="Set1")
  scale_size(name="Population", labels=scales::comma)
  scale_x_log10(labels = scales::dollar)
  theme_minimal()
  
p2 +
  theme_modern_rc() +
  geom_point(aes(size=pop,col=continent),alpha=0.2)


ggplot(data=gapminder, aes(gdpPercap,lifeExp,size=pop,colour=continent))+
  geom_point(alpha=0.7, show.legend = FALSE) +
  scale_color_manual(values=country_colors) +
  scale_size(range=c(2,12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  labs(title='Year: {frame_time}', x='GDP per capita', y='life expectancy') +
  transition_time(year) +
  ease_aes('linear')
