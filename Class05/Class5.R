#' ---
#' title: "Class 5 Data Visualization Lab"
#' author: "David Majeed PID:A17885958"
#' date: "April 15, 2026"
#' ---



# Class 5 Data Visualization Lab
library(ggplot2)
#View(cars)
plot(cars)
ggplot(data=cars)+ 
  aes(x=speed, y=dist) +
  geom_point()
p <- ggplot(data=cars)+ 
  aes(x=speed, y=dist) +
  geom_point()
#Add a line geom with geom_line()
p+geom_line()

#Add a trend line close to the data
p+geom_smooth()

p+geom_smooth(method="lm")

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim (url)
head(genes)

#Let's make a first plot attempt
g <- ggplot(data=genes)+
  aes(x=Condition1, y=Condition2, col=State)+
  geom_point()

g

#How many genes in the data set?
nrow(genes)
colnames(genes)
ncol(genes)
#How many up regulated genes?
table(genes$State)
#Fraction of total genes are upregulated
round((table(genes$State)/nrow(genes))*100, 2)
#add color
g+ scale_color_manual(values=c("blue", "gray", "red")) +
  labs(title="Gene expresion changes", x="Control(no drug)", y="Drug Treatment")+
  theme_bw()
  
#install.packages("gapminder")
library(gapminder)
#install.packages("dplyr")
library(dplyr)


gapminder_2007 <- gapminder %>% filter(year==2007)

ggplot(gapminder_2007)+
  aes(x=gdpPercap, y=lifeExp,color=continent, size=pop)+
  geom_point(alpha=0.5)

ggplot(gapminder_2007) + 
  geom_point(aes(x = gdpPercap, y = lifeExp,
                 size = pop), alpha=0.5) + 
  scale_size_area(max_size = 10)

gapminder_1957<- gapminder %>% filter(year==1957)
ggplot(gapminder_1957)+
aes(x=gdpPercap, y=lifeExp,color=continent, size=pop)+
geom_point(alpha=0.7) +scale_size_area(max_size = 15)+facet_wrap(~year)

gapminder_top5 <- gapminder %>% 
  filter(year==2007) %>% 
  arrange(desc(pop)) %>% 
  top_n(5, pop)

gapminder_top5
ggplot(gapminder_top5) + 
  geom_col(aes(x = country, y = pop))

ggplot(gapminder_top5) + 
  geom_col(aes(x = country, y = pop, fill = continent))

ggplot(gapminder_top5) + 
  geom_col(aes(x = country, y = pop, fill = lifeExp))

ggplot(gapminder_top5) + 
  geom_col(aes(x = country, y = pop, fill = gdpPercap))
ggplot(gapminder_top5) +
  aes(x=reorder(country, -pop), y=pop, fill=gdpPercap) +
  geom_col()           
ggplot(gapminder_top5) +
  aes(x=reorder(country, -pop), y=pop, fill=country) +
  geom_col(col="gray30") +
  guides(fill="none")           

head(USArrests)
USArrests$State <- rownames(USArrests)
ggplot(USArrests) +
  aes(x=reorder(State,Murder), y=Murder) +
  geom_col() +
  coord_flip()
ggplot(USArrests) +
  aes(x=reorder(State,Murder), y=Murder) +
  geom_point() +
  geom_segment(aes(x=State, 
                   xend=State, 
                   y=0, 
                   yend=Murder), color="blue") +
  coord_flip()
#install.packages("gifski")
#install.packages("gganimate")
library(gapminder)
library(gganimate)

ggplot(gapminder, aes(gdpPercap, lifeExp, size=pop, color=country))+
  geom_point(alpha=0.7, show.legend = FALSE) +
  scale_color_manual(values = country_colors) +
  scale_size(range = c(2,12))+
  scale_x_log10()+
  facet_wrap(~continent)+
labs(title='Year: {frame_time}', x='GDP per cpaita', y='life expectancy')+
  transition_time(year)+
  shadow_wake(wake_length = 0.1, alpha = FALSE)

#install.packages("patchwork")
library(patchwork)
p1<- ggplot(mtcars)+geom_point(aes(mpg, disp))
p2<- ggplot(mtcars)+ geom_boxplot(aes(gear, disp, group = gear))
p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))
p4 <- ggplot(mtcars) + geom_bar(aes(carb))
(p1 | p2 | p3)/ p4

sessionInfo()
