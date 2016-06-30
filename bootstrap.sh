# do some os preparation 
sudo apt-get update
sudo apt-get upgrade

sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install g++-6 gcc-6

sudo update-alternatives 
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++


# get latest R
wget https://cran.rstudio.com/src/base-prerelease/R-latest.tar.gz
tar xvzf ./R-latest.tar.gz

cd R-latest

# Create a config.site; this sets up clang as the compiler for R
echo "#! /bin/sh" > config.site
echo "CC=\"clang -std=gnu99 -fsanitize=undefined\"" >> config.site
echo "CFLAGS=\"-fno-omit-frame-pointer -O2 -Wall -pedantic -mtune=native\"" >> config.site
echo "CXX=\"clang++ -fsanitize=undefined -fno-sanitize=function -fno-omit-frame-pointer\"" >> config.site

# Configure and build R
./configure --with-x=no 
make
make install

