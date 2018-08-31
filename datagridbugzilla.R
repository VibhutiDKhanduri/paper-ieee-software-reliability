datafn<-read.csv('data/datagridbugzilla.csv', header=TRUE)
names(datafn)
str(datafn)

datafn$Date<-as.Date(datafn$Date)

library(ggplot2)
library(scales)
p<-ggplot(data=datafn, aes(x=Date,y=Anomalies, color=factor(Category))) +
  geom_point(size=4) +
  geom_line(size=2) +
  labs(y='N. Anomalies',color='Category', x='Month') +
  scale_x_date(labels=date_format('%m-%Y'), date_breaks='1 month') +
  theme(legend.key = element_rect(fill = "white", colour = "white"),
        axis.text=element_text(size=12),
        axis.line = element_line(colour = "black"),
        legend.position="top",
        legend.text=element_text(size=12))
  
p