sbatch -C knl -A m4075 -q regular -t 30 -N 512 ./sbatch_cori-knl.sh 512 1 conda_0512_01.csv ./conda.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 512 ./sbatch_cori-knl.sh 512 68 conda_0512_68.csv ./conda.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 1024 ./sbatch_cori-knl.sh 1024 1 conda_1024_01.csv ./conda.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 1024 ./sbatch_cori-knl.sh 1024 68 conda_1024_68.csv ./conda.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 2048 ./sbatch_cori-knl.sh 2048 1 conda_2048_01.csv ./conda.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 2048 ./sbatch_cori-knl.sh 2048 68 conda_2048_68.csv ./conda.sh
