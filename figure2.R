datafn<-read.csv('data/figure2n.csv', header=TRUE)
names(datafn)

val1<-datafn[as.character(datafn$Release)==unique(as.character(datafn$Release))[1],]
val1$Avg

val2<-datafn[as.character(datafn$Release)==unique(as.character(datafn$Release))[2],]
val2$Avg
       
windows()
ggplot(datafn,aes(x = Product,y = Value)) + 
  geom_bar(aes(fill = Release),stat = "identity",position = "dodge") +
  geom_line() + 
  geom_hline(yintercept = val1$Avg[1], color="#CC6666", size=1) +
  geom_text(aes(0,val1$Avg[1],label = val1$Avg[1], hjust= -17, vjust = +1)) + 
  geom_hline(yintercept = val2$Avg[1], color="#9999CC", size=1) +
  geom_text(aes(0,val2$Avg[1],label = val2$Avg[1], hjust= -17, vjust = +1)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 60, hjust=1),
        axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        legend.position="top") + 
  labs(x='Products',y='Unit Testing Coverage')+
  scale_fill_manual('Releases', values=c("#CC6666", "#9999CC")) 