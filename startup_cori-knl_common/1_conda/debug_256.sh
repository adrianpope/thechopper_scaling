sbatch -C knl -A m4075 -q debug -t 10 -N 256 ./sbatch_cori-knl.sh 256 1 conda_0256_01.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 256 ./sbatch_cori-knl.sh 256 68 conda_0256_68.csv ./conda.sh
