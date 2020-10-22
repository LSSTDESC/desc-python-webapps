#!/bin/sh

## To Run at NERSC
## bash install-dev.sh <pathToExistingCondaInstall> ./desc-python-env-nersc-install-nobuildinfo.yml NERSC
## Note the inclusion of NERSC parameter skips the install of jupyterlab below

## To Run at other sites
## bash install-dev.sh <pathToExistingCondaInstall> ./desc-python-env-nersc-install-nobuildinfo.yml

if [ -z "$1" ]
then	
	echo "Please provide a full path install directory"
	exit 1
fi

unset PYTHONPATH

curl -LO https://repo.anaconda.com/miniconda/Miniconda3-4.7.12.1-Linux-x86_64.sh

bash ./Miniconda3-4.7.12.1-Linux-x86_64.sh -b -p $1

source $1/etc/profile.d/conda.sh
conda activate base
which conda

conda install -y -c conda-forge django flask jinja2 pyyaml

setfacl -R -m "group::rx" $1
setfacl -R -d -m "group::rx" $1


