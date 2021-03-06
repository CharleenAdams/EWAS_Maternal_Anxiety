# Results for the ALSPAC EWAS of maternal anxiety on infant methylation

## This file contains the results for the "full" model (containing all covariates):
About what went into the model:

Methylation ~ maternal general anxiety (continuous) + child gender + maternal socioeconomic class + maternal age + ancestry + batch covariates + cell counts + maternal smoking + birth weight + gestational age + psychiatric medications 

* Continuous variables were winsorized for variables for which there were outliers (outliers were set to the value for 3SDs from mean).
* Maternal anxiety was derived from questionnaire items--a score was created that summed the number of items for which anxiety was indicated.
* Level of maternal education was used to capture  socioeconomic status.
* Birthweight (grams).
* Maternal smoking is a 3-level variable (0==no smoking; 1==smoked during 1st trimester; 2==smoked throughout duration of pregnancy).
* Ancestry was accounted for with 10 principal components dervived from GWAS data.
* Batch confounders were dealt with by using the SVA approach.
* The Andrews and Bakulski approach was used for estimating the cell counts in cord blood.
* The variable for psychiatric medication was derived from questionnaire data for use of anti-depressants and anti-anxiety medications during pregnancy (1==any use; 0==no use).

**634** mother-child pairs were in the analysis.

## Results
There were **5** CpG sites with association p-values < 3.1096172 x 10-5 in the **sva** regression model.

The .md file for the .html report (uploaded but, sadly, too large to display) provides details about the CpGs.

## This is a *work-in-progress*. . .
More models will be run.
