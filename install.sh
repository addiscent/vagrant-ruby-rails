#!/bin/bash
# provision ruby 2.3.1, rails 5.0.0, and other relevant common dependencies/tools
# rex 2016.0709.1730

echo "-->  BEGIN Ruby on Rails 5.0.0 (Ruby 2.3.1) Provisioning"

##############################################################################
# set the hostname

echo "-->  Set hostname to vagrant-ruby-rails"

hostname vagrant-ruby-rails

echo "vagrant-ruby-rails" > /etc/hostname

sed -i 's/localhost/localhost vagrant-ruby-rails/g' /etc/hosts

#############################################################################
# set .bashrc for ubuntu and root for custom prompt and functions/aliases

echo "-->  Set .bashrc customization for root and ubuntu"

echo "" >> /home/vagrant/.bashrc

echo "export PS1='${debian_chroot:+($debian_chroot)}\n\D{%Y.%m%d.%H%M.%S}\n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '" >> /home/vagrant/.bashrc

echo "" >> /home/vagrant/.bashrc

echo "mls() {
  ls -lBh --group-directories-first $1 $2 $3 $4 $5
}" >>  /home/vagrant/.bashrc

echo "" >> /root/.bashrc

echo "export PS1='${debian_chroot:+($debian_chroot)}\n\D{%Y.%m%d.%H%M.%S}\n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\# '" >> /root/.bashrc

echo "" >> /root/.bashrc

echo "mls() {
  ls -lBh --group-directories-first $1 $2 $3 $4 $5
}" >>  /root/.bashrc

##########################################################################
# remove ruby 1.9.1

echo "-->  Remove ruby 1.9.1"

apt-get -y remove ruby1.9.1 --purge

##########################################################################
# install ruby 2.3.1

echo "-->  BEGIN Ruby 2.3.1 installation"

apt-get update

apt-get -y install build-essential

wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz

tar -xzvf ruby-install-0.6.0.tar.gz

cd ruby-install-0.6.0/

make install

ruby-install --system ruby 2.3.1 -- --disable-install-rdoc

cd ..

rm -r ruby-install-*

echo "-->  END Ruby 2.3.1 installation"

###########################################################################
# Install bundler

echo "-->  Install bundler"

gem install bundler --no-document

###########################################################################
# Install sqlite 3

echo "-->  Install sqlite 3"

apt-get install libsqlite3-dev
gem install sqlite3 -v '1.3.11' --no-document

###########################################################################
# Install rails 5.0.0

echo "-->  Install rails 5.0.0"

gem install rails --version=5.0.0 --no-document

###########################################################################
# Install nodejs

echo "-->  Install nodejs"

apt-get -y install nodejs

###########################################################################
# Install git

echo "-->  Install git"

apt-get -y install git

###########################################################################
# Auto-remove some bloat

apt-get -y autoremove --purge

echo "-->  END Ruby on Rails 5.0.0 (Ruby 2.3.1) Provisioning"


