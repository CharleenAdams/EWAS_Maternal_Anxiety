#!/bin/bash
#
#
#PBS -l nodes=1:ppn=1,walltime=12:00:00

WORK_DIR="/panfs/panasas01/sscm/ca16591/EWAS/pace_mat_anx"

module add languages/R-3.3


cd $WORK_DIR

R CMD BATCH --no-save --no-restore '--args anx.contwins andrews-and-bakulski Cells Phenofile B cord mat.age.wins,mat.ses,sex,bw.wins,gest.age,mat.smoke,psych.meds,pc1,pc2,pc3,pc4,pc5,pc6,pc7,pc8,pc9,pc10 /panfs/panasas01/sscm/ca16591/EWAS/' /panfs/panasas01/sscm/ca16591/Common_files/meffil_EWAS_script.r /panfs/panasas01/sscm/ca16591/EWAS/pace_mat_anx/ewas_results/mat_anx_score2.out
