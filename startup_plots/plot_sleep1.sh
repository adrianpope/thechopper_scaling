#! /bin/bash

python3 ./plot.py sleep1 "sleep 1" \
	../startup_theta_grand/sleep1_01.csv "Theta/grand (1 RPN)" \
	../startup_theta_grand/sleep1_64.csv "Theta/grand (64 RPN)" \
	../startup_cori-knl_common/sleep1_01.csv "Cori-KNL/common (1 RPN)" \
	../startup_cori-knl_common/sleep1_68.csv "Cori-KNL/common (68 RPN)"
