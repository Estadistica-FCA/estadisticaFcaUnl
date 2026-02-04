library(estadisticaFcaUnl)
library(ggplot2)
library(dplyr)
data("energia_abejas")
ggplot(energia_abejas)+
  aes(y=Energia,x=Temp_ord)+
  geom_boxplot()
energia_abejas_mod <- energia_abejas %>% group_by(Temp_ord) %>% ajustar_variables(col="Energia",n_outliers = c(1,2,3)) %>% ungroup()

ggplot(energia_abejas_mod)+
  aes(y=Energia,x=Temp_ord)+
  geom_boxplot()
energia_abejas_grp <- energia_abejas_mod %>%
  filter(Temp_ord==20)
grDevices::boxplot.stats(energia_abejas_grp$Energia)$out

energia_abejas_grp <- energia_abejas_mod %>%
  filter(Temp_ord==30)
grDevices::boxplot.stats(energia_abejas_grp$Energia)$out

energia_abejas_grp <- energia_abejas_mod %>%
  filter(Temp_ord==40)
grDevices::boxplot.stats(energia_abejas_grp$Energia)$out

