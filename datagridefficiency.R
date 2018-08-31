datafn<-read.csv('data/datagridefficiency.csv', header=TRUE)
names(datafn)
str(datafn)

datafn$Date<-as.Date(datafn$Date)

library(ggplot2)
p<-ggplot(data=datafn, aes(x=Date,y=Efficiency/100, color=factor(Experiment))) +
  geom_point(size=4) +
  scale_y_continuous(limits=c(0,1),labels=scales::percent) +
  labs(y='Efficiency %',color='Experiment') +
  theme(legend.key = element_rect(fill = "white", colour = "white"),
        axis.text=element_text(size=12),
        axis.line = element_line(colour = "black"),
        legend.position="top",
        legend.text=element_text(size=12))
  
p