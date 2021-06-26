setwd("~/AG2PI_GWAS_workshop/data/")
library("qqman","tidyverse")

# load GWAS output from TASSEL
GWAS_output <- read_delim("mlm_output_tutorial4.txt",delim = "\t") # this file is one of the output from the script "02.TASSEL_MLM.sh"

# select trait "EarDia" (ear diameter) as an example for visualization
gwasResults <- GWAS_output %>% filter(Trait == "EarDia" & Marker != "None") %>% 
  dplyr::select(Marker,Chr,Pos,p) %>% 
  dplyr::rename(SNP = Marker, CHR = Chr, BP = Pos, P = p) %>% 
  mutate(qval = p.adjust(P, method = "BH"))

# visualize results

# manhattan plot
manhattan(gwasResults, main = "Manhattan Plot", ylim = c(0, 10), cex = 0.6, cex.axis = 0.9, 
          col = c("blue4", "orange3"), suggestiveline = F, genomewideline = -log10(0.05/2559), chrlabs = c(1:10))
# qqplot
qq(gwasResults$P)
