#!/bin/bash
set -e
source /vagrant/buildconfig
set -x

/vagrant/enable_repos.sh
/vagrant/prepare.sh
/vagrant/utilities.sh
/vagrant/ruby2.2.sh

chown -R vagrant:vagrant /var/lib/gems/
chown -R vagrant:vagrant /usr/local/bin
