#L.gibbus

library(ggplot2)
library(tidyr)
library(tidyverse)
library(ggpubr)
library(dplyr)

gib <- read.csv("Gibbus_Fork.csv", header = T, stringsAsFactors = T)

gib$Location <- as.factor(gib$Location)
Location<-unique(gib$Location)[1]

fig1c=ggplot(gib%>%filter(Location=='SR '))+
  geom_histogram(col='black', aes(x=Length, fill = Class), binwidth = 31)+
  ylim(0,50)+xlim(100,500)+
  theme_classic()+theme(axis.title.y = element_blank())+
  ggtitle(expression(italic('Scott Reefs')))+xlab('Fork Length (mm)')
fig1c
a <-fig1c + annotate("text", x= 186, y=3, label ="1")
b <-a +annotate("text", x=217, y=9, label = "7")
c <-b +annotate("text", x=248, y=41, label = "39")
d <-c +annotate("text", x=279, y=18, label = "16")
e <-d + annotate("text", x= 310, y=28, label ="26")
f <-e + annotate("text", x= 341, y=8, label ="6")
g <-f + annotate("text", x= 372, y=3, label ="1")
SRfinal <-g + annotate("text", x= 430, y=40, label ="N(Adult) = 96")
SRfinal
ggplot_build(fig1c)$data[[1]]


fig3c=ggplot(gib%>%filter(Location=='Chagos '))+
  geom_histogram(col='black', aes(x=Length, fill = Class), binwidth = 31)+
  ylim(0,40)+xlim(100,500)+
  theme_classic()+theme(axis.title.y = element_blank())+
  ggtitle(expression(italic('Chagos')))+xlab('Fork Length (mm)')
fig3c
a <-fig3c + annotate("text", x= 217, y=3, label ="1")
b <-a + annotate("text", x= 248, y=17, label ="15")
c <-b + annotate("text", x= 279, y=24, label ="22")
d <-c + annotate("text", x= 310, y=13, label ="11")
e <-d + annotate("text", x= 341, y=3, label ="1")
f <-e + annotate("text", x= 372, y=3, label ="1")
Chagosfinal <-f +annotate("text", x=450, y=40, label = "N(Adult) = 51")
Chagosfinal
ggplot_build(fig3c)$data[[1]]

fig4c=ggplot(gib%>%filter(Location=='Maldives '))+
  geom_histogram(col='black', aes(x=Length, fill = Class), binwidth = 31)+
  ylim(0,40)+xlim(100,500)+
  theme_classic()+theme(axis.title.y = element_blank())+
  ggtitle(expression(italic('Maldives')))+xlab('Fork Length (mm)')
fig4c
a <-fig4c + annotate("text", x= 186, y=6, label ="4")
b <-a + annotate("text", x= 217, y=11, label ="9")
c <-b + annotate("text", x= 248, y=19, label ="17")
d <- c + annotate("text", x= 279, y=12, label ="10")
e <-d + annotate("text", x= 310, y=5, label ="3")
f <-e + annotate("text", x= 341, y=3, label ="1")
Maldivesfinal <-f +annotate("text", x=450, y=40, label = "N(Adult) = 42")
Maldivesfinal
ggplot_build(fig4c)$data[[1]]


fig3=ggarrange(fig4c,fig3c,fig1c, nrow=2,ncol=2, common.legend = T, 
               hjust = -.5, vjust=.8, font.label = list(face='plain', size=10))
fig3
