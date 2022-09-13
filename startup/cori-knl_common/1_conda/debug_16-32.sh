sbatch -C knl -A m4075 -q debug -t 10 -N 16 ./sbatch_cori-knl.sh 16 1 conda_0016_01.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 16 ./sbatch_cori-knl.sh 16 68 conda_0016_68.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 32 ./sbatch_cori-knl.sh 32 1 conda_0032_01.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 32 ./sbatch_cori-knl.sh 32 68 conda_0032_68.csv ./conda.sh
