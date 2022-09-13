sbatch -C knl -A m4075 -q regular -t 30 -N 1024 ./sbatch_cori-knl.sh 1024 1 sleep1_1024_01.csv ./sleep1.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 1024 ./sbatch_cori-knl.sh 1024 68 sleep1_1024_68.csv ./sleep1.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 2048 ./sbatch_cori-knl.sh 2048 1 sleep1_2048_01.csv ./sleep1.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 2048 ./sbatch_cori-knl.sh 2048 68 sleep1_2048_68.csv ./sleep1.sh
