sbatch -C knl -A m4075 -q debug -t 10 -N 64 ./sbatch_cori-knl.sh 64 1 sleep1_0064_01.csv ./sleep1.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 64 ./sbatch_cori-knl.sh 64 68 sleep1_0064_68.csv ./sleep1.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 128 ./sbatch_cori-knl.sh 128 1 sleep1_0128_01.csv ./sleep1.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 128 ./sbatch_cori-knl.sh 128 68 sleep1_0128_68.csv ./sleep1.sh
