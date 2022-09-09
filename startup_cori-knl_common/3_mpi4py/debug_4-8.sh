sbatch -C knl -A m4075 -q debug -t 10 -N 4 ./sbatch_cori-knl.sh 4 1 mpi4py_0004_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 4 ./sbatch_cori-knl.sh 4 68 mpi4py_0004_68.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 8 ./sbatch_cori-knl.sh 8 1 mpi4py_0008_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 8 ./sbatch_cori-knl.sh 8 68 mpi4py_0008_68.csv ./mpi4py.sh
