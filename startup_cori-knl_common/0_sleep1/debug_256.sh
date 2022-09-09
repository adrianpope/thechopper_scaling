sbatch -C knl -A m4075 -q debug -t 10 -N 256 ./sbatch_cori-knl.sh 256 1 sleep1_0256_01.csv ./sleep1.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 256 ./sbatch_cori-knl.sh 256 68 sleep1_0256_68.csv ./sleep1.sh
