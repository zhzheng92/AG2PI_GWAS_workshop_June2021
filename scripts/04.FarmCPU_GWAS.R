setwd("~/AG2PI_GWAS_workshop/FarmCPU_data/")

# required R packages
packages <- c("Rcpp", "RcppEigen", "RcppParallel", "parallel", "doParallel", 
              "foreach", "bigmemory", "devtools")
# install
install.packages(packages)
devtools::install_github(repo = "amkusmec/FarmCPUpp")

library(bigmemory)
library(FarmCPUpp)

# load phenotype file
pheno <- read_csv("farmcpu_traits.csv")
myY <- pheno[,c(1,4)] # select ear diameter as phenotype

# load SNP map file
myGM <- read_delim("mdp_numeric_farmcpu.map",delim = "\t")
# load SNP marker file
myGD <- read.big.matrix(filename = "mdp_numeric_farmcpu.xmat",type = "double",header = T,sep = "\t",col.names = myGM$SNP, 
                        ignore.row.names = F, has.row.names = T)

# load principle components to control for population structure
myCV <- read.table("PC_farmcpu.txt",header = T, sep = "\t")
row.names(myCV) <- myCV[,1]
myCV <- myCV[,-1]

# run GWAS with FarmCPU model
myResults <- farmcpu(Y = myY, GD = myGD, GM = myGM, CV = myCV, method.bin = "optimum", bin.size = c(3000,5000,10000,15000))
