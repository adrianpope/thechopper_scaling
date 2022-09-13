sbatch -C knl -A m4075 -q regular -t 30 -N 512 ./sbatch_cori-knl.sh 512 1 mpi4py_0512_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 512 ./sbatch_cori-knl.sh 512 68 mpi4py_0512_68.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 1024 ./sbatch_cori-knl.sh 1024 1 mpi4py_1024_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 1024 ./sbatch_cori-knl.sh 1024 68 mpi4py_1024_68.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 2048 ./sbatch_cori-knl.sh 2048 1 mpi4py_2048_01.csv ./mpi4py.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 2048 ./sbatch_cori-knl.sh 2048 68 mpi4py_2048_68.csv ./mpi4py.sh
