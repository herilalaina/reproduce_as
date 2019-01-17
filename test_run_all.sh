#!/bin/bash
declare -i var=0

while read MODEL SEED TASK; do
    echo "$MODEL $SEED $TASK"
    case $((var%3)) in
    0)
        qsub -q day.q one_run_autosklearn.sh $MODEL $SEED $TASK;
        ;;
    1)
        qsub -q batch.q one_run_autosklearn.sh $MODEL $SEED $TASK;
        ;;
    2)
        qsub -q short.q one_run_autosklearn.sh $MODEL $SEED $TASK;
        ;;
    #3)
    #    qsub -q day64.q one_run_autosklearn.sh $MODEL $SEED $TASK;
    #    ;;
    esac
    var=$var+1
done < test_commands.txt
