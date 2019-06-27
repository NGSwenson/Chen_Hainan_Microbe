#R code to read  in combined sample  data from 3 forest types
#26 June 2019
#Chen & Swenson Hainan Soil Project

setwd("E:/陈洁/微生物分析培训/【美格基因】生信培训U盘资料包-201811/实际操作与测试数据/R语言培训资料/test_data")

F_otu = read.table(file="fungal group.txt", sep = "\t", header = F, row.names=1) 
colnames(F_otu)=c("A","B","C")

my.sample  = t(F_otu)
