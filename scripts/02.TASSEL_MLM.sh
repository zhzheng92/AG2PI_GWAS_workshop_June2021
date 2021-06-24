#!shell

# a one-liner to condunct GWAS using mixed linear model (MLM) with TASSEL
# to run the script, type "sh TASSEL_MLM.sh" in your terminal

/path_to_TASSEL_software_and_data/run_pipeline.pl -fork1 -importGuess mdp_genotype.hmp.txt -FilterSiteBuilderPlugin -siteMinAlleleFreq 0.05 -endPlugin  -fork2 -importGuess mdp_traits.txt -fork3 -importGuess mdp_population_structure.txt -excludeLastTrait -fork4 -importGuess mdp_kinship.txt -combine5 -input1 -input2 -input3 -intersect -combine6 -input5 -input4 -mlm -mlmVarCompEst P3D -mlmCompressionLevel Optimum -export mlm_output_tutorial

# pay attention to the space between each parameter
# -fork1 -importGuess mdp_genotype.hmp.txt ## import the hmp format SNP markers
# -FilterSiteBuilderPlugin -siteMinAlleleFreq 0.05 -endPlugin ## filter out the SNP markers with minor allele frequency < 0.05 (remove the 'rare alleles')
# -fork2 -importGuess mdp_traits.txt ## load the phenotype file (contains three traits)
# -fork3 -importGuess mdp_population_structure.txt ## control for population structure
# -fork4 -importGuess mdp_kinship.txt ## control for kinship
# -combine5 -input1 -input2 -input3 -intersect ## combine the phenotype, SNP marker, PCs and kinship matrix, match the genotypes for all these files
# -combine6 -input5 -input4 -mlm -mlmVarCompEst P3D -mlmCompressionLevel Optimum -export mlm_output_tutorial ## specify model parameters for MLM and name the outputs



