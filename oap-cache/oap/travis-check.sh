#!/bin/bash

#sudo apt-get install cmake
#sudo apt-get install libpthread-stubs0-dev
#sudo apt-get install libnuma-dev

# Download spark 2.4.4
[ -f spark ] || mkdir spark && cd spark && wget http://archive.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz && cd ..
tar -xf ./spark/spark-2.4.4-bin-hadoop2.7.tgz
export SPARK_HOME=`pwd`/spark-2.4.4-bin-hadoop2.7

cd /tmp
git clone https://github.com/memkind/memkind.git
cd memkind && ./build.sh
make
sudo make install
cd ${TRAVIS_BUILD_DIR}

cd oap-cache/oap/
mvn clean -q -Ppersistent-memory test

