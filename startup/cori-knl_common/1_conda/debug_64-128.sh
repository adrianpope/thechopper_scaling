sbatch -C knl -A m4075 -q debug -t 10 -N 64 ./sbatch_cori-knl.sh 64 1 conda_0064_01.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 64 ./sbatch_cori-knl.sh 64 68 conda_0064_68.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 128 ./sbatch_cori-knl.sh 128 1 conda_0128_01.csv ./conda.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 128 ./sbatch_cori-knl.sh 128 68 conda_0128_68.csv ./conda.sh
