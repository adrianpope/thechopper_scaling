sbatch -C knl -A m4075 -q regular -t 30 -N 512 ./sbatch_cori-knl.sh 512 1 sleep1_0512_01.csv ./sleep1.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 512 ./sbatch_cori-knl.sh 512 68 sleep1_0512_68.csv ./sleep1.sh
