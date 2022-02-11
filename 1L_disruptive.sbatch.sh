#!/bin/bash
#SBATCH -p general
#sbatch -J 1
#SBATCH -N 1
#SBATCH -t 2-0
#SBATCH --mem=10g
#SBATCH -n 1
#SBATCH -e d1000_1_2000%j.err
#SBATCH --mail-type=FAIL --mail-user=k.atsumi115@gmail.com

#we are going to do from repetition 1 to 100
# X is going to be the first random seed value, its decimal because random seeds are between 0 and 1. If there is an existing one, let X be the newest one.
# Y is goin to be the new randmon seed value; let it have the same value as X here

#GNUコンパイラ
module load gcc

REPS=11
COUNTERA=0
COUNTERB=0
X=.1356
Y=.1356

# -lt : less than
#$COUNTER<$REPSである限り繰り返す
while [ $COUNTERA -lt $REPS ]; do

   echo "$COUNTERA"

   #新Random seed値をYに代入
   #bc : 小数を扱える計算処理コマンド。echo 計算式 | bc
   Y=`echo "$Y + 0.0001" | bc`

   echo $Y

   #ConfigファイルのRandom seedを書き換え
   sed -i -e "s/$X/$Y/g" /mnt/c/Users/katsu/Dropbox/5_Simulation/Config_5chrom/simul_1L_disruptive.cfg

   let COUNTERB=COUNTERB+1
   #Configファイルの出力先フォルダを書き換え
   #rep{Number}dir → rep{Number+1}dir
   sed -i -e "s/rep${COUNTERA}dir/rep${COUNTERB}dir/g" /mnt/c/Users/katsu/Dropbox/5_Simulation/Config_5chrom/simul_1L_disruptive.cfg

   echo $X

   #Run simulation
   /mnt/c/Softwares/admixem/bin/admixemp /mnt/c/Users/katsu/Dropbox/5_Simulation/Config_5chrom/simul_1L_disruptive.cfg

   #X becomes the next random seed number
   X=`echo "$X + 0.0001" | bc`

   #COUNTERを1つ進める
   #let : 整数のみの四則演算や論理演算を含む算術式を評価
   let COUNTERA=COUNTERA+1

done
wait
