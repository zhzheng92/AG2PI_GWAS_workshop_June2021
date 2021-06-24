#!shell

/home/zhzheng/tassel-5-standalone/run_pipeline.pl -fork1 -importGuess mdp_genotype.hmp.txt -FilterSiteBuilderPlugin -siteMinAlleleFreq 0.05 -endPlugin  -fork2 -importGuess mdp_traits.txt -fork3 -importGuess mdp_population_structure.txt -excludeLastTrait -fork4 -importGuess mdp_kinship.txt -combine5 -input1 -input2 -input3 -intersect -combine6 -input5 -input4 -mlm -mlmVarCompEst P3D -mlmCompressionLevel Optimum -export mlm_output_tutorial
