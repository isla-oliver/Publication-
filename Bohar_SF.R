#L.bohar

library(ggplot2)
library(tidyr)
library(tidyverse)
library(ggpubr)
library(dplyr)

boh <- read.csv("Bohar_Fork.csv", header = T, stringsAsFactors = T)
boh$Location <- as.factor(boh$Location)

fig1b=ggplot(boh%>%filter(Location=='SR'))+
  geom_histogram(col = 'black', aes(x=Length, fill = Class), binwidth = 65)+
  ylim(0,35)+xlim(50,900)+
  theme_classic()+theme(axis.title.y = element_blank())+
  ggtitle(expression(italic('Scott Reefs')))+xlab('Fork Length (mm)')
fig1b
ggplot_build(fig1b)$data[[1]]
a <-fig1b + annotate("text", x= 195, y=6, label ="4")
b <-a + annotate("text", x= 260, y=11, label ="9")
c <-b + annotate("text", x= 325, y=15, label ="13")
d <- c + annotate("text", x= 390, y=10, label ="8")
e <- d + annotate("text", x= 455, y=16, label ="14")
f <-e + annotate("text", x= 520, y=14, label ="12")
g <-f + annotate("text", x= 585, y=24, label ="22")
h <-g + annotate("text", x= 650, y=14, label ="12")
i <-h + annotate("text", x= 130, y=3, label ="1")
SRfinal <-i + annotate("text", x= 700, y=30, label ="N(Adult) = 39")
SRfinal


fig3b=ggplot(boh%>%filter(Location=='Chagos '))+
  geom_histogram(col='black', aes(x=Length, fill = Class), binwidth = 65)+
  ylim(0,35)+xlim(100,900)+
  theme_classic()+theme(axis.title.y = element_blank())+
  ggtitle(expression(italic('Chagos')))+xlab('Fork Length (mm)')
fig3b

b <-fig3b + annotate("text", x= 260, y=3, label ="1")
c <-b + annotate("text", x= 325, y=3, label ="1")
d <- c + annotate("text", x= 390, y=13, label ="11")
e <- d + annotate("text", x= 455, y=16, label ="14")
f <-e + annotate("text", x= 520, y=19, label ="17")
g <- f + annotate("text", x= 585, y=16, label ="14")
h <- g + annotate("text", x= 650, y=8, label ="6")
i <- h + annotate("text", x= 715, y=5 label ="3")
Chagosfinal <-i +annotate("text", x=700, y=30, label ="N(Adult) = 60")
Chagosfinal
ggplot_build(fig3b)$data[[1]]



fig2=ggarrange(fig1b,fig3b, nrow=1,ncol=2, common.legend = T, 
               hjust = -.5, vjust=.8, font.label = list(face='plain', size=10))
fig2