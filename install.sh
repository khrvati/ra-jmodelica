#!/bin/bash

USERDIR=/home/$USER

sudo apt-get update
sudo apt install -y g++ subversion gfortran ipython cmake swig ant openjdk-8-jdk python-dev zlib1g-dev libboost-dev
sudo apt install -y cython cython3 python-tk python3-tk python-pip python3-pip
sudo -H pip install numpy scipy matplotlib cython lxml nose jpype1 pyreadline
sudo -H pip3 install numpy scipy matplotlib cython lxml nose jpype1 pyreadline

cd $USERDIR
svn co https://svn.jmodelica.org/tags/2.1.1@10401 jmodelica_source
svn co https://svn.jmodelica.org/assimulo/trunk@843 jmodelica_source/external/Assimulo
svn co https://projects.coin-or.org/svn/Ipopt/stable/3.12 Ipopt
cd Ipopt/ThirdParty/Blas
./get.Blas
cd ../Lapack
./get.Lapack
cd ../Mumps
./get.Mumps
cd ../Metis
./get.Metis
cd ../..
mkdir build
cd build
echo -e '\n\nConfiguring Ipopt in 5 seconds. This will take a while.\nPress any key to skip waiting\n\n'
read -t 5
../configure
echo -e '\n\nRunning make on Ipopt in 5 seconds. This will take a while.\nPress any key to skip waiting\n\n'
read -t 5
make
echo -e '\n\nRunning make install on Ipopt in 5 seconds. This will take a while.\nPress any key to skip waiting\n\n'
read -t 5
make install

cd $USERDIR/jmodelica_source
mkdir build
cd build
../configure --prefix=$USERDIR/jmodelica --with-ipopt=$USERDIR/Ipopt/build
echo -e '\n\nInstalling jmodelica in 5 seconds. This will take around 5 minutes.\nPress any key to skip waiting\n\n'
read -t 5
make install
echo "$USERDIR/jmodelica/Python" > $USERDIR/.local/lib/python2.7/site-packages
