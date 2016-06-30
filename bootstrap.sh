# setup
echo "LC_ALL=\"en_US.UTF-8\"" | sudo tee  /etc/default/locale

# update box
sudo apt-get update
sudo apt-get upgrade

# install some packages we need
sudo apt-get install -y g++-6 gcc-6 make
sudo apt-get install -y pandoc pandoc-citeproc
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev libbz2-dev liblzma-dev libpcre3-dev libcurl4-openssl-dev
sudo apt-get install -y texlive texinfo texlive-fonts-extra
sudo apt-get install -y fort77 


# make sure we use gcc-6
sudo update-alternatives 
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++


# get latest R
wget -q https://cran.rstudio.com/src/base-prerelease/R-latest.tar.gz
tar xvzf ./R-latest.tar.gz

cd R-patched

# Create a config.site; this sets up clang as the compiler for R
echo "#! /bin/sh" > config.site
echo "CC=\"gcc -std=gnu99 -fsanitize=undefined,address\"" >> config.site
echo "CFLAGS=\"-fno-omit-frame-pointer -O2 -Wall -pedantic -mtune=native\"" >> config.site
echo "CXX=\"g++ -fsanitize=undefined,address \"" >> config.site

# Configure and build R
./configure --with-x=no 
make -j2
make install

# now you can install any packages you want, i need those, so i'll fix them here.
RD -e "install.packages(c('roxygen2', 'devtools', 'knitr', 'checkmate', 'testthat', 'BH', 'Rcpp', 'rmarkdown')  )"

