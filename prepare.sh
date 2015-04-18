#!/bin/bash
set -e
source /vagrant/buildconfig
set -x

## Create a user for the web app.
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
chown vagrant:vagrant /home/vagrant/.ssh
