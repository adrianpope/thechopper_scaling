sbatch -C knl -A m4075 -q debug -t 10 -N 256 ./sbatch_cori-knl.sh 256 1 mpi4py_0256_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 256 ./sbatch_cori-knl.sh 256 68 mpi4py_0256_68.csv ./mpi4py.sh
