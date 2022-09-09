sbatch -C knl -A m4075 -q debug -t 5 -N 1 ./sbatch_cori-knl.sh 1 1 sleep1_0001_01.csv ./sleep1.sh
sbatch -C knl -A m4075 -q debug -t 5 -N 1 ./sbatch_cori-knl.sh 1 68 sleep1_0001_68.csv ./sleep1.sh
sbatch -C knl -A m4075 -q debug -t 5 -N 2 ./sbatch_cori-knl.sh 2 1 sleep1_0002_01.csv ./sleep1.sh
sbatch -C knl -A m4075 -q debug -t 5 -N 2 ./sbatch_cori-knl.sh 2 68 sleep1_0002_68.csv ./sleep1.sh
