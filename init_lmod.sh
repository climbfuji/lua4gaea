#!/bin/bash

loaded_modules=$(echo ${LOADEDMODULES} | tr ":" "\n")
module purge 2>/dev/null

echo "Activating lua module environment"
#source INSTALL_PREFIX/lmod/lmod/init/bash
source /lustre/f2/pdata/esrl/gsd/contrib/lua-5.1.4.9/lmod/lmod/init/bash

echo "Reloading modules ... (sit back and relax)"
# Load craype module first, then DefApps, then all others
for module in $loaded_modules
do
  [[ $module == craype/* ]] && module load $module
done
for module in $loaded_modules
do
  [[ $module == DefApps ]] && module load $module
done
for module in $loaded_modules
do
  [[ $module == craype/* || $module == DefApps ]] || module load $module
done

# Set environment variables
export MODULESHOME=/lustre/f2/pdata/esrl/gsd/contrib/lua-5.1.4.9/lmod/8.4
