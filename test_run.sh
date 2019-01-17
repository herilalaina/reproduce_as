dir=log_output  # working directory
test_dir=test_output
task_ids="3 6 11 12 14 15 16 18 20 21 22 23 24 28 29 31 32 36 37 41 43 45 49 53 58 219 2074 2079 3021 3022 3481 3485 3492 3493 3494 3510 3512 3543 3549 3560 3561 3567 3573 3889 3891 3896 3899 3902 3903 3904 3913 3917 3918 3946 3948 3954 7592 9914 9946 9950 9952 9954 9955 9956 9957 9960 9964 9967 9968 9970 9971 9976 9977 9978 9979 9980 9981 9983 9985 9986 10093 10101 14964 14965 14966 14967 14968 14969 14970 34537 34538 34539 125920 125921 125922 125923 146195 146606 146607"
#task_ids=$(python get_tasks.py)
#task_ids="167149"
seeds="1" #2 3 4 5 6 7 8 9 10"
#seeds="1"

rm -r test_commands.txt

# Create commands
echo "creating test files..."
echo $task_ids
echo $seeds
for seed in $seeds; do
    for task_id in $task_ids; do
        for model in vanilla; do #ensemble metalearning meta_ensemble; do
            #cmd="python run_auto_sklearn.py --working-directory $test_dir --task-id $task_id \
            #-s $seed --output-file score_$model.csv --model $model"
            cmd="$model $seed $task_id"
            echo $cmd >> test_commands.txt
        done
    done
done
echo "creating tesst files done"

# run all commands. TODO: We do this with cluster!
# bash test_commands.txt
#bash test_run_all.sh
