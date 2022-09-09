sbatch -C knl -A m4075 -q debug -t 5 -N 4 ./sbatch_cori-knl.sh 4 1 sleep1_0004_01.csv ./sleep1.sh
sbatch -C knl -A m4075 -q debug -t 5 -N 4 ./sbatch_cori-knl.sh 4 68 sleep1_0004_68.csv ./sleep1.sh
sbatch -C knl -A m4075 -q debug -t 5 -N 8 ./sbatch_cori-knl.sh 8 1 sleep1_0008_01.csv ./sleep1.sh
sbatch -C knl -A m4075 -q debug -t 5 -N 8 ./sbatch_cori-knl.sh 8 68 sleep1_0008_68.csv ./sleep1.sh
