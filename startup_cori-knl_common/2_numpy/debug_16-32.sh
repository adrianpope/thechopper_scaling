sbatch -C knl -A m4075 -q debug -t 10 -N 16 ./sbatch_cori-knl.sh 16 1 numpy_0016_01.csv ./numpy.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 16 ./sbatch_cori-knl.sh 16 68 numpy_0016_68.csv ./numpy.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 32 ./sbatch_cori-knl.sh 32 1 numpy_0032_01.csv ./numpy.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 32 ./sbatch_cori-knl.sh 32 68 numpy_0032_68.csv ./numpy.sh
