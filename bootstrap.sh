#!/bin/bash
pushd /vagrant

zypper ar -f http://download.opensuse.org/repositories/devel:/languages:/go/openSUSE_Leap_42.1/ go

echo -e "\ninstalling required software packages...\n"
zypper -q -n install update-alternatives ruby-devel make gcc gcc-c++ \
             libxml2-devel libxslt-devel nodejs \
             sqlite3-devel imagemagick influxdb 

echo -e "\ndisabling versioned gem binary names...\n"
echo 'install: --no-format-executable' >> /etc/gemrc

echo -e "\ninstalling bundler...\n"
gem install bundler

echo -e "\ninstalling your bundle...\n"
su - vagrant -c "cd /vagrant/; bundle install --quiet"

