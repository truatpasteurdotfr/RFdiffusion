#!/bin/bash

set -e
set -u

tbindir=$(mktemp -d)
trap "rm -rf \"$tbindir\"" TERM INT EXIT
_D=`date +%Y%m%d-%H%M`
if [ ! -z ${CONDA_DEFAULT_ENV} ] 
then
conda list --explicit > ${_D}-${CONDA_DEFAULT_ENV}-conda-list--explicit.yml
conda env export --no-builds > ${_D}-${CONDA_DEFAULT_ENV}-conda-env-export--no-builds.yml
conda env export > ${_D}-${CONDA_DEFAULT_ENV}-conda-env-export.yml
else
not inside a conda environment
fi
