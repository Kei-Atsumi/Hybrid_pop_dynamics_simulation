
#!/bin/bash
#PBS -N hyb_obl_negat_quant
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
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.05h0.05.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.05h0.05.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.05h0.01.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.05h0.01.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.05h0.005.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.05h0.005.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.05h0.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.05h0.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.01h0.05.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.01h0.05.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.01h0.01.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.01h0.01.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.01h0.005.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.01h0.005.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.01h0.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.01h0.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.005h0.05.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.005h0.05.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.005h0.01.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.005h0.01.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.005h0.005.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.005h0.005.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0.005h0.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0.005h0.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0h0.05.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0h0.05.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0h0.01.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0h0.01.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0h0.005.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0h0.005.cfg & 
 sed -i -e "s/$X/$Y/g" -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" -e "s/quant_random${COUNTERA}/quant_random${COUNTERB}/g" /lustre/k.atsumi/Config/quant_obl_negat_b0h0.cfg
 /lustre/k.atsumi/admixem/bin/admixemp /lustre/k.atsumi/Config/quant_obl_negat_b0h0.cfg & 
 wait
 # Make new random seed and iteration value
 X=`echo "$X + 0.0001" | bc`
 let COUNTERA=COUNTERA+1
done
find /lustre/k.atsumi/Result/quant_obl_negat* -name "Gen*_markers.txt" -or -name "Gen*_genes.txt" -or -name "Gen*_natselprobdump.txt" -or -type f -empty -delete #Erase unuse files 
