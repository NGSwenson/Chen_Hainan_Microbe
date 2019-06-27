#R code for randomizing soil community data using independent swap and then calculating bray-curtis beta diversity
#26 June 2019
#Chen & Swenson Hainan soil project

library(vegan)
library(abind)

#making a function that does an independent swap null model and calculates bray-curtis beta
bray.is.rand <- function(x){
	as.matrix(vegdist(randomizeMatrix(x, null.model = "independentswap"), method="bray"))
	}

#randomizing data 999 times and calculating bray-curtis
nulls <- replicate(999, bray.is.rand(my.sample))

#looking at the null distribution for one community comparison
hist(nulls[1, 2, ])

#mean value of null distribution for each community comparison
nulls.means <- apply(nulls, c(1:2), mean, na.rm = T)

#st dev value of null distribution for each community comparison
nulls.sds <- apply(nulls, c(1:2), sd, na.rm = T)

#calculating the observed bray-curtis distances
obs <- as.matrix(vegdist(my.sample, method="bray"))

#calculating the standardized effect sizes
ses <- (obs - nulls.means) / nulls.sds

#combining the observed matrix and null array
obs.nulls = abind(obs,nulls)

#calculating the rank of each cell in each layer of the new array called obs.nulls
rank.out <- array(dim=dim(obs.nulls), t(apply(apply(obs.nulls,c(1,2),rank),3,t)))


#get the rank of the observed comparisons in null distribution
rank.out[,,1]