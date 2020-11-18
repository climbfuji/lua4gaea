#!/bin/tcsh

set loaded_modules = `echo ${LOADEDMODULES} | sed 's/:/ /g'`
module purge >& /dev/null

echo "Activating lua module environment"
#source INSTALL_PREFIX/lmod/lmod/init/csh
source /lustre/f2/pdata/esrl/gsd/contrib/lua-5.1.4.9/lmod/lmod/init/csh

echo "Reloading modules ... (sit back and relax)"
# Load craype module first, then DefApps, then all others
foreach module ($loaded_modules)
  if ( $module =~ craype/* ) then
    module load $module
  endif
end
foreach module ($loaded_modules)
  if ( $module =~ DefApps ) then
    module load $module
  endif
end
foreach module ($loaded_modules)
  if ( $module =~ craype/* ) then
    # nothing to do
  else if ( $module =~ DefApps ) then
    # nothing to do
  else
    module load $module
  endif
end

# Set environment variables
setenv MODULESHOME /lustre/f2/pdata/esrl/gsd/contrib/lua-5.1.4.9/lmod/8.4
