#!/bin/bash
#PBS -N hyb_flip_dis_unlink
#PBS -q blade
#PBS -l nodes=1:ppn=16,mem=96gb,walltime=48:00:00
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
 Y=`echo "$Y + 0.0001" | bc`
 let COUNTERB=COUNTERB+1
 # Change random seed ($X->$Y) and output folder (${COUNTERA}->${COUNTERB})
 # Run simulation 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0h0.5.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0h0.5.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0h0.6.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0h0.6.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0h0.7.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0h0.7.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0.1h0.5.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0.1h0.5.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0.1h0.6.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0.1h0.6.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0.1h0.7.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0.1h0.7.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0.4h0.5.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0.4h0.5.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0.4h0.6.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0.4h0.6.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0.4h0.7.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0.4h0.7.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0.8h0.5.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0.8h0.5.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0.8h0.6.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0.8h0.6.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_flip_b0.8h0.7.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_flip_b0.8h0.7.cfg & 
 wait
 # Make new random seed and iteration value
 X=`echo "$X + 0.0001" | bc`
 let COUNTERA=COUNTERA+1
done
find /lustre/k.atsumi/Result/dis_unlink_flip* -name "Gen*_markers.txt" -or -name "Gen*_genes.txt" -or -name "Gen*_natselprobdump.txt" -or -type f -empty -delete #Erase unuse files 
