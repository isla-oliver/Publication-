#C.sordidus

sord <- read.csv("Sordidus_Fork.csv", header = T, stringsAsFactors = T)

sord$Location <- as.factor(sord$Location)
Location<-unique(sord$Location)[1]

fig1d=ggplot(sord%>%filter(Location=='SR'))+
  geom_histogram(col='black', fill = "#C71000B2", aes(x=Length), binwidth = 28)+
  ylim(0,70)+xlim(50,400)+
  theme_classic()+theme(axis.title.y = element_blank())+
  xlab('Fork Length (mm)')+ ggtitle("Scott Reefs") + theme(plot.title = element_text(vjust = -10))+ 
  theme(plot.title = element_text(hjust = 0.1))
fig1d
ggplot_build(fig1d)$data[[1]]
a <-fig1d + annotate("text", x= 170, y=5, label ="1")
b <-a + annotate("text", x= 195, y=22, label ="18")
c <-b+ annotate("text", x= 225, y=31, label ="27")
d <-c + annotate("text", x= 255, y=6, label ="2")
SRfinal <-d + annotate("text", x= 300, y=70, label ="N(Adult) = 48")
SRfinal

fig3d=ggplot(sord%>%filter(Location=='Chagos '))+
  geom_histogram(col='black', fill = "#FF6F00B2", aes(x=Length), binwidth = 28)+
  ylim(0,70)+xlim(50,400)+
  theme_classic()+theme(axis.title.y = element_blank())+
  xlab('Fork Length (mm)')+ggtitle("Chagos") + theme(plot.title = element_text(vjust = -10))+ 
  theme(plot.title = element_text(hjust = 0.1))
fig3d
ggplot_build(fig3d)$data[[1]]
a <-fig3d + annotate("text", x= 135, y=6, label ="2")
b <-a + annotate("text", x= 170, y=15, label ="11")
c <-b + annotate("text", x= 195, y=50, label ="46")
d <-c + annotate("text", x= 225, y=59, label ="55")
e <-d + annotate("text", x= 255, y=25, label ="21")
f <-e + annotate("text", x= 280, y=16, label ="12")
g <-f + annotate("text", x= 310, y=10, label ="6")
Chagosfinal <-g + annotate("text", x= 300, y=70, label ="N(Adult) = 152")
Chagosfinal

fig4=ggarrange(fig3d, fig1d, nrow=1,ncol=2, common.legend = T, 
               hjust = -.5, vjust=.8, font.label = list(face='plain', size=10))
fig4

fig4N <- annotate_figure(fig4, 
                fig.lab = "C. sordidus", fig.lab.face = "italic", fig.lab.size = 16)
fig4N

