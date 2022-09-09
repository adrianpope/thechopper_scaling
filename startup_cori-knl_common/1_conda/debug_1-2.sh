sbatch -C knl -A m4075 -q debug -t 10 -N 1 ./sbatch_cori-knl.sh 1 1 conda_0001_01.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 1 ./sbatch_cori-knl.sh 1 68 conda_0001_68.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 2 ./sbatch_cori-knl.sh 2 1 conda_0002_01.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 2 ./sbatch_cori-knl.sh 2 68 conda_0002_68.csv ./conda.sh
