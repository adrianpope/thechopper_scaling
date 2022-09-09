sbatch -C knl -A m4075 -q debug -t 10 -N 16 ./sbatch_cori-knl.sh 16 1 mpi4py_0016_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 16 ./sbatch_cori-knl.sh 16 68 mpi4py_0016_68.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 32 ./sbatch_cori-knl.sh 32 1 mpi4py_0032_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 32 ./sbatch_cori-knl.sh 32 68 mpi4py_0032_68.csv ./mpi4py.sh
