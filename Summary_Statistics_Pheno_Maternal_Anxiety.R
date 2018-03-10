###################################################################################################################
###################################################################################################################
#####                                Maternal Anxiety EWAS Phenotype Summary Statistics                       #####
#####                                  Compiled 03/09/2018 by Analyst Charleen Adams                          #####
#####                                                                                                         #####
###################################################################################################################
###################################################################################################################
#setwd("~/Dropbox/Bristol") #home
setwd("C:/Users/ca16591/Dropbox/Bristol") #Oakfield

#Load and install packages
pkg <- c("dplyr", "knitr", "devtools", "DT", "xtable", "psych", "tableone", "plyr", "robustHD", "devtools")
new.pkg <- pkg[!(pkg %in% installed.packages())]
library("knitr")
library("DT")
library("xtable")
library(Hmisc)
library(tableone)
library(psych)
library(plyr)
library(dplyr)
library(devtools)
#devtools::install_github("explodecomputer/alspac")
library(alspac)

##########################
#Read-in the phenofile created by merging the ALSPAC phenotype file (created with "2018-02-26_Charleen_PACE_phenotype_file.R")
#and merged in BlueCrystal with the methylation data
##########################
pheno <- read.csv("M:/data/protect/_devs/PROTECT_Clinical/data/PACE/MergedMethylationALN_Phenofile.csv")
head(pheno)
dim(pheno)


##########################
#Summary stats with tableone package before and after winsorizing
##########################
CreateTableOne(data = pheno)

#Vector of variables to summarize
myVars <- c("psych.meds", "anx.score", "anx.dichot", "sex", "mat.ses", 
            "mat.age", "mat.smoke", "gest.age", "bw")
#Vector of factor variables to summarize
CatVars <- c("psych.meds", "anx.dichot", "sex", "mat.ses", 
             "mat.smoke")

tab2 <- CreateTableOne(vars=myVars, data=pheno, factorVars = CatVars)
#print(tab2, showAllLevels =TRUE)
pheno.complete=pheno

#summary(tab2)
#str(pheno)

tab.complete <- CreateTableOne(vars=myVars, data=pheno.complete, factorVars = CatVars)
summary(tab.complete)

##########################
#Remove duplicate Sample_Numbers
head(pheno.complete)
pheno.complete <- pheno.complete[c(-1)]
duplicates=duplicated(pheno.complete[,1], incomparables=FALSE)
table(duplicates)
pheno.complete$dups=as.numeric(duplicates)
head(pheno.complete$dups)
pheno.complete<- pheno.complete[-which(pheno.complete$dups==1), ]
dim(pheno.complete)

colnames(pheno.complete2)


##########################
#Winsorizing
##########################
#library for the function to winsorize values beyond mean + 3SD. 
library("robustHD")
#function for details of winsorized variable 
detailwins <- function(x) {
  x<-x[!is.na(x)] 
  lowCutoff <- mean(x) - 3*sd(x) #low cutoff
  uppCutoff <- mean(x) + 3*sd(x) #upp cutoff 
  bottomwinsorized <- length(which (x< (mean(x) - 3*sd(x)))) #number winsorized observations bottom 
  topwinsorized <-length(which (x> (mean(x) + 3*sd(x)))) #number winsorized observations top 
  detailswinsorization <- rbind(lowCutoff, uppCutoff, bottomwinsorized, topwinsorized)
  detailswinsorization <- round(detailswinsorization,3)
  detailswinsorization
}

#winsorizing covariates pheno
pheno.complete[c("bw.wins","gest.wins", 
                 "mat.age.wins")] <- lapply(pheno.complete[c("bw","gest.age", "mat.age")], function(x)
                   winsorize(x,centerFun = mean, scaleFun = sd, const = 3))
#winsorization of maternal general anxiety 
#creating the function to winsorize only values beyond mean + 3SD (the previous function produces very small negative values in anxiety)
win3SD <- function(x) {
  z<- function(y) { ifelse(y>(mean(y, na.rm = T) + 3*sd(y, na.rm = T)),(mean(y, na.rm = T) + 3*sd(y, na.rm = T)),y)}
  ifelse(is.na(x), NA, z(x))
}

pheno.complete$anx.contwins <- win3SD(pheno.complete$anx.score) #winsorizing top anxiety values

#details winsorization 
lapply(pheno.complete[c('bw',"gest.age", "mat.age", "anx.score")], function(x)
  detailwins(x))
#checking winsorization 
describe(pheno.complete[c("bw","bw.wins","gest.age", "gest.wins", 
                          "mat.age", "mat.age.wins", "anx.score","anx.contwins")])

#Look at the outliers for the continuous variables
describe(pheno.complete[c("bw.wins")])
hist(pheno.complete$bw)
hist(pheno.complete$gest.age)
describe(pheno.complete$gest.age)
hist(pheno.complete$anx.score)
describe(pheno.complete$anx.score)
hist(pheno.complete$mat.age)
describe(pheno.complete$mat.age)

head(pheno.complete, n=2)
str(pheno.complete)
colnames(pheno.complete)

#Remove "Sample_Name"
pheno.complete <- pheno.complete[c(-23)]
winsor.pheno <- pheno.complete
head(winsor.pheno, n=1)
dim(winsor.pheno)

# Save 
write.csv(pheno.complete,row.names=FALSE,file="C:/Users/ca16591/Dropbox/Bristol/meth_merged_winsor_phenofile.csv")
write.csv(winsor.pheno,row.names=FALSE,file = "M:/data/protect/_devs/PROTECT_Clinical/data/PACE/meth_merged_winsored.pheno2.csv")

# Save RData
saveRDS(winsor.pheno, file = "C:/Users/ca16591/Dropbox/Bristol/meth_merged_winsored.pheno.RData")
saveRDS(winsor.pheno, file = "M:/data/protect/_devs/PROTECT_Clinical/data/PACE/meth_merged_winsored.pheno.RData")
##########################
# Set up for Characteristics table (file 6)
##########################
setwd("C:/Users/ca16591/Dropbox/Bristol") #Oakfield
win_pheno <- readRDS("meth_merged_winsored.pheno.RData")
#load("SpecificAnxiety.data.Rdata")
describe(win_pheno)
head(win_pheno)
x=win_pheno
x$anx_general_contwins <- x$anx.contwins
x$GenderMale <- x$sex
x$maternalagewins <- x$mat.age
x$anxdich <- x$anx.dichot
x$weightwins <- x$bw.wins
x$gestationalagewins <- x$gest.wins
x$SES <- x$mat.ses

colnames(x)
#describe(SpecificAnxiety.data)

##########################
# Characteristics table (file 6)
#ONLY GIVES ESTIMATES FOR SES IF CONTINUOUS AND NUMERIC. Alter if SES is categorical.
#assumes no anx or anx specific data in each specific dataset 
##########################
Charateristicsfunction<- function(x) { 
  n <- length(x$aln) 
  meananx <- ifelse(!is.null(x$anx_general_contwins), mean(x$anx_general_contwins), NA)
  sdanx <- ifelse(!is.null(x$anx_general_contwins), sd(x$anx_general_contwins), NA)
  minanx <- ifelse(!is.null(x$anx_general_contwins), min(x$anx_general_contwins), NA)
  maxanx <- ifelse(!is.null(x$anx_general_contwins), max(x$anx_general_contwins), NA)
  skewanx <- ifelse(!is.null(x$anx_general_contwins), skew(x$anx_general_contwins), NA)
  highanx <- ifelse(!is.null(x$anxdich), sum(x$anxdich==1), NA) #high anx 
  lowanx <- ifelse(!is.null(x$anxdich), sum(x$anxdich==0), NA) #low anx 
  anxpart <- rbind(n, meananx, sdanx, minanx,  maxanx, skewanx, highanx, lowanx)
  nfemales <-sum(x$GenderMale==0)
  nmales <-sum(x$GenderMale==1)
  meanmaternalage <- mean(x$maternalagewins) 
  sdmaternalage <-  sd(x$maternalagewins)
  minmaternalage <- min(x$maternalagewins)
  maxmaternalage <- max(x$maternalagewins)
  x$msmoke_no <- ifelse(x$mat.smoke ==0, 1, 0 )
  nsmokenever <-sum(x$msmoke_no==1)
  nmsmoke_early <-sum(x$mat.smoke==1)
  nmsmoke_throughout  <-sum(x$mat.smoke ==2)
  meanweight <- mean(x$weightwins) 
  sdweight <-  sd(x$weightwins)
  minweight <- min(x$weightwins)
  maxweight <- max(x$weightwins)
  meangestationalage <- mean(x$gestationalagewins) 
  sdgestationalage <-  sd(x$gestationalagewins)
  mingestationalage <- min(x$gestationalagewins)
  maxgestationalage <- max(x$gestationalagewins)
  onpsych.meds <- sum(x$psych.meds==1)
  lowSES <- sum(x$SES==0) #low SES
  Tabledescriptives <- rbind(anxpart, nfemales,nmales, meanmaternalage, sdmaternalage,
                             minmaternalage, maxmaternalage, nsmokenever, nmsmoke_early, 
                             nmsmoke_throughout, meanweight, sdweight, minweight,maxweight,
                             meangestationalage, sdgestationalage, mingestationalage, maxgestationalage,
                             onpsych.meds, lowSES) #putting everything in a table
  Tabledescriptives <- round(Tabledescriptives,2)
  Tabledescriptives 
}

#for models 1,2,4,5
#table1.2.4.5 <- Charateristicsfunction(GeneralAnxiety.data)
table1.2.4.5 <- Charateristicsfunction(x)
CharacteristicsTable <- table1.2.4.5
CharacteristicsTable
#putting tables together
CharacteristicsTable <- cbind(table1.2.4.5, table3.6, table7.8.10.11, table9.12)
CharacteristicsTable <- as.data.frame(CharacteristicsTable)
colnames(CharacteristicsTable) <- c("model1.2.4.5", "model3.6", "model7.8.10.11", "model9.12")
CharacteristicsTable
GeneralAnxiety.data=x

#save as CSV file. ADAPT NAME TO YOUR COHORT. 
write.csv(CharacteristicsTable, file = "Phenofile_Characteristics_2018-09-03.csv")

##########################################################################################
# Frequency table of anxiety measure (file 7)
# Please use the data with the maximal number of participants in the analyses.
library(plyr)
AnxietyFrequencyTable = count(GeneralAnxiety.data, 'anx_general_contwins')
#save as CSV file. ADAPT NAME TO YOUR COHORT. 
write.csv(AnxietyFrequencyTable, file = "ALSPAC_EXPOSURE_Frequencies_2018-09-03.csv")

##########################################################################################
# Correlations table (file 8) 
#getting p vals 
names(GeneralAnxiety.data)
cor_and_pvalsGeneralAnx<- rcorr(as.matrix(GeneralAnxiety.data[ ,c("anx_general_contwins", "maternalagewins", "weightwins", "gestationalagewins")]))
cor_and_pvalsGeneralAnx$r
cor_and_pvalsGeneralAnx$P
#table with values and * if p val < 0.05 
cor_and_pvalsGeneralAnxTable<- ifelse(cor_and_pvalsGeneralAnx$P<0.05, paste(round(cor_and_pvalsGeneralAnx$r,3),"*"), round(cor_and_pvalsGeneralAnx$r, 3))
cor_and_pvalsGeneralAnxTable
#save as CSV file 
write.csv(cor_and_pvalsGeneralAnxTable, file = "ALSPAC_Anxiety_Correlations_2018-09-03.csv")

##########################################################################################

##########################################################################################
# Comparisons table  (file 9)
#Comparison between those with low vs high anxiety 
names(GeneralAnxiety.data)

comparisontablefunction <- function(x) { 
  lowanxgroup <- subset(x[x$anxdich == 0, ]) 
  highanxgroup <- subset(x[x$anxdich == 1, ]) 
  descriptivessubsets <- function(x) {
    nfemales <-sum(x$GenderMale==0)
    nmales <-sum(x$GenderMale==1)
    lowSES <-sum(x$SES==0)
    highSES <-sum(x$SES==1)
    meanmaternalage <- mean(x$maternalagewins) 
    sdmaternalage <-  sd(x$maternalagewins)
    minmaternalage <- min(x$maternalagewins)
    maxmaternalage <- max(x$maternalagewins)
    nmsmoke_no <- ifelse(x$mat.smoke ==0, 1, 0 )
    nmsmoke_no <-sum(x$msmoke_no==1)
    nmsmoke_early <-sum(x$mat.smoke==1)
    nmsmoke_throughout  <-sum(x$mat.smoke ==2)
    meanweight <- mean(x$weightwins) 
    sdweight <-  sd(x$weightwins)
    minweight <- min(x$weightwins)
    maxweight <- max(x$weightwins)
    meangestationalage <- mean(x$gestationalagewins) 
    sdgestationalage <-  sd(x$gestationalagewins)
    mingestationalage <- min(x$gestationalagewins)
    maxgestationalage <- max(x$gestationalagewins)
    #to account for medication missing in some samples:
    meanpsych.meds <- mean(x$psych.meds) 
    sdpsych.meds <-  sd(x$psych.meds)
    minpsych.meds <- min(x$psych.meds)
    maxpsych.meds <- max(x$psych.meds)
    #putting things together
    tabledescriptivessubset <- rbind(nfemales, nmales, lowSES, highSES, meanmaternalage, sdmaternalage,
                                     minmaternalage, maxmaternalage, nmsmoke_no, nmsmoke_early, nmsmoke_throughout, meanweight, sdweight,minweight, maxweight, meangestationalage, 
                                     sdgestationalage, mingestationalage, maxgestationalage, meanpsych.meds, sdpsych.meds, minpsych.meds, maxpsych.meds)
    tabledescriptivessubset}
  tabledescriptivessubsetlowanx <- descriptivessubsets(lowanxgroup)
  tabledescriptivessubsethighanx <- descriptivessubsets(highanxgroup)
  tabledescriptivescomplete <- cbind(tabledescriptivessubsetlowanx, tabledescriptivessubsethighanx)
  tabledescriptivescomplete <- round(tabledescriptivescomplete, 2)
  tabledescriptivescomplete <- as.data.frame(tabledescriptivescomplete)
  colnames(tabledescriptivescomplete) <- c( "Lowanxietygroup", "Highanxietygroup")
  tabledescriptivescomplete
}

#apply function to your data 
ComparisonsAnxietyTable <- comparisontablefunction(GeneralAnxiety.data)  
ComparisonsAnxietyTable

#save file as csv. ADAPT NAME TO YOUR COHORT. 
write.csv(ComparisonsAnxietyTable, file = "ALSPAC_Anxiety_Comparisons_2018-09-03.csv")
#checking
describe(GeneralAnxiety.data[GeneralAnxiety.data$anxdich == 0, ])
describe(GeneralAnxiety.data[GeneralAnxiety.data$anxdich == 1, ])
table(GeneralAnxiety.data$anxdich)
table(GeneralAnxiety.data$mat.smoke==1, GeneralAnxiety.data$anxdich)
