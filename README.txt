export INSTALL_PREFIX=/lustre/f2/pdata/esrl/gsd/contrib/lua-5.1.4.9

cd INSTALL_PREFIX/src
tar -xvjf lua-5.1.4.9.tar.bz2
cd lua-5.1.4.9
./configure \
--prefix=$INSTALL_PREFIX 2>&1 | tee log.config
make 2>&1 | tee log.make
make install 2>&1 | tee log.install

cd INSTALL_PREFIX/src
tar -xvjf Lmod-8.4.tar.bz2
cd Lmod-8.4
./configure \
--prefix=$INSTALL_PREFIX 2>&1 | tee log.config
make 2>&1 | tee log.make
make install 2>&1 | tee log.install

# Update INSTALL_PREFIX in init_lmod.*

mkdir $INSTALL_PREFIX/init
cp init_lmod.* $INSTALL_PREFIX/init/
chmod u+x $INSTALL_PREFIX/init/init_lmod.*