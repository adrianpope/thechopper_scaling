#! /bin/bash

python3 ./plot.py conda "conda" \
	../theta_grand/conda_01.csv "Theta/grand (1 RPN)" \
	../theta_grand/conda_64.csv "Theta/grand (64 RPN)" \
	../cori-knl_common/conda_01.csv "Cori-KNL/common (1 RPN)" \
	../cori-knl_common/conda_68.csv "Cori-KNL/common (68 RPN)"
