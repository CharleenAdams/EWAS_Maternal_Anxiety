##########################
#Maternal Anxiety Phenotype File
##########################
#setwd("~/Dropbox/Bristol") #home
setwd("C:/Users/ca16591/Dropbox/Bristol") #Oakfield

#Load and install packages
pkg <- c("dplyr", "knitr", "devtools", "DT", "xtable")
new.pkg <- pkg[!(pkg %in% installed.packages())]
library("foreign")
library("knitr")
library("DT")
library("xtable")
library(Hmisc)
install.packages("psych")
install.packages("tableone")
library(tableone)
library(psych)
install.packages("plyr")
install.packages("dplyr")
library(plyr)
library(dplyr)
install.packages("robustHD")
install.packages("devtools")
library(devtools)
devtools::install_github("explodecomputer/alspac")
library(alspac)

setDataDir("R:/Data/Current/Quest/Mother") # to access the 'b' and 'c' questionnaire data
#setDataDir("R:/Data") # to access to 'h' questionnaire data, which I extracted with the Shiny App and saved as a .csv (see below)

##########################
#Read in the 'b' variables
#Code the 'b' variables ALSPAC-specific scoring
##########################
require(foreign)
b<-read.spss("R://data/Current/Quest/Mother/b_4d.sav",to.data.frame = TRUE)
attr(b, "variable.labels")
b_selection<-b[,c('aln','b328','b330','b333','b336','b339','b342','b344','b347','b351')]
#Code according to the 'B Doc': 
#d1 (b328), d15 (b342), d17 (b344)==(1,2=2)(3,4=0); 
#d3 (b330), d6 (b333), d12 (b339), d20 (b347)==(1,2=2)(3=1)(4=0)
#d9 (b336)==(1,2,3=2)(4=0)

b_selection[,2] <- ifelse(b_selection[,2] == "Never", 0, ifelse(b_selection[,2] == "Not V often", 0, ifelse(b_selection[,2] == "Often", 2, ifelse(b_selection[,2] == "V often", 2, NA))))
b_selection[,3] <- ifelse(b_selection[,3] == "Never", 0, ifelse(b_selection[,3] == "Not V often", 1, ifelse(b_selection[,3] == "Often", 2, ifelse(b_selection[,3] == "V often", 2, NA))))
b_selection[,4] <- ifelse(b_selection[,4] == "Never", 0, ifelse(b_selection[,4] == "Not V often", 1, ifelse(b_selection[,4] == "Often", 2, ifelse(b_selection[,4] == "V often", 2, NA))))
b_selection[,5] <- ifelse(b_selection[,5] == "Never", 0, ifelse(b_selection[,5] == "Not V often", 2, ifelse(b_selection[,5] == "Often", 2, ifelse(b_selection[,5] == "V often", 2, NA))))
b_selection[,6] <- ifelse(b_selection[,6] == "Never", 0, ifelse(b_selection[,6] == "Not V often", 1, ifelse(b_selection[,6] == "Often", 2, ifelse(b_selection[,6] == "V often", 2, NA))))
b_selection[,7] <- ifelse(b_selection[,7] == "Never", 0, ifelse(b_selection[,7] == "Not V often", 0, ifelse(b_selection[,7] == "Often", 2, ifelse(b_selection[,7] == "V often", 2, NA))))
b_selection[,8] <- ifelse(b_selection[,8] == "Never", 0, ifelse(b_selection[,8] == "Not V often", 0, ifelse(b_selection[,8] == "Often", 2, ifelse(b_selection[,8] == "V often", 2, NA))))
b_selection[,9] <- ifelse(b_selection[,9] == "Never", 0, ifelse(b_selection[,9] == "Not V often", 1, ifelse(b_selection[,9] == "Often", 2, ifelse(b_selection[,9] == "V often", 2, NA))))

#Remove 'NAs' to test whether the complete 'b' cases (answered all 'b' questions) adds up bo b351: they do! (11799=TRUE; no false in the table)
b_selection_complete=na.omit(b_selection)
b_selection_complete$b351_new=as.numeric(as.character(b_selection_complete$b351))
table(b_selection_complete$b351_new)

b_selection_complete$test_b <- rowSums(b_selection_complete[,2:9])
table(b_selection_complete$test_b==b_selection_complete$b351_new)

##########################
#Read in the 'c' variables
#Code the 'c' variables ALSPAC-specific scoring
##########################
c <- read.spss("R://data/Current/Quest/Mother/c_7d.sav",to.data.frame = TRUE)
attr(c, "variable.labels")
c_selection <- c[,c('aln','c550','c552','c555','c558','c561','c564','c566','c569', 'c573')]
table(c_selection$c573)
c_selection$c573 <- revalue(c_selection$c573, c("not anxious"="0", "very anxious"="16"))
head(c_selection[,2], n=30)
colnames(c_selection)

#Set the 'c' variables up according to the C Doc: F1 (c550), F15 (c564), F17 (c566)==(1,2=2)(3=1)(4=0); 
#F3 (c552), F6 (c555), F12 (c561), F20 (c569)==(1,2=2)(3=1)(4=0); 
#F9 (c558)==(1,2,3=2)(4=0)

c_selection[,2] <- ifelse(c_selection[,2] == "Never", 0, ifelse(c_selection[,2] == "Not often", 0, ifelse(c_selection[,2] == "Often", 2, ifelse(c_selection[,2] == "V often", 2, NA))))
c_selection[,3] <- ifelse(c_selection[,3] == "Never", 0, ifelse(c_selection[,3] == "Not often", 1, ifelse(c_selection[,3] == "Often", 2, ifelse(c_selection[,3] == "V often", 2, NA))))
c_selection[,4] <- ifelse(c_selection[,4] == "Never", 0, ifelse(c_selection[,4] == "Not often", 1, ifelse(c_selection[,4] == "Often", 2, ifelse(c_selection[,4] == "V often", 2, NA))))
c_selection[,5] <- ifelse(c_selection[,5] == "Never", 0, ifelse(c_selection[,5] == "Not often", 2, ifelse(c_selection[,5] == "Often", 2, ifelse(c_selection[,5] == "V often", 2, NA))))
c_selection[,6] <- ifelse(c_selection[,6] == "Never", 0, ifelse(c_selection[,6] == "Not often", 1, ifelse(c_selection[,6] == "Often", 2, ifelse(c_selection[,6] == "V often", 2, NA))))
c_selection[,7] <- ifelse(c_selection[,7] == "Never", 0, ifelse(c_selection[,7] == "Not often", 0, ifelse(c_selection[,7] == "Often", 2, ifelse(c_selection[,7] == "V often", 2, NA))))
c_selection[,8] <- ifelse(c_selection[,8] == "Never", 0, ifelse(c_selection[,8] == "Not often", 0, ifelse(c_selection[,8] == "Often", 2, ifelse(c_selection[,8] == "V often", 2, NA))))
c_selection[,9] <- ifelse(c_selection[,9] == "Never", 0, ifelse(c_selection[,9] == "Not often", 1, ifelse(c_selection[,9] == "Often", 2, ifelse(c_selection[,9] == "V often", 2, NA))))

##########################
#Test whether the complete cases (answered all 'c' questions) adds up to c573: they do! (10954=TRUE; no false in the table)
##########################
c_selection_complete=na.omit(c_selection)
c_selection_complete$c573_new=as.numeric(as.character(c_selection_complete$c573))
table(c_selection_complete$c573_new)

c_selection_complete$test_c <- rowSums(c_selection_complete[,2:9])
table(c_selection_complete$test_c==c_selection_complete$c573_new)

##########################
#Read in the 'h' variables from the .csv file, extracted from the Shiny App (pulling in the h_6c.sav file directly with R didn't work...)
#Code the 'h' variables ALSPAC-specific scoring
#from entire Crown Crisp (d1-d23), select anxiety questions: d1 + d3 + d6 + d9 + d12 + d15 + d17 + d20 

#This code is greened out because it didn't work
#require(foreign)
#h <- read.spss("R://data/Current/Quest/Mother/h_6c.sav",to.data.frame = TRUE)
#attr(h, "variable.labels")
#h_selection <- h[,h('aln','h155','h157','h160','h163','h166','h169','h171','h174')]

##########################
setDataDir("R:/Data") # On my work PC
h_selection <- extractWebOutput("anxiety_vars_H_data-2018-02-15.csv")
colnames(h_selection)

#recode d1: h155
h_selection[,2] <- ifelse(h_selection[,2] == "Never", 0, ifelse(h_selection[,2] == "Not very often", 0, ifelse(h_selection[,2] == "Often", 2, ifelse(h_selection[,2] == "Very often", 2, NA))))
head(h_selection$h155, n=20)

#recode d3: h157
h_selection[,3] <- ifelse(h_selection[,3] == "Never", 0, ifelse(h_selection[,3] == "Not very often", 1, ifelse(h_selection[,3] == "Often", 2, ifelse(h_selection[,3] == "Very often", 2, NA))))
head(h_selection$h157, n=20)

#recode d6: h160
h_selection[,4] <- ifelse(h_selection[,4] == "Never", 0, ifelse(h_selection[,4] == "Not very often", 1, ifelse(h_selection[,4] == "Often", 2, ifelse(h_selection[,4] == "Very often", 2, NA))))
head(h_selection$h160, n=20)

#recode d9: h163

h_selection[,5] <- ifelse(h_selection[,5] == "Never", 0, ifelse(h_selection[,5] == "Not very often", 2, ifelse(h_selection[,5] == "Often", 2, ifelse(h_selection[,5] == "Very often", 2, NA))))
head(h_selection$h163, n=20)

#recode d12: h166

h_selection[,6] <- ifelse(h_selection[,6] == "Never", 0, ifelse(h_selection[,6] == "Not very often", 1, ifelse(h_selection[,6] == "Often", 2, ifelse(h_selection[,6] == "Very often", 2, NA))))
head(h_selection$h166, n=20)

#recode d15: h169
h_selection[,7] <- ifelse(h_selection[,7] == "Never", 0, ifelse(h_selection[,7] == "Not very often", 0, ifelse(h_selection[,7] == "Often", 2, ifelse(h_selection[,7] == "Very often", 2, NA))))
head(h_selection$h169, n=20)


#recode d17: h171
h_selection[,8] <- ifelse(h_selection[,8] == "Never", 0, ifelse(h_selection[,8] == "Not very often", 0, ifelse(h_selection[,8] == "Often", 2, ifelse(h_selection[,8] == "Very often", 2, NA))))
head(h_selection$h171, n=20)

#recode d20: h174

h_selection[,9] <- ifelse(h_selection[,9] == "Never", 0, ifelse(h_selection[,9] == "Not very often", 1, ifelse(h_selection[,9] == "Often", 2, ifelse(h_selection[,9] == "Very often", 2, NA))))
head(h_selection$h174, n=20)

head(h_selection)

##########################
#Merge the b_selection, c_selection, and h_selection anxiety variables
##########################

anxiety_pheno_b_c <- merge(b_selection,c_selection, by="aln")
head(anxiety_pheno_b_c)

anxiety_pheno_complete <- merge(anxiety_pheno_b_c,h_selection, by="aln")


myvars <- c( "aln",
             "b328", "b330", "b333", "b336", 
             "b339", "b342", "b344", "b347", 
             "c550", "c552", "c555", "c558", 
             "c561", "c564", "c566", "c569",
             "h155", "h157", "h160", "h166", 
             "h169", "h171", "h174", "h163"
             
)

anxiety_pheno_complete <- anxiety_pheno_complete[myvars]
head(anxiety_pheno_complete)

colnames(anxiety_pheno_complete)

##########################
#Create the continuous (general maternal) anxiety score (3 steps)
##########################
#Step 1
#Determine how many items were answered for each individual
#Name number of items answered "items_answered"
##########################
anxiety_pheno_complete$not_missing <- apply(anxiety_pheno_complete, 1, function(x) length(which(!is.na(x))))
head(anxiety_pheno_complete$not_missing, n=10)
head(anxiety_pheno_complete, n=50)

anxiety_pheno_complete$items_answered <- (anxiety_pheno_complete$not_missing-1)
head(anxiety_pheno_complete$items_answered)

##########################
#Step 2
#Sum across answered items
##########################
anxiety_pheno_complete$sum <- rowSums(anxiety_pheno_complete[,2:25], na.rm=TRUE)
head(anxiety_pheno_complete$sum, n=20)

##########################
#Step 3
#Divide "Sum" by "items_answered" and then multiple by number of items (24)
##########################
anxiety_pheno_complete$continuous_anx_score <- (anxiety_pheno_complete$sum/anxiety_pheno_complete$items_answered)*24
head(anxiety_pheno_complete$continuous_anx_score)
summary(anxiety_pheno_complete$continuous_anx_score)

##########################
#Find out if there are any 'NAs'--mums included but who don't have an anxiety score
##########################
dim(anxiety_pheno_complete)
str(anxiety_pheno_complete)
missings <- anxiety_pheno_complete[which(anxiety_pheno_complete$continuous_anx_score=='NA'),] # 2 missing

no_score_ALNs<-anxiety_pheno_complete[which(is.na(anxiety_pheno_complete$continuous_anx_score)),] # aln==36867, 45286

##########################
#Find the 85th percentile for (maternal general) anxiety
##########################
quantile(anxiety_pheno_complete$continuous_anx_score, c(.85), na.rm=TRUE) 

##########################
#Make the dichotomous (maternal general anxiety) variable
#(where highest-scoring 15% are the high-anxiety category)

anxiety_pheno_complete$dichotomous_anx_score <- ifelse(anxiety_pheno_complete$continuous_anx_score>=24, 1, 0)
table(anxiety_pheno_complete$dichotomous_anx_score)
dataGeneralAnx <- anxiety_pheno_complete

##########################
#Pull in the anxiety and anti-depressant medication variables
#medication use 18w(=B) or 32w(=C) gestation, for completeness added 8w(=E) and 8m(=F). PACE does not ask for the E/F questions
#anxiolytics
#"b106","b107","c093","f060","f062","f060a","f062a"
#antidepressants
#"b122","b123","c101",'e326','e327',"f063","f063a"
###########################
setDataDir("R:/Data") # On my work PC
meds_selection <- extractWebOutput("anxioletics_antidepression_meds_ALSPAC_pace.csv")
colnames(meds_selection)

head(meds_selection)
table(meds_selection$b106)
meds_selection$b106_any <- ifelse(meds_selection[,3] == "Missing", NA, ifelse(meds_selection[,3] == "not at all", 0, 1))
head(meds_selection$b106_any, n=20)

table(meds_selection$b107)
meds_selection$b107_any <- ifelse(meds_selection[,4] == "Missing", NA, ifelse(meds_selection[,4] == "No", 0, 1))
head(meds_selection$b107_any, n=20)
describe(meds_selection$b107_any)

table(meds_selection$b122)
meds_selection$b122_any <- ifelse(meds_selection[,5] == "Missing", NA, ifelse(meds_selection[,5] == "not at all", 0, 1))
head(meds_selection$b122_any, n=20)

table(meds_selection$b123)
meds_selection$b123_any <- ifelse(meds_selection[,6] == "Missing", NA, ifelse(meds_selection[,6] == "No", 0, 1))
head(meds_selection$b123_any, n=20)

table(meds_selection$c093)
meds_selection$c093_any <- ifelse(meds_selection[,7] == "Missing", NA, ifelse(meds_selection[7]== "Y", 1, 0))
head(meds_selection$c093_any, n=20)
table(meds_selection$c093_any)
describe(meds_selection$c093_any)

colnames(meds_selection)

#FTG?
table(meds_selection$c101)
meds_selection$c101_any <- ifelse(meds_selection[,8] == "Missing", NA, ifelse(meds_selection[8]== "Y", 1, 0))
head(meds_selection$c101_any, n=20)
table(meds_selection$c101_any)
describe(meds_selection$c101_any)

table(meds_selection$e326)
meds_selection$e326_any <- ifelse(meds_selection[,9] == "Missing", NA, ifelse(meds_selection[9]== "Almost daily" | meds_selection[,9] == "SMTS", 1, 0))
head(meds_selection$e326_any, n=20)
table(meds_selection$e326_any)
describe(meds_selection$e326_any)

table(meds_selection$e327)
meds_selection$e327_any <- ifelse(meds_selection[,10] == "Missing", NA, ifelse(meds_selection[10]== "Yes", 1, 0))
head(meds_selection$e327_any, n=20)
table(meds_selection$e327_any)

table(meds_selection$f060)
meds_selection$f060_any <- ifelse(meds_selection[,11] == "Missing", NA, ifelse(meds_selection[11]== "Daily" | meds_selection[,11] =="Often"| meds_selection[,11] == "SMTS", 1, 0))
head(meds_selection$f060_any, n=20)
table(meds_selection$f060_any)

table(meds_selection$f060a)
meds_selection$f060a_any <- ifelse(meds_selection[,12]  == "Missing", NA, ifelse(meds_selection[12]== "Yes", 1, 0))
head(meds_selection$f060a_any, n=20)
table(meds_selection$f060a_any)

table(meds_selection$f062)
meds_selection$f062_any <- ifelse(meds_selection[,13] == "Missing", NA, ifelse(meds_selection[13]=="Daily" | meds_selection[,13] =="Often"| meds_selection[,13] == "SMTS", 1, 0))
head(meds_selection$f062_any, n=20)
table(meds_selection$f062_any)

table(meds_selection$f062a)
meds_selection$f062a_any <- ifelse(meds_selection[,14] == "Missing", NA, ifelse(meds_selection[14] == "Yes", 1, 0))
head(meds_selection$f062a_any, n=20)
table(meds_selection$f062a_any)

table(meds_selection$f063)
meds_selection$f063_any <- ifelse(meds_selection[,15]  == "Missing", NA, ifelse(meds_selection[15]== "Daily" | meds_selection[,15] =="Often"| meds_selection[,15] == "SMTS", 1, 0))
head(meds_selection$f063_any, n=20)
table(meds_selection$f063_any)

table(meds_selection$f063a)
meds_selection$f063a_any <- ifelse(meds_selection[,16]  == "Missing", NA, ifelse(meds_selection[16]== "Yes",1, 0))
head(meds_selection$f063a_any, n=20)
table(meds_selection$f063a_any)

head(meds_selection, n=10)
str(meds_selection)

##########################
#Create binary indication of any psychiatric medication during pregnancy: 947 mums (before removing non-consents) were on meds
##########################
colnames(meds_selection)
meds_selection$any_medication <- rowSums(meds_selection[,17:30], na.rm=TRUE)
table(meds_selection$any_medication)
meds_selection$any_medication_binary <- ifelse(meds_selection$any_medication !=0,1,0)
table(meds_selection$any_medication_binary)

##########################
#Merge the meds_selection and dataGeneralAnx
##########################
anxiety_and_medication_variables <- merge(dataGeneralAnx,meds_selection, by="aln")
head(anxiety_and_medication_variables)

myvars <- c( "aln","alnqlet",
             "any_medication_binary", "continuous_anx_score", "dichotomous_anx_score")

anxiety_and_medication_variables <- anxiety_and_medication_variables[myvars]
head(anxiety_and_medication_variables)

# Save 
write.csv(anxiety_and_medication_variables,row.names=FALSE,file="C:/Users/ca16591/Dropbox/Bristol/phenofile.alspac.anxiety.variables.psychiatric.meds.csv")

##########################
#Extract the other PACE covariates (more are included here but these are the ones we need:
#"Child gender" (0=female; 1=male)
#"Maternal socioencomic class" (education: categorical or continuous; I chose Gemma's categorical variable for education)
#"Maternal smoking" (3 groups (2 dummy variables: 0 (never smoked during pregnancy), 1 ((stopped early during pregnancy, 
#i.e. during the 1st trimester or when pregnancy was known), 2 (sustained smoking during pregnancy))
#"Gestational age" (in weeks; continuous)
#********Need "Birth weight" (in grams)***********
##########################
setDataDir("R:/Data")

data(current)
data(useful)

vars.current.parents <- subset(current, name %in% c("paw002","paw010","dw042","c666a","c645a","pa910","e695","a214","b663","b665","b667","c482","e170","e172","e174","e176","e178","e185","b683","pb071","pb072","pb074","pb075","pb076","pb077","pb901","pb431","pb432","b032", "b670", "b671","a521","pa063","mz010","c481a","pb078"))

vars.current.children <- subset(current, name %in%
                                  c("kz021","kz011b"))
vars.current.children <-vars.current.children[!duplicated(vars.current.children$name),] #kz021 and kz011b were in two files, so deleting the second instance

vars.current.misc <- subset(current, name %in%
                              c("in_core", "in_alsp","in_phase2","in_phase3","tripquad"))

vars.useful.parents <- subset(useful, name %in% c("bestgest"))[1,]

vars.useful.children <- subset(useful, name %in% c("fedx135","fedx136"))

dat.useful.parents <- extractVars(vars.useful.parents)
dat.useful.children <- extractVars(vars.useful.children)#qlet

dat.current.parents <- extractVars(vars.current.parents)
dat.current.children <- extractVars(vars.current.children)#qlet
dat.current.misc <- extractVars(vars.current.misc)


dat.children <- merge(dat.current.children, dat.useful.children, by="alnqlet",all=TRUE)
dat.children <- merge(dat.children, dat.current.misc, by="alnqlet",all=TRUE)
dat.parents <-  merge(dat.current.parents, dat.useful.parents, by="aln",all=TRUE)
dat <- merge(dat.children, dat.parents, by="aln",all=TRUE)
dim(dat)

dat<-dat[which(dat$in_alsp==1),]
dim(dat)
dat<-dat[which(dat$mz010=="Singleton"),]
dim(dat)

# Biological father status yes according to mum (dad=yes or dad=NA)=1)
dat$bio.dad.according.to.mum <- NA
dat$bio.dad.according.to.mum[dat$a521=="Yes"] <- 1
dat$bio.dad.according.to.mum[dat$a521=="No"] <- 0

dat$bio.dad.according.to.dad <- NA
dat$bio.dad.according.to.dad[dat$pa063==1] <- 1
dat$bio.dad.according.to.dad[dat$pa063==2] <- 0

dat$bio.dad <- dat$bio.dad.according.to.mum
dat$bio.dad[dat$bio.dad.according.to.dad==0 & (dat$bio.dad.according.to.mum==1|dat$bio.dad.according.to.mum==NA)] <-NA

# Remove non-biological dads
#dat<-dat[which(dat$bio.dad==1),]
#dim(dat)

# Paternal BMI (paw002 - weight in kg,paw010 - height in cm)
dat$paw010[dat$paw010<1] <- NA
dat$paw002[dat$paw002<1] <- NA
dat$pat.bmi <- dat$paw002/(dat$paw010/100)^2

# Paternal obesity
dat$pat.obesity <- NA
dat$pat.obesity[dat$pat.bmi>=18.5 & dat$pat.bmi<25] <-0
dat$pat.obesity[dat$pat.bmi>30] <-1

# Maternal BMI (dw042)
dat$dw042[dat$dw042<1] <- NA
dat$mat.bmi <- dat$dw042

# Maternal obesity
dat$mat.obesity <- NA
dat$mat.obesity[dat$mat.bmi>=18.5 & dat$mat.bmi<25] <-0
dat$mat.obesity[dat$mat.bmi>30] <-1

# Paternal education (alevel or not, c666a)
dat$pat.ses <- NA
dat$pat.ses[dat$c666a=="A level"] <- 1
dat$pat.ses[dat$c666a=="Degree"] <- 1
dat$pat.ses[dat$c666a=="O level"] <- 0
dat$pat.ses[dat$c666a=="Vocational"] <- 0
dat$pat.ses[dat$c666a=="CSE"] <- 0

# Maternal education (alevel or not, c645a)
dat$mat.ses <- NA
dat$mat.ses[dat$c645a=="A level"] <- 1
dat$mat.ses[dat$c645a=="Degree"] <- 1
dat$mat.ses[dat$c645a=="O level"] <- 0
dat$mat.ses[dat$c645a=="Vocational"] <- 0
dat$mat.ses[dat$c645a=="CSE"] <- 0

# Paternal age 
dat$pa910[dat$pa910<1] <- NA
dat$pat.age <- dat$pa910

# Maternal age 
dat$e695[dat$e695<1] <- NA
dat$mat.age <- dat$e695

# Parity
dat$parity <- NA
dat$parity[dat$b032==0] <-0
dat$parity[dat$b032>0] <-1

# Maternal smoking (none in pregnancy, stopped in early preg, throughout)
## First trimester
dat$mat.smoke.1 <- NA
dat$mat.smoke.1[dat$b665=="N"] <- 0 # didn't smoke in first trimester
dat$mat.smoke.1[dat$b665=="Y CIGS"|dat$b665=="Y cigars"|dat$b665=="Y pipe"|dat$b665=="Y other"] <- 1 # smoked in first trimester
## Second trimester
dat$mat.smoke.2 <- NA
dat$mat.smoke.2[dat$b667=="N"] <- 0 # didn't smoke in second trimester
dat$mat.smoke.2[dat$b667=="Y CIGS"|dat$b667=="Y cigars"|dat$b667=="Y pipe"|dat$b667=="Y other"] <- 1 # smoked in second trimester
## Third trimester
dat$mat.smoke.3.C <- NA
dat$mat.smoke.3.C[dat$c482==0] <- 0 # didn't smoke in third trimester according to c482
dat$mat.smoke.3.C[dat$c482>0] <- 1 # smoked in third trimester according to c482
dat$mat.smoke.3.E <- NA
dat$mat.smoke.3.E[dat$e178=="Not at all"] <- 0 # didn't smoke in third trimester according to e178
dat$mat.smoke.3.E[dat$e178=="1-4"|dat$e178=="5-9"|dat$e178=="10-14"|dat$e178=="15-19"|dat$e178=="20-24"|dat$e178=="25-29"|dat$e178=="30+"|dat$e178=="Occasionally"|dat$e178=="A lot"] <- 1 # smoked in third trimester according according to e178
dat$mat.smoke.3 <- NA
dat$mat.smoke.3[which(dat$mat.smoke.3.C==1)] <-1
dat$mat.smoke.3[which(dat$mat.smoke.3.E==1)] <-1
dat$mat.smoke.3[which(dat$mat.smoke.3.C==0 & dat$mat.smoke.3.E!=1)] <-0
dat$mat.smoke.3[which(dat$mat.smoke.3.E==0 & dat$mat.smoke.3.C!=1)] <-0
#Any (3 categories)
dat$mat.smoke <- NA
dat$mat.smoke[dat$mat.smoke.1==0 & dat$mat.smoke.2==0 & dat$mat.smoke.3==0] <- 0 # No smoking in pregnancy
dat$mat.smoke[dat$mat.smoke.1==1 & dat$mat.smoke.2==0 & dat$mat.smoke.3==0] <- 1 # Quit before second trimester
dat$mat.smoke[dat$mat.smoke.1==1 & (dat$mat.smoke.2==1|dat$mat.smoke.3==1)] <- 2 # Smoked throughout pregnancy (allowing for NAs in second or third trimester)
#Sustained (2 categories)
dat$mat.smoke.binary <- NA
dat$mat.smoke.binary[dat$mat.smoke==2] <- 1 # Sustained smoking
dat$mat.smoke.binary[dat$mat.smoke==0 | dat$mat.smoke==1] <- 0 # No/early smoking
dat$mat.active.smoking <- dat$mat.smoke.binary #giving it the name we're using in PACE

#maternal passive smoke exposure (in non-smokers during pregnancy)
dat$mat.smoke.passive <- NA
dat$mat.smoke.passive[dat$mat.smoke==0 & dat$c481a=="1"] <- 0 #No exposure
dat$mat.smoke.passive[dat$mat.smoke==0 & (dat$c481a=="2" | dat$c481a=="3") ] <- 1 #Any exposure
dat$mat.passive.smoking <- dat$mat.smoke.passive #giving it the name we're using in PACE

# Paternal smoking (smoking during pregnancy or <=3 months before conception or no smoking in those times)
dat$pat.smoke <- NA
dat$pat.smoke[dat$pb077==1]<-0 #hasn't smoked regularly in last 9 months (sent at 18 weeks gestation)
dat$pat.smoke[dat$pb077>1]<-1 #has smoked regularly in last 9 months (sent at 18 weeks gestation)
dat$pat.active.smoking <- dat$pat.smoke #giving it the name we're using in PACE

#age father started smoking
dat$pat.smoke.age <- NA
dat$pb072[dat$pb072<0]<-NA
dat$pat.smoke.age[dat$pb072>11] <- 0
dat$pat.smoke.age[dat$pb072<=11] <- 1

#amount of paternal smoking at beginning of pregnancy
dat$pat.smoke.amount <- NA
dat$pat.smoke.amount[dat$pb078=="30"] <- 7
dat$pat.smoke.amount[dat$pb078=="25"] <- 6
dat$pat.smoke.amount[dat$pb078=="20"] <- 5
dat$pat.smoke.amount[dat$pb078=="15"] <- 4
dat$pat.smoke.amount[dat$pb078=="10"] <- 3
dat$pat.smoke.amount[dat$pb078=="5"] <- 2
dat$pat.smoke.amount[dat$pb078=="1"] <- 1
dat$pat.smoke.amount[dat$pb078=="0"] <- 0
dat$pat.smoke.amount[dat$pat.smoke==0 & dat$pat.smoke.amount>0] <- NA 
dat$pat.smoke.amount[dat$pat.smoke==1 & dat$pat.smoke.amount==0] <- NA 

# Sex
dat$sex <-NA
dat$sex[dat$kz021==1] <- 1 #male
dat$sex[dat$kz021==2] <- 0 #female

# Gestational age
dat$gest.age <- dat$bestgest

# Select just the variables of interest
dat<-dat[,c("aln","sex","mat.ses","mat.age","mat.smoke","gest.age")] 

# Save 
write.csv(dat,row.names=FALSE,file="C:/Users/ca16591/Dropbox/Bristol/phenofile.alspac.csv")

##########################
#Merge anxiety_and_medication_variables and 'dat' (the other phenotype data minus birth weight)
##########################
pheno <- merge(anxiety_and_medication_variables,dat, by="aln")
head(pheno)

# Save 
write.csv(pheno,row.names=FALSE,file="C:/Users/ca16591/Dropbox/Bristol/complete.phenofile.alspac.csv")

##########################
#Try to find the birth weight in grams variables from the kz file
#"Preferred birthweight" 'kz030b'
#"Birthweight from obst data" 'kz030d'
#"Birthweight from ALSPAC measurers" 'kz031'
#'kz030d' maybe the most complete

##########################
setDataDir("R:/Data/Current/Other/Sample Definition")

#bw<-read.spss("R:/Data/Current/Other/Sample Definition/kz_5b.sav",to.data.frame = TRUE)#Select 
bw<-read.dta("R:/Data/Current/Other/Sample Definition/kz_5b.dta")#Select 
#attr(bw, "variable.labels")
bw_selection<-bw[,c('aln','kz030')]

bw_selection$bw <- bw_selection$kz030

head(bw_selection$bw)
hist(bw_selection$bw)
bw_selection$bw[bw_selection$bw==-10 |bw_selection$bw==-11 |bw_selection$bw==-1] <- NA
summary(bw_selection$bw)

##########################
#Merge pheno and bw 
##########################
pheno <- merge(pheno,bw_selection, by="aln")
head(pheno, n=50)
table(pheno$bw)
str(pheno)
length(pheno$bw)
length(pheno$sex)

# exclude variables 'kz030'
myvars <- names(pheno) %in% c('kz030') 
pheno <- pheno[!myvars]

colnames(pheno)
pheno$mat.age <- as.numeric(pheno$mat.age)

# Save 
write.csv(pheno,row.names=FALSE,file="C:/Users/ca16591/Dropbox/Bristol/complete.bw.phenofile.alspac.csv")

pheno3=pheno
##########################
# Remove withdrawn consent
##########################
vars <- c("alnqlet", "aln","any_medication_binary", 
          "continuous_anx_score", "dichotomous_anx_score", "sex", 
          "mat.ses","mat.age","mat.smoke","gest.age","bw")
colnames(pheno)

#Kids
rm_child_aln<-#based on R:\Data\Syntax\Withdrawal of consent\child_based_WoC_020715.do
  c('32778','32803','39444','53228','54074','34657','32230','47080',
    '36194','34688','30006','47430','38685','47430','38685','30439',
    '47501','46814','38666','39400','53032','50035')

#Mums
rm_mother_aln<-#based on R:\Data\Syntax\Withdrawal of consent\mother_WoC_020715.do
  c('31075','32812','42568','35366','51798','38666')

##Set all values to NA
pheno[which(pheno$aln%in%c(rm_mother_aln,rm_child_aln)),which(names(pheno)%in%vars)]<-NA

##########################
#Change non-numeric continuous variable to numeric
##########################
#pheno$bw <- as.numeric(as.factor(pheno$bw))
pheno$mat.age <- as.numeric(pheno$mat.age)
pheno$gest.age <- as.numeric(pheno$gest.age)

colnames(pheno)[3] <- "psych.meds"
colnames(pheno)[4] <- "anx.score"
colnames(pheno)[5] <- "anx.dichot"

# Save 
write.csv(pheno,row.names=FALSE,file="C:/Users/ca16591/Dropbox/Bristol/complete.bw.phenofile.alspac.csv")

##########################
#Remove all non-complete observations
##########################
pheno.complete=read.csv("C:/Users/ca16591/Dropbox/Bristol/complete.bw.phenofile.alspac.csv")
pheno.complete <- na.omit(pheno.complete)
dim(pheno)
dim(pheno.complete)

pheno.complete.bf.winsor <- pheno.complete
head(pheno.complete.bf.winsor)
dim(pheno.complete.bf.winsor)
# Save 
write.csv(pheno.complete.bf.winsor,row.names=FALSE,file="C:/Users/ca16591/Dropbox/Bristol/bf.winsor.complete.no.missings.bw.phenofile.alspac.csv")

##########################
#Get the ancestry PCs
##########################
setDataDir("R:/Data/Useful_data/Ancestry_PCA/children") # to access the 'b' and 'c' questionnaire data
pca<-read.dta("R:/Data/Useful_data/Ancestry_PCA/children/alspac10k_pca.dta")#Select 
#attr(bw, "variable.labels")
head(pca)

#Merge pcas with main phenofile

pheno=read.csv("C:/Users/ca16591/Dropbox/Bristol/bf.winsor.complete.no.missings.bw.phenofile.alspac.csv")
dim(pheno)
pheno <- merge(pheno,pca, by="aln")
head(pheno, n=50)
str(pheno)
dim(pheno)
pca_pheno=pheno
str(pca_pheno)
dim(pca_pheno)

#Vector of variables to summarize
myVars <- c("psych.meds", "anx.score", "anx.dichot", "sex", "mat.ses", 
            "mat.age", "mat.smoke", "gest.age", "bw")

# Save 
write.csv(pca_pheno,row.names=FALSE,file="C:/Users/ca16591/Dropbox/Bristol/pca_pheno.alspac.csv")
write.csv(pca_pheno,row.names=FALSE,file = "M:/data/protect/_devs/PROTECT_Clinical/data/PACE/pca_pheno.alspac.csv")
