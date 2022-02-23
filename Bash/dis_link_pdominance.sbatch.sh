#!/bin/bash
#PBS -N hyb_pdominance_dis_link
#PBS -q blade
#PBS -l nodes=1:ppn=4,mem=90gb,walltime=48:00:00
module load gcc
REPS=101
COUNTERA=0
COUNTERB=0
X=.1356
Y=.1356
while [ $COUNTERA -lt $REPS ]; do
 echo "$COUNTERA"
 Y=`echo "$Y + 0.0001" | bc`
 sed -i -e "s/$X/$Y/g" /lustre/k.atsumi/Config/dis_link_pdominance_natsel0.1.cfg
 sed -i -e "s/$X/$Y/g" /lustre/k.atsumi/Config/dis_link_pdominance_natsel0.3.cfg
 sed -i -e "s/$X/$Y/g" /lustre/k.atsumi/Config/dis_link_pdominance_natsel0.7.cfg
 sed -i -e "s/$X/$Y/g" /lustre/k.atsumi/Config/dis_link_pdominance_natsel1.cfg
 let COUNTERB=COUNTERB+1
 sed -i -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_link_pdominance_natsel0.1.cfg
 sed -i -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_link_pdominance_natsel0.3.cfg
 sed -i -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_link_pdominance_natsel0.7.cfg
 sed -i -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /lustre/k.atsumi/Config/dis_link_pdominance_natsel1.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_link_pdominance_natsel0.1.cfg &
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_link_pdominance_natsel0.3.cfg &
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_link_pdominance_natsel0.7.cfg &
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/dis_link_pdominance_natsel1.cfg &
 X=`echo "$X + 0.0001" | bc`
 let COUNTERA=COUNTERA+1
done
