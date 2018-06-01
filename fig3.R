datafn<-read.csv('data/figure3.csv', header=TRUE)
names(datafn)
str(datafn)

i1<-datafn[datafn$Release=='INDIGO-1',]
lm_fit1 <- lm(Number~Week, data=i1)
summary(lm_fit1)

predicted_df1 <- data.frame(number_pred = predict(lm_fit1, i1))
predicted_df1

i2<-datafn[datafn$Release=='INDIGO-2',]
lm_fit2 <- lm(Number~Week, data=i2)
summary(lm_fit2)

predicted_df2 <- data.frame(number_pred = predict(lm_fit2, i2))
predicted_df2

predicted_df <- rbind(predicted_df1, predicted_df2)
datafn$Lm <-rbind(predicted_df1, predicted_df2)

names(datafn)
str(datafn)

library(ggplot2)

ggplot(datafn, aes(x=Week, y=Number)) +
  geom_point(data=datafn[datafn$Release=='INDIGO-1',],
             aes(x=Week, y=Number, color='MidnightBlue'), 
             size=5) +
  geom_point(data=datafn[datafn$Release=='INDIGO-2',],
             aes(x=Week, y=Number, color='ElectricIndigo'), 
             size=5) +
  geom_line(data=datafn[datafn$Release=='INDIGO-1',],
            aes(x=Week, y=Lm, color='MidnightBlue'), 
            size=2) +
  geom_line(data=datafn[datafn$Release=='INDIGO-2',],
            aes(x=Week, y=Lm, color='ElectricIndigo'), 
            size=2) +
  xlab("Weeks") +
  ylab("Number of Software Products") +
  scale_y_continuous(limits = c(0, 25)) +
  scale_x_continuous(limits = c(0, 34), 
                     breaks=c(0, 5, 10, 15, 20, 25, 30)) +
  scale_colour_manual(name='Releases', values=c(MidnightBlue="darkblue",
                                                ElectricIndigo="burlywood3"),
                      breaks=c('MidnightBlue',
                               'ElectricIndigo')) +
  geom_vline(aes(xintercept=8),
             colour='darkblue',
             size=1, alpha=1) +
  geom_vline(aes(xintercept=28), 
             colour='burlywood3',
             size=1, alpha=1)  +
  theme(legend.key = element_rect(fill = "white", colour = "white"),
        axis.text=element_text(size=16),
        axis.title=element_text(size=16),
        axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        legend.position = c(.5, .9),
        legend.direction="vertical",
        legend.title = element_text(size=18),
        legend.text=element_text(size=16))
