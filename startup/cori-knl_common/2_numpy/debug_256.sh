sbatch -C knl -A m4075 -q debug -t 10 -N 256 ./sbatch_cori-knl.sh 256 1 numpy_0256_01.csv ./numpy.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 256 ./sbatch_cori-knl.sh 256 68 numpy_0256_68.csv ./numpy.sh
