# EWAS report
- study: alspac
- author: Charleen Adams
- date: 10 March, 2018

## Parameters


```
## $sig.threshold
## [1] 1e-05
## 
## $max.plots
## [1] 5
## 
## $model
## [1] "sva"
## 
## $qq.inflation.method
## [1] "median"
## 
## $practical.threshold
##   cg17263974 
## 3.109617e-05 
## 
## $winsorize.pct
## [1] NA
```

## Sample characteristics

For continuous or ordinal variables, the "mean" column provides the mean
and the "var" column the standard deviation of the variable.
For categorical variables, the "mean" column provides the number
of samples with the given "value" and the
"var" column the percentage of samples with the given "value".


|variable             |value |mean          |var         |
|:--------------------|:-----|:-------------|:-----------|
|variable of interest |      |13.80781      |8.652842    |
|mat.age.wins         |      |30.03628      |4.344226    |
|mat.ses              |      |0.5299685     |0.4994952   |
|sex                  |      |0.488959      |0.5002728   |
|bw.wins              |      |3489.388      |473.5781    |
|gest.age             |      |39.59306      |1.459841    |
|mat.smoke            |      |0.2255521     |0.6141384   |
|psych.meds           |      |0.05047319    |0.2190921   |
|pc1                  |      |-0.0004820189 |0.01092034  |
|pc2                  |      |0.0006082019  |0.01123728  |
|pc3                  |      |0.0005253943  |0.01122199  |
|pc4                  |      |0.001317035   |0.0108014   |
|pc5                  |      |0.0001287066  |0.010905    |
|pc6                  |      |0.001046845   |0.009881092 |
|pc7                  |      |-0.0006897476 |0.01106215  |
|pc8                  |      |-0.0006458991 |0.01105111  |
|pc9                  |      |0.0002861199  |0.01084113  |
|pc10                 |      |-0.0001722398 |0.01067511  |
|Bcell                |      |0.1700618     |0.04297299  |
|CD4T                 |      |0.1786096     |0.06105826  |
|CD8T                 |      |0.08780241    |0.04524864  |
|Gran                 |      |0.3516814     |0.09644206  |
|Mono                 |      |0.01284391    |0.01601832  |
|NK                   |      |0.008604026   |0.01904874  |
|nRBC                 |      |0.1983527     |0.09243239  |

## Covariate associations




### Covariate mat.age.wins


statistics


|var1     |var2         |         F|   p-value|          R|   p-value|
|:--------|:------------|---------:|---------:|----------:|---------:|
|variable |mat.age.wins | 0.7780413| 0.3780762| -0.0350554| 0.3782084|





![plot of chunk unnamed-chunk-21](figure/unnamed-chunk-21-1.png)


### Covariate mat.ses


statistics


|var1     |var2    |         F|  p-value|          R|   p-value|
|:--------|:-------|---------:|--------:|----------:|---------:|
|variable |mat.ses | 0.9284905| 0.335624| -0.0201054| 0.6133531|





![plot of chunk unnamed-chunk-24](figure/unnamed-chunk-24-1.png)


### Covariate sex


statistics


|var1     |var2 |         F|   p-value|         R|   p-value|
|:--------|:----|---------:|---------:|---------:|---------:|
|variable |sex  | 0.2946334| 0.5874579| 0.0159161| 0.6891624|





![plot of chunk unnamed-chunk-27](figure/unnamed-chunk-27-1.png)


### Covariate bw.wins


statistics


|var1     |var2    |         F|   p-value|          R|   p-value|
|:--------|:-------|---------:|---------:|----------:|---------:|
|variable |bw.wins | 0.2443189| 0.6212758| -0.0060522| 0.8791148|





![plot of chunk unnamed-chunk-30](figure/unnamed-chunk-30-1.png)


### Covariate gest.age


statistics


|var1     |var2     |        F|   p-value|          R|   p-value|
|:--------|:--------|--------:|---------:|----------:|---------:|
|variable |gest.age | 2.090537| 0.1487097| -0.0680277| 0.0869897|





![plot of chunk unnamed-chunk-33](figure/unnamed-chunk-33-1.png)


### Covariate mat.smoke


statistics


|var1     |var2      |        F|   p-value|         R|  p-value|
|:--------|:---------|--------:|---------:|---------:|--------:|
|variable |mat.smoke | 13.86223| 0.0002143| 0.1727086| 1.23e-05|





![plot of chunk unnamed-chunk-36](figure/unnamed-chunk-36-1.png)


### Covariate psych.meds


statistics


|var1     |var2       |        F| p-value|        R| p-value|
|:--------|:----------|--------:|-------:|--------:|-------:|
|variable |psych.meds | 30.07066|   1e-07| 0.176986| 7.4e-06|





![plot of chunk unnamed-chunk-39](figure/unnamed-chunk-39-1.png)


### Covariate pc1


statistics


|var1     |var2 |         F|   p-value|          R|   p-value|
|:--------|:----|---------:|---------:|----------:|---------:|
|variable |pc1  | 0.8626998| 0.3533389| -0.0282566| 0.4775672|





![plot of chunk unnamed-chunk-42](figure/unnamed-chunk-42-1.png)


### Covariate pc2


statistics


|var1     |var2 |         F|   p-value|         R|   p-value|
|:--------|:----|---------:|---------:|---------:|---------:|
|variable |pc2  | 0.6999631| 0.4031123| 0.0275738| 0.4882772|





![plot of chunk unnamed-chunk-45](figure/unnamed-chunk-45-1.png)


### Covariate pc3


statistics


|var1     |var2 |         F|   p-value|         R|   p-value|
|:--------|:----|---------:|---------:|---------:|---------:|
|variable |pc3  | 0.1592123| 0.6900175| 0.0169547| 0.6700378|





![plot of chunk unnamed-chunk-48](figure/unnamed-chunk-48-1.png)


### Covariate pc4


statistics


|var1     |var2 |         F|   p-value|         R|   p-value|
|:--------|:----|---------:|---------:|---------:|---------:|
|variable |pc4  | 0.1909428| 0.6622823| 0.0138412| 0.7279596|





![plot of chunk unnamed-chunk-51](figure/unnamed-chunk-51-1.png)


### Covariate pc5


statistics


|var1     |var2 |         F|   p-value|          R|   p-value|
|:--------|:----|---------:|---------:|----------:|---------:|
|variable |pc5  | 0.2799535| 0.5969175| -0.0010591| 0.9787665|





![plot of chunk unnamed-chunk-54](figure/unnamed-chunk-54-1.png)


### Covariate pc6


statistics


|var1     |var2 |        F|   p-value|         R|   p-value|
|:--------|:----|--------:|---------:|---------:|---------:|
|variable |pc6  | 1.087595| 0.2974034| 0.0423279| 0.2872544|





![plot of chunk unnamed-chunk-57](figure/unnamed-chunk-57-1.png)


### Covariate pc7


statistics


|var1     |var2 |       F|   p-value|          R|   p-value|
|:--------|:----|-------:|---------:|----------:|---------:|
|variable |pc7  | 1.72209| 0.1899007| -0.0590162| 0.1377156|





![plot of chunk unnamed-chunk-60](figure/unnamed-chunk-60-1.png)


### Covariate pc8


statistics


|var1     |var2 |        F|  p-value|         R|   p-value|
|:--------|:----|--------:|--------:|---------:|---------:|
|variable |pc8  | 1.668147| 0.196979| 0.0418032| 0.2932771|





![plot of chunk unnamed-chunk-63](figure/unnamed-chunk-63-1.png)


### Covariate pc9


statistics


|var1     |var2 |         F|   p-value|         R|   p-value|
|:--------|:----|---------:|---------:|---------:|---------:|
|variable |pc9  | 0.2687317| 0.6043652| -0.022215| 0.5766224|





![plot of chunk unnamed-chunk-66](figure/unnamed-chunk-66-1.png)


### Covariate pc10


statistics


|var1     |var2 |         F|  p-value|         R|   p-value|
|:--------|:----|---------:|--------:|---------:|---------:|
|variable |pc10 | 0.0017481| 0.966663| 0.0012689| 0.9745623|





![plot of chunk unnamed-chunk-69](figure/unnamed-chunk-69-1.png)


### Covariate Bcell


statistics


|var1     |var2  |         F|   p-value|         R|   p-value|
|:--------|:-----|---------:|---------:|---------:|---------:|
|variable |Bcell | 0.0286158| 0.8657232| 0.0188794| 0.6351618|





![plot of chunk unnamed-chunk-72](figure/unnamed-chunk-72-1.png)


### Covariate CD4T


statistics


|var1     |var2 |         F|   p-value|         R|   p-value|
|:--------|:----|---------:|---------:|---------:|---------:|
|variable |CD4T | 0.0925576| 0.7610506| 0.0358235| 0.3678421|





![plot of chunk unnamed-chunk-75](figure/unnamed-chunk-75-1.png)


### Covariate CD8T


statistics


|var1     |var2 |         F|   p-value|         R|   p-value|
|:--------|:----|---------:|---------:|---------:|---------:|
|variable |CD8T | 0.0003711| 0.9846372| 0.0033438| 0.9330342|





![plot of chunk unnamed-chunk-78](figure/unnamed-chunk-78-1.png)


### Covariate Gran


statistics


|var1     |var2 |         F|   p-value|         R|   p-value|
|:--------|:----|---------:|---------:|---------:|---------:|
|variable |Gran | 0.5239924| 0.4694115| 0.0226357| 0.5694232|





![plot of chunk unnamed-chunk-81](figure/unnamed-chunk-81-1.png)


### Covariate Mono


statistics


|var1     |var2 |         F|   p-value|         R|   p-value|
|:--------|:----|---------:|---------:|---------:|---------:|
|variable |Mono | 0.7469356| 0.3877761| -0.017096| 0.6674508|





![plot of chunk unnamed-chunk-84](figure/unnamed-chunk-84-1.png)


### Covariate NK


statistics


|var1     |var2 |        F|   p-value|          R|   p-value|
|:--------|:----|--------:|---------:|----------:|---------:|
|variable |NK   | 5.625832| 0.0179963| -0.0503816| 0.2051991|





![plot of chunk unnamed-chunk-87](figure/unnamed-chunk-87-1.png)


### Covariate nRBC


statistics


|var1     |var2 |         F|   p-value|          R|   p-value|
|:--------|:----|---------:|---------:|----------:|---------:|
|variable |nRBC | 0.3373505| 0.5615696| -0.0196845| 0.6208027|





![plot of chunk unnamed-chunk-90](figure/unnamed-chunk-90-1.png)

## QQ plots






![plot of chunk unnamed-chunk-92](figure/unnamed-chunk-92-1.png)





![plot of chunk unnamed-chunk-94](figure/unnamed-chunk-94-1.png)





![plot of chunk unnamed-chunk-96](figure/unnamed-chunk-96-1.png)





![plot of chunk unnamed-chunk-98](figure/unnamed-chunk-98-1.png)

## Manhattan plots






![plot of chunk unnamed-chunk-100](figure/unnamed-chunk-100-1.png)





![plot of chunk unnamed-chunk-102](figure/unnamed-chunk-102-1.png)





![plot of chunk unnamed-chunk-104](figure/unnamed-chunk-104-1.png)





![plot of chunk unnamed-chunk-106](figure/unnamed-chunk-106-1.png)

## Significant CpG sites

There were 4
CpG sites with association p-values < 10<sup>-5</sup>.
These are listed in the file [associations.csv](associations.csv).



The following table shows overlaps between
associations under different sets of covariates:

|             | p.value.none| p.value.all| p.value.isva| p.value.sva|
|:------------|------------:|-----------:|------------:|-----------:|
|p.value.none |            1|           1|            1|           0|
|p.value.all  |            1|           3|            2|           1|
|p.value.isva |            1|           2|            3|           1|
|p.value.sva  |            0|           1|            1|           1|



Below are the 5
CpG sites with association p-values < 3.1096172 &times; 10<sup>-5</sup>
in the sva regression model.


|           |chromosome |  position| p.value.none| p.value.all| p.value.isva| p.value.sva| coefficient.none| coefficient.all| coefficient.isva| coefficient.sva|
|:----------|:----------|---------:|------------:|-----------:|------------:|-----------:|----------------:|---------------:|----------------:|---------------:|
|cg23434122 |chr3       |  40518435|    0.0008304|   0.0008797|    0.0011385|    3.03e-05|        0.0010357|       0.0010580|        0.0008423|       0.0010416|
|cg10122294 |chr1       | 231765076|    0.0000006|   0.0000027|    0.0000017|    1.56e-05|       -0.0013095|      -0.0012347|       -0.0012862|      -0.0011313|
|cg16257013 |chr6       |  30167403|    0.0045941|   0.0025452|    0.0002530|    1.49e-05|       -0.0013112|      -0.0012939|       -0.0014434|      -0.0015845|
|cg12087615 |chr12      |  53070144|    0.0002507|   0.0001542|    0.0000687|    1.93e-05|       -0.0037855|      -0.0040868|       -0.0044752|      -0.0049404|
|cg08620313 |chr16      |  55868432|    0.0000200|   0.0000043|    0.0000004|    3.00e-07|       -0.0008354|      -0.0008794|       -0.0009972|      -0.0009723|

Plots of these sites follow, one for each covariate set.
"p[lm]" denotes the p-value obtained using a linear model
and "p[beta]" the p-value obtained using beta regression.




### CpG site cg23434122




![plot of chunk unnamed-chunk-107](figure/unnamed-chunk-107-1.png)

![plot of chunk unnamed-chunk-107](figure/unnamed-chunk-107-2.png)



![plot of chunk unnamed-chunk-108](figure/unnamed-chunk-108-1.png)

![plot of chunk unnamed-chunk-108](figure/unnamed-chunk-108-2.png)



### CpG site cg10122294




![plot of chunk unnamed-chunk-110](figure/unnamed-chunk-110-1.png)

![plot of chunk unnamed-chunk-110](figure/unnamed-chunk-110-2.png)



![plot of chunk unnamed-chunk-111](figure/unnamed-chunk-111-1.png)

![plot of chunk unnamed-chunk-111](figure/unnamed-chunk-111-2.png)



### CpG site cg16257013




![plot of chunk unnamed-chunk-113](figure/unnamed-chunk-113-1.png)

![plot of chunk unnamed-chunk-113](figure/unnamed-chunk-113-2.png)



![plot of chunk unnamed-chunk-114](figure/unnamed-chunk-114-1.png)

![plot of chunk unnamed-chunk-114](figure/unnamed-chunk-114-2.png)



### CpG site cg12087615




![plot of chunk unnamed-chunk-116](figure/unnamed-chunk-116-1.png)

![plot of chunk unnamed-chunk-116](figure/unnamed-chunk-116-2.png)



![plot of chunk unnamed-chunk-117](figure/unnamed-chunk-117-1.png)

![plot of chunk unnamed-chunk-117](figure/unnamed-chunk-117-2.png)



### CpG site cg08620313




![plot of chunk unnamed-chunk-119](figure/unnamed-chunk-119-1.png)

![plot of chunk unnamed-chunk-119](figure/unnamed-chunk-119-2.png)



![plot of chunk unnamed-chunk-120](figure/unnamed-chunk-120-1.png)

![plot of chunk unnamed-chunk-120](figure/unnamed-chunk-120-2.png)

## Selected CpG sites

Number of CpG sites selected: 0.


|chromosome | position| p.value.none| p.value.all| p.value.isva| p.value.sva| coefficient.none| coefficient.all| coefficient.isva| coefficient.sva|
|:----------|--------:|------------:|-----------:|------------:|-----------:|----------------:|---------------:|----------------:|---------------:|





## R session information


```
## R version 3.3.3 (2017-03-06)
## Platform: x86_64-pc-linux-gnu (64-bit)
## Running under: Scientific Linux release 6.4 (Carbon)
## 
## locale:
##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] parallel  stats     graphics  grDevices utils     datasets  methods  
## [8] base     
## 
## other attached packages:
##  [1] meffil_1.0.0       statmod_1.4.30     quadprog_1.5-5    
##  [4] DNAcopy_1.48.0     fastICA_1.2-1      lme4_1.1-15       
##  [7] Matrix_1.2-8       multcomp_1.4-8     TH.data_1.0-8     
## [10] survival_2.41-2    mvtnorm_1.0-7      matrixStats_0.53.1
## [13] markdown_0.8       gridExtra_2.3      Cairo_1.5-9       
## [16] knitr_1.20         reshape2_1.4.3     plyr_1.8.4        
## [19] ggplot2_2.2.1      sva_3.22.0         genefilter_1.56.0 
## [22] mgcv_1.8-17        nlme_3.1-131       limma_3.30.13     
## [25] MASS_7.3-45        illuminaio_0.16.0  foreign_0.8-67    
## 
## loaded via a namespace (and not attached):
##  [1] base64_2.0           Rcpp_0.12.15         lattice_0.20-34     
##  [4] zoo_1.8-1            assertthat_0.1       digest_0.6.12       
##  [7] stats4_3.3.3         RSQLite_1.1-2        evaluate_0.10.1     
## [10] highr_0.6            lazyeval_0.2.0       minqa_1.2.4         
## [13] annotate_1.52.1      nloptr_1.0.4         S4Vectors_0.12.2    
## [16] labeling_0.3         splines_3.3.3        stringr_1.3.0       
## [19] RCurl_1.95-4.10      munsell_0.4.3        BiocGenerics_0.20.0 
## [22] openssl_1.0.1        tibble_1.2           IRanges_2.8.1       
## [25] codetools_0.2-15     XML_3.98-1.10        bitops_1.0-6        
## [28] grid_3.3.3           xtable_1.8-2         gtable_0.2.0        
## [31] DBI_0.8              magrittr_1.5         scales_0.4.1        
## [34] stringi_1.1.6        sandwich_2.4-0       tools_3.3.3         
## [37] Biobase_2.34.0       AnnotationDbi_1.36.2 colorspace_1.3-2    
## [40] memoise_1.0.0
```
