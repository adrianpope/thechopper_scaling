sbatch -C knl -A m4075 -q debug -t 10 -N 64 ./sbatch_cori-knl.sh 64 1 mpi4py_0064_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 64 ./sbatch_cori-knl.sh 64 68 mpi4py_0064_68.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 128 ./sbatch_cori-knl.sh 128 1 mpi4py_0128_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 128 ./sbatch_cori-knl.sh 128 68 mpi4py_0128_68.csv ./mpi4py.sh
