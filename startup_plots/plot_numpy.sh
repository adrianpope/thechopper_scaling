#! /bin/bash

python3 ./plot.py numpy "import numpy" \
	../startup_theta_grand/numpy_01.csv "Theta/grand (1 RPN)" \
	../startup_theta_grand/numpy_64.csv "Theta/grand (64 RPN)" \
	../startup_cori-knl_common/numpy_01.csv "Cori-KNL/common (1 RPN)" \
	../startup_cori-knl_common/numpy_68.csv "Cori-KNL/common (68 RPN)" \
	../startup_theta_local/numpy_01.csv "Theta/SSD (1 RPN)" \
	../startup_theta_local/numpy_64.csv "Theta/SSD (64 RPN)"
