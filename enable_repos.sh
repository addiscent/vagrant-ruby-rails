#!/bin/bash
set -e
source /vagrant/buildconfig
set -x

## Brightbox Ruby 1.9.3, 2.0 and 2.1
echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main > /etc/apt/sources.list.d/brightbox.list

## Chris Lea's Node.js PPA
echo deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu trusty main > /etc/apt/sources.list.d/nodejs.list

# The recv-keys part takes a bit of time, so it's faster to receive multiple keys at once.
#
# Brightbox
# Chris Lea's Node.js PPA
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \
	C3173AA6 \
	C7917B12 \

apt-get update
