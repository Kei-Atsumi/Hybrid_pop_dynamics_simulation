#!/bin/bash
#PBS -N KF
#PBS -q blade
#PBS -l nodes=1:ppn=1,mem=4gb,walltime=8:00:00

find /lustre/k.atsumi/Result/quant* -name "Gen*_markers.txt" -or -name "Gen*_genes.txt" -or -name "Gen*_natselprobdump.txt" -or -type f -empty -delete
