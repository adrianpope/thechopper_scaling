sbatch -C knl -A m4075 -q debug -t 10 -N 1 ./sbatch_cori-knl.sh 1 1 mpi4py_0001_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 1 ./sbatch_cori-knl.sh 1 68 mpi4py_0001_68.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 2 ./sbatch_cori-knl.sh 2 1 mpi4py_0002_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 2 ./sbatch_cori-knl.sh 2 68 mpi4py_0002_68.csv ./mpi4py.sh
