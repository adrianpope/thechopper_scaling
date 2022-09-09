sbatch -C knl -A m4075 -q debug -t 10 -N 4 ./sbatch_cori-knl.sh 4 1 thechopper_0004_01.csv ./thechopper.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 4 ./sbatch_cori-knl.sh 4 68 thechopper_0004_68.csv ./thechopper.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 8 ./sbatch_cori-knl.sh 8 1 thechopper_0008_01.csv ./thechopper.sh
sbatch -C knl -A m4075 -q debug -t 10 -N 8 ./sbatch_cori-knl.sh 8 68 thechopper_0008_68.csv ./thechopper.sh
