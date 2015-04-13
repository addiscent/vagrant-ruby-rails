#!/bin/bash

echo "################   Installing Rails 4.2.1    ###############"

echo "########### sudo apt-get install -y nodejs  ##########"
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -y nodejs

echo "########### gem install rubygems-update --no-document  ##########"
gem install rubygems-update --no-document

echo "########### update_rubygems  ##########"
update_rubygems

echo "########### gem update  ##########"
gem update

echo "########### sudo apt-get install -y ruby-dev  ##########"
sudo apt-get install -y ruby-dev

echo "########### gem install nokogiri --no-document  ##########"
gem install nokogiri --no-document

echo "########### rvm use ruby-2.2.1@rails4.2.1 --create  ##########"
rvm use ruby-2.2.1@rails4.2.1 --create

echo "########### gem install rails --no-document  ##########"
gem install rails --no-document

exit

