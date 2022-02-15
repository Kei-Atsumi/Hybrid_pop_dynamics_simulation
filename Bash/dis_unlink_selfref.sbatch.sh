#!/bin/bash
#PBS -N hybrid_simulation
#PBS -q blade
#PBS -l nodes=1:ppn=3,mem=50gb,walltime=96:00:00
module load gcc
REPS=101
COUNTERA=0
COUNTERB=0
X=.1356
Y=.1356
while [ $COUNTERA -lt $REPS ]; do
 echo "$COUNTERA"
 Y=`echo "$Y + 0.0001" | bc`
 echo $Y
 sed -i -e "s/$X/$Y/g" /lustre/k.atsumi/Config/dis_unlink_selfref_natsel0.1.cfg
 sed -i -e "s/$X/$Y/g" /lustre/k.atsumi/Config/dis_unlink_selfref_natsel0.4.cfg
 sed -i -e "s/$X/$Y/g" /lustre/k.atsumi/Config/dis_unlink_selfref_natsel0.7.cfg
 sed -i -e "s/$X/$Y/g" /lustre/k.atsumi/Config/dis_unlink_selfref_natsel1.cfg
 let COUNTERB=COUNTERB+1
 sed -i -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_selfref_natsel0.1.cfg
 sed -i -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_selfref_natsel0.4.cfg
 sed -i -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_selfref_natsel0.7.cfg
 sed -i -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_unlink_selfref_natsel1.cfg
 echo $X
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_selfref_natsel0.1.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_selfref_natsel0.4.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_selfref_natsel0.7.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_unlink_selfref_natsel1.cfg
 X=`echo "$X + 0.0001" | bc`
 let COUNTERA=COUNTERA+1
done
wait
