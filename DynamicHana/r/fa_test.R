library(dplyr)
library(reshape2)
library(caret)

main_data<-read.csv('e:rtest/main.csv')
pivot_data <- dcast(main_data, MEMBER_NO ~ CATEGORY, value.var = "SUB_TOTAL" ,sum)

member_no <- pivot_data[,1]
pivot_data<- pivot_data[,-1]

model_minmax<-preProcess(pivot_data, method="range")
scaling_data<-predict(model_minmax, pivot_data)


plot(prcomp(scaling_data), type="l", sub = "Scree Plot") #변수 5개 축약

secu_factanal <- factanal(scaling_data, factors = 5, rotation = "varimax", scores="regression")
print(secu_factanal$loadings, cutoff=0)
