datafn<-read.csv('data/figure2n.csv', header=TRUE)
names(datafn)

rel1<- as.character(datafn$Release)[1]
rel1
val1<-datafn[as.character(datafn$Release)==unique(as.character(datafn$Release))[1],]
val1$Avg

rel1avg<-paste(val1$Avg[1], '% INDIGO-1',sep='')

rel2<-as.character(datafn$Release)[2]
rel2
val2<-datafn[as.character(datafn$Release)==unique(as.character(datafn$Release))[2],]
val2$Avg

rel2avg<-paste(val2$Avg[1], '% INDIGO-2',sep='')

Avg<-c(rel1,rel2)   
library(ggplot2)

ggplot(datafn, aes(fill=Release , x=Product, y=Value)) +
  geom_bar(stat="identity", position="dodge",  size=1, width=0.5) +
  xlab("Products") +
  ylab("Unit Test Coverage %") +
  scale_y_continuous(limits = c(0,100),
                     expand=c(0,1))+
  geom_hline(aes(yintercept=val1$Avg[1],  
                 linetype='MidnightBlue'),
                 colour='darkred',
                 size=1, alpha=1) +
  geom_hline(aes(yintercept=val2$Avg[1],  
                 linetype='ElectricIndigo'), 
                 colour='blue',
                 size=1, alpha=1)  +
  scale_fill_manual(name='Releases', values=c("blue", "burlywood1"),
                    breaks = c(rel1,
                               rel2)) +
  scale_linetype_manual(name="Avg", 
                     values=c(2, 2),
                     guide = guide_legend(override.aes = 
                                            list(color = c("burlywood1", 
                                                           "blue"))),
                     labels = c(rel1avg,
                                rel2avg)) +
  coord_flip()+
  theme(legend.key = element_rect(fill = "white", colour = "white"),
        axis.text=element_text(size=14),
        axis.title=element_text(size=14),
        #axis.text.x = element_text(angle = 60, hjust=1),
        axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        legend.position="top",
        legend.text=element_text(size=12))

