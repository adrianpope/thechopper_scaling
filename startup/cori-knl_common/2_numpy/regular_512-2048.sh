sbatch -C knl -A m4075 -q regular -t 30 -N 512 ./sbatch_cori-knl.sh 512 1 numpy_0512_01.csv ./numpy.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 512 ./sbatch_cori-knl.sh 512 68 numpy_0512_68.csv ./numpy.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 1024 ./sbatch_cori-knl.sh 1024 1 numpy_1024_01.csv ./numpy.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 1024 ./sbatch_cori-knl.sh 1024 68 numpy_1024_68.csv ./numpy.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 2048 ./sbatch_cori-knl.sh 2048 1 numpy_2048_01.csv ./numpy.sh
sbatch -C knl -A m4075 -q regular -t 30 -N 2048 ./sbatch_cori-knl.sh 2048 68 numpy_2048_68.csv ./numpy.sh
