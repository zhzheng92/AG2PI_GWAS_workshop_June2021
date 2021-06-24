setwd("~/AG2PI_GWAS_workshop_June2021/data/")

# install sources of GAPIT
source("http://zzlab.net/GAPIT/GAPIT.library.R")
source("http://zzlab.net/GAPIT/gapit_functions.txt")

# install GAPIT from Github
install.packages("devtools")
devtools::install_github("jiabowang/GAPIT3",force=TRUE)
library(GAPIT3)

# load phenotype and genotype data
myY <- read.table("./mdp_traits.txt", head = TRUE)
myGD=read.table(file="./mdp_numeric.txt",head=T)
myGM=read.table(file="./",head=T)

# run GWAS with MLM
myGAPIT_MLM <- GAPIT(
  Y=myY[,c(1,3)],
  GD=myGD,
  GM=myGM,
  PCA.total=3,
  model = "MLM")
