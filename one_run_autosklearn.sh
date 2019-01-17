#!/bin/bash
#$ -cwd
#$ -j y
#d$ -o /dev/null
#$ -l h_rt=1:30:00
#$ -l h_vmem=5G

ulimit -c 0

python run_auto_sklearn.py --working-directory /scratch/hrakotoa/test_output --task-id $3 -s $2 --output-file score_$1.csv --model $1
