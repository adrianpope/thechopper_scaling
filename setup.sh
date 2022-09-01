#! /bin/bash

branches="master alltoall"
basepkglist="numpy conda-pack"

TOP_DIR=python
CONDA_DIR=miniconda3
CONDA_SH=${CONDA_DIR}.sh
LOG_DIR=log
PACK_DIR=packed

MPICC=cc
CC=cc

do_miniconda3=true
do_basepkg=true
do_envpkg=true
do_chopper=true
do_condapack=true
# conda-pack seems broken for 3.10, specify 3.9 to fix
# https://github.com/conda/conda-pack/issues/198
# commented out conda clean due to conda pack warnings

mkdir -p ${TOP_DIR}/${LOG_DIR}
cd ${TOP_DIR}

if ${do_miniconda3}
then

    installer=Miniconda3-latest-Linux-x86_64.sh
    if [ ! -f ${installer} ]
    then
	echo ""
	echo "DOWNLOADING miniconda3"
	curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    fi
    if [ ! -d ${CONDA_DIR} ]
    then
	echo ""
	echo "INSTALLING miniconda3"
	time bash ./Miniconda3-latest-Linux-x86_64.sh -b -p ${CONDA_DIR} > ${LOG_DIR}/miniconda3.log 2>&1
    fi
fi

if [ ! -f ${CONDA_SH} ]
then
    echo ""
    echo "CREATING ${CONDA_SH}"
    CONDA_EXE=$(realpath ./${CONDA_DIR}/bin/conda)
    echo -n 'eval "$(' > ${CONDA_SH}
    echo -n ${CONDA_EXE} >> ${CONDA_SH}
    echo ' shell.bash hook)"' >> ${CONDA_SH}
fi
    
source ${CONDA_SH}

if ${do_basepkg}
then
    for pkg in $basepkglist
    do
	if [ $(conda list -f $pkg | wc -l) -lt 4 ]
	then
	    echo ""
	    echo "INSTALLING ${pkg}"
	    time conda install -y ${pkg} > ${LOG_DIR}/${pkg}.log 2>&1
	fi
    done
fi

if ${do_envpkg}
then
    for branch in $branches
    do
	conda env remove -n ${branch}
	conda create -y -n ${branch} python=3.9 > /dev/null 2>&1
	echo ""
	echo "INSTALLING pip INTO ${branch}"
	time conda install -y -n ${branch} pip > ${LOG_DIR}/pip.${branch}.log 2>&1
	conda activate ${branch}
	echo ""
	echo "INSTALLING mpi4py INTO ${branch}"
	time CC=${CC} MPICC=${MPICC} pip install --no-deps -v --no-binary :all: mpi4py > ${LOG_DIR}/mpi4py.${branch}.log 2>&1
	conda deactivate
    done
    #conda clean --all -y
fi

if ${do_chopper}
then
    if [ ! -d thechopper ]
    then
	echo ""
	git clone https://github.com/ArgonneCPAC/thechopper.git
    fi
    for branch in $branches
    do
	conda activate ${branch}
	echo ""
	echo "INSTALLING thechopper:${branch}"
	cd thechopper
	git checkout ${branch}
	time python setup.py install > ../${LOG_DIR}/thechopper.${branch}.log 2>&1
	cd ..
	conda deactivate
    done
fi

if ${do_condapack}
then
    for branch in $branches
    do
	echo ""
	echo "CONDA-PACK ${branch}"
	mkdir -p ${PACK_DIR}
	outname=${PACK_DIR}/${branch}.tar.gz
	rm -f ${outname}
	time conda pack -n ${branch} -o ${outname} > ${LOG_DIR}/pack.${branch}.log
    done
fi
