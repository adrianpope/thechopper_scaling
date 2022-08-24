#! /bin/bash

source /tmp/apope/miniconda3/bin/activate
which python
python --version
python test_a2a_overload.py 32 100 10 1
