################################################################################
# Method 1: Install using rpm packages (credit to DarkMukke)
#

rpm -Uvh http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm
rpm --import http://mirror.ghettoforge.org/distributions/gf/RPM-GPG-KEY-gf.el7

# WARNING: removing  vim-minimal uninstalls `sudo` if you skip the second step
#          make sure to at least run `yum install sudo`
yum -y remove vim-minimal vim-common vim-enhanced
yum -y --enablerepo=gf-plus install vim-enhanced sudo


# This script will stop here if you run this gist from the command line by
# curling to the **raw** gist: `bash <(curl -s https://gist.githubuser......)`
exit


################################################################################
# Method 2: Install by building from scratch - contains a lot ot dependancies
#

# Setup essential build environment
yum -y groupinstall "Development Tools"
yum -y install ncurses-devel git-core

# Get source
git clone https://github.com/vim/vim && cd vim

# OPTIONAL: configure to provide a comprehensive vim - You can skip this step
#  and go  straight to `make` which will configure, compile and link with
#  defaults.

./configure --prefix=/usr --with-features=huge --enable-multibyte --with-python-config-dir=/usr/lib/python2.7/config --enable-pythoninterp=yes

# Build and install
make && sudo make install


################################################################################
# Final Check
#

# After installation check your setup with
vim --version

# You should see...
# VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Aug  2 2017 16:29:21)
# Included patches: 1-839



git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
