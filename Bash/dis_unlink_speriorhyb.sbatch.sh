#!/bin/bash
#PBS -N hyb_speriorhyb_dis_unlink
#PBS -q blade
#PBS -l nodes=1:ppn=16,mem=128gb,walltime=48:00:00
module load gcc
# Repetition 1 to 100
REPS=101
# X: first random seed value, its decimal because random seeds are between 0 and 1. If there is an existing one, let X be the newest one.
# Y: new randmon seed value; let it have the same value as X here
X=.1356
Y=.1356
# COUNTERA, first iteration name; COUNTERB, new iteration name
COUNTERA=0
COUNTERB=0
while [ $COUNTERA -lt $REPS ]; do
 echo "$COUNTERA"
 Y=`echo "$Y + 0.0001" | bc`
 let COUNTERB=COUNTERB+1
 # Change random seed ($X->$Y) and output folder (${COUNTERA}->${COUNTERB})
 # Run simulation 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0h0.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0h0.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0h0.1.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0h0.1.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0h0.4.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0h0.4.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0h0.8.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0h0.8.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.1h0.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.1h0.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.1h0.1.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.1h0.1.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.1h0.4.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.1h0.4.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.1h0.8.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.1h0.8.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.4h0.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.4h0.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.4h0.1.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.4h0.1.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.4h0.4.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.4h0.4.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.4h0.8.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.4h0.8.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.8h0.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.8h0.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.8h0.1.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.8h0.1.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.8h0.4.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.8h0.4.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.8h0.8.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_speriorhyb_b0.8h0.8.cfg & 
 wait
 Make new random seed and iteration value
 X=`echo "$X + 0.0001" | bc`
 let COUNTERA=COUNTERA+1
done 
