sbatch -C knl -A m4075 -q debug -t 10 -N 4 ./sbatch_cori-knl.sh 4 1 conda_0004_01.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 4 ./sbatch_cori-knl.sh 4 68 conda_0004_68.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 8 ./sbatch_cori-knl.sh 8 1 conda_0008_01.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 8 ./sbatch_cori-knl.sh 8 68 conda_0008_68.csv ./conda.sh
