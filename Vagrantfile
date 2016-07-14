# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
    config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:3030" will access port 3000 on the guest machine.
    config.vm.network "forwarded_port", guest: 3000, host: 3030 

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # hare an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
    config.vm.synced_folder "./workspace/", "/vagrant/workspace/"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  
     # Customize the amount of memory on the VM:
     vb.memory = "512"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  
  config.vm.provision "shell", inline: <<-SHELL, privileged: true
    # configure host and install ruby 2.3.1 and rails 5.0.0

    echo "-->  BEGIN Vagrant Host config and Rails 5.0.0/Ruby 2.3.1 Provision" >> /home/vagrant/arr-provision.log

    ############################################################################
    # install unzip
    echo "-->  apt-get -y install unzip" >> /home/vagrant/arr-provision.log
    apt-get -y install unzip

    ##############################################################################
    # set the hostname

    echo "-->  Set hostname to vagrant-ruby-rails" >> /home/vagrant/arr-provision.log

    hostname vagrant-ruby-rails

    echo "vagrant-ruby-rails" > /etc/hostname

    sed -i 's/localhost/localhost vagrant-ruby-rails/g' /etc/hosts

    #############################################################################
    # set custom prompt and functions/aliases in .bashrc for users root and vagrant

    echo "-->  Set .bashrc customization for root and vagrant" >> /home/vagrant/arr-provision.log

    cat /vagrant/bashrc-mod.txt >> /home/vagrant/.bashrc

    cat /vagrant/bashrc-mod.txt >> /root/.bashrc

    ##########################################################################
    # remove ruby 1.9.1

    echo "-->  Remove ruby 1.9.1" >> /home/vagrant/arr-provision.log

    apt-get -y remove ruby1.9.1 --purge

    ############################################################################
    # install ruby/rails and related tools/software

    echo "-->  download ruby/rails" >> /home/vagrant/arr-provision.log

    echo "wget -O ruby-rails-install.zip https://github.com/addiscent/ruby-rails-install/archive/master.zip" >> /home/vagrant/arr-provision.log
    wget -O ruby-rails-install.zip https://github.com/addiscent/ruby-rails-install/archive/master.zip

    echo "-->  install ruby/rails" >> /home/vagrant/arr-provision.log

    echo "-->  unzip ruby-rails-install.zip" >> /home/vagrant/arr-provision.log
    unzip ruby-rails-install.zip

    echo "-->  chmod +x ./ruby-rails-install-master/ruby-rails-install.sh" >> /home/vagrant/arr-provision.log
    chmod +x ./ruby-rails-install-master/ruby-rails-install.sh

    echo "-->  ./ruby-rails-install-master/ruby-rails-install.sh" >> /home/vagrant/arr-provision.log
    ./ruby-rails-install-master/ruby-rails-install.sh >> /home/vagrant/arr-provision.log

    echo "-->  rm -r ./ruby-rails-install-master" >> /home/vagrant/arr-provision.log
    rm -r ./ruby-rails-install-master

    echo "-->  rm ruby-rails-install.zip" >> /home/vagrant/arr-provision.log
    rm ruby-rails-install.zip

    echo "-->  End Vagrant Host config and Rails 5.0.0/Ruby 2.3.1 Provision" >> /home/vagrant/arr-provision.log
  SHELL
end
