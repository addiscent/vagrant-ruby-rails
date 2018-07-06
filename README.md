# _vagrant-ruby-rails_

### A Ruby On Rails Development Environment (Basic)

##### Containing Ubuntu Server 16.04, Ruby 2.3.4, Rails 5.0.7, Gem 2.5.2, Node.js v4.2.6, Git 2.7.4

This is a _Vagrant Box_, (https://www.vagrantup.com), intended for quick installation of a very basic _Ruby On Rails_ development environment.  Assuming _Vagrant_ and _VirtualBox_ are already installed on your _host_ computer, this _Vagrant Box_ can be easily and quickly installed and removed.

Because it can be quickly built or rebuilt if necessary, this _Vagrant Box_ may be handy for transient work environments, such as tutorials, or experimental work which may sacrifice this expendable _vagrant-ruby-rails_ development environment package.

It also allows easy reproduction and distribution of exact duplicates of a development environment shared among multiple project members.

The installed _Git_ software can be used for committing _Ruby/Rails_ project files or other sources into repositories.

If you customize the configuration and provisioning files of this _vagrant-ruby-rails_ _Vagrant Box_, and then save them in a _Git_ repository, you can easily recreate your own custom _vagrant-ruby-rails_ _Vagrant Box_ development environment in the future.  Also, using an online _Git_ repository, you can easily share your customized _vagrant-ruby-rails_ _Vagrant Box_ with other users.

Definitions : A "_host_" is a computer on which you will be installing _vagrant-ruby-rails_.  _Vagrant-ruby-rails_ is a "_guest_" installed onto your "_host_" computer.  Because the _vagrant-ruby-rails_ "_guest_" is a _Vagrant Box_, it is referred to in this document as a _guest-vbox_.

If you are very unfamiliar with the software products listed at the top of this document, you may wish to visit online references before proceeding.  Some relevant online resources are listed in a section near the end of this document, titled "The Short List Of Online References".

## Introduction To Installation And Use

To install _vagrant-ruby-rails_, your _host_ computer needs :

  * An Internet connection

  * 512MB of available memory (free RAM) - After installation, you may increase or decrease the amount of _host_ memory allocated to the _guest-vbox_.

  * 2.8GB of storage (minimum) - Your long term _host_ storage space requirement will be determined by your application.

  * _Vagrant_ and _VirtualBox_ - Your _host_ computer must have an operating system installed which supports _Vagrant_ and _VirtualBox_, and those must be installed prior to installing _vagrant-ruby-rails_.

  * A terminal/shell program - previously installed on the _host_.

  * A zip file extraction program - previously installed on the _host_.

The installation of Ruby/Rails/etc has been tested only on the _Ubuntu 16.04_ _guest-vbox_ installed by the included Vagrantfile.

#### Quickstart For Experts Already Running Vagrant With VirtualBox On Linux or Windows

##### A New Rails Dev Env And App, In Seven Easy Steps, (for details, see _Software Installation_)

###### Copy-and-Paste The Given Commands Into Your Terminal Session

1. Open a terminal session in your _host_ computer storage workspace.

2. Navigate to a location where you wish to create a directory which will contain _vagrant-ruby-rails_.

3. Download ZIP _vagrant-ruby-rails_ file from GitHub into the current directory :
> $ wget -O  vagrant-ruby-rails.zip  https://github.com/addiscent/vagrant-ruby-rails/archive/master.zip

4. Unzip _vagrant-ruby-rails_ files from the zip file, e.g. :
> $ unzip  vagrant-ruby-rails.zip

5. Navigate into the vagrant-ruby-rails directory created by unzipping, e.g. :
> $ cd  vagrant-ruby-rails-master

6. Create a directory and spin up a Vagrant Box.  The spin-up provisioning installs Rails.
> $ mkdir workspace && vagrant up && vagrant ssh

  Now wait a while for the _Ubuntu Server 16.04_ image to download and provision. The amount of wait time is mostly determined by the speed of connections to the necessary servers on the Internet.  Typically, a _vagrant-ruby-rails_ instance requires 15 minutes to download and install.
  
  After the image finishes downloading and provisioning is complete, you see the prompt of the _guest-vbox_ :

        2017.0328.0215.59
        vagrant@vagrant-ruby-rails:~
        $
        
7. Create a new Rails app and start the thin web server.
> $ cd /vagrant/workspace && rails new myapp && cd myapp && rails s -b 0.0.0.0

Open a web browser to _http://localhost:3033_

        Yay! You’re on Rails!

When ready to stop the Rails server, press control-C :

        The vagrant-ruby-rails guest-vbox terminal SSH session prompt returns.

When ready, end the _vagrant-ruby-rails_ _guest-vbox_ SSH terminal session :

> $ exit

        The terminal session prompt of the host returns.
  
When you wish to do so, you may remove everything which was installed, by using the following commands.

1. Remove the _vagrant-ruby-rails_ _guest-vbox_ from the _host_ computer :
> $ vagrant destroy

        The vagrant-ruby-rails guest-vbox has been stopped.
        The vagrant-ruby-rails guest-vbox virtual machine files have been removed.

2. Remove the _vagrant-ruby-rails_ project files from the _host_ computer :
> $ cd .. && rm -r vagrant-ruby-rails-master

"And just like that, she was gone."

## Software Installation

Before beginning installation of _vagrant-ruby-rails_, you must already have _Vagrant_ and _VirtualBox_ installed and properly configured.  The versions used for development and testing are Vagrant 1.9.3 and VirtualBox 5.1.14.  Other "close" versions may work.  For more information, see the section near the end of this document, titled, "Other Notes".

### Installation of _vagrant-ruby-rails_ - Expanded description

#### Prepare For _The Build_

Open a terminal session in your _host_ computer storage workspace.

Navigate to a location where you wish to create a directory which will contain _vagrant-ruby-rails_.

Download ZIP _vagrant-ruby-rails_ file from GitHub into the current directory :
> $ wget -O  vagrant-ruby-rails.zip  https://github.com/addiscent/vagrant-ruby-rails/archive/master.zip

Unzip _vagrant-ruby-rails_ files from the zip file, e.g. :
> $ unzip  vagrant-ruby-rails.zip

Unzipping the file creates a directory named _vagrant-ruby-rails-master_.  You may leave it named as is, or rename it as you wish.  For the purpose of this document, we rename it now to _vagrant-ruby-rails_ :
> $ mv  vagrant-ruby-rails-master  vagrant-ruby-rails

Navigate into the vagrant-ruby-rails directory created by unzipping, e.g. :
> $ cd  vagrant-ruby-rails

After extraction, verify the contents of ".../vagrant-ruby-rails/".  Enter the following command :
> $ ls -al

A directory listing shows the following, (or similar), contents :

        -rw-rw-r-- 1 user group   28 Jul 10 19:19 .gitignore
        -rw-rw-r-- 1 user group  12K Jul 10 19:19 LICENSE
        -rw-rw-r-- 1 user group 3.0K Jul 10 19:19 bashrc-mod.txt
        -rw-rw-r-- 1 user group  28K Jul 10 19:19 README.md
        -rw-rw-r-- 1 user group 3.0K Jul 10 19:19 Vagrantfile


Create a directory named "workspace".  The "workspace" directory is the recommended location for placement of your future "rails apps" :
> $ mkdir workspace

#### Do _The Build_

The "vagrant up" command executed below will provision and start a _vagrant-ruby-rails_ _Vagrant Box_.  The work done by Vagrant during this initial "vagrant up" operation will be performed only once.  Typically, the _guest-vbox_ image requires 15 minutes to download and build.  Subsequent "vagrant up" operations will result in a running _guest-vbox_ within approximately one minute.

During provisioning, there is a large amount of terminal message output.  The vast majority of messages log the construction of software which is being placed _into the_  _vagrant-ruby-rails_ _Vagrant Box_.  During this procedure, _Ruby, Gems, Rails, Git, and Node.js_ are _not_ placed directly onto your _host_, they are placed into the _guest-vbox_.

Enter the following command :

> $ vagrant up

_The Build_ starts.

A very long list of text messages is output during the build process, beginning with :

        "==> Bringing machine 'default' up with 'virtualbox' provider..."
              .
              .

The build tools will output numerous status/progress messages.  If you are using a terminal which is configured to show color text, most of the informational messages displayed are green in color, but, some are red-color text output.  The output messages are color coded by _Vagrant_; green messages indicate those of STDOUT from the _guest-vbox_, while red messages indicate those of STDERR from the _guest-vbox_.

Red-color messages are common, they do not indicate an error has definitely occured; the author of that particular software simply chose to use STDERR to output trace/status messages.  Typically, if the build fails, it will often stop with an obvious error message, but in some unusual cases it does not.  After the build finishes, you should scroll back through the terminal output messages and scrutinize them for messages which _may_ indicate a legitimate error.  If you believe _The Build_ did not complete successfully, see the section near the end of this document titled, "If _The Build_ Fails".

After the build completes successfully, the last build message reads similar to the following :

              .
              .
        -->  END ./ruby-rails-tools-install.sh

#### Verify _The Build_

##### Verify The Toolset Has Properly Installed

After the build finishes, the _guest-vbox_ is ready for use.

Log into the _guest-vbox_ using the following command :
> $ vagrant ssh

Successful login to the _guest-vbox_ result in an Ubuntu banner and a prompt similar to :

        Welcome to Ubuntu 14.04.4 LTS (GNU/Linux 3.13.0-91-generic x86_64)

          System information as of Mon Jul 11 01:49:42 UTC 2016

          System load:  0.76              Processes:           82
          Usage of /:   3.5% of 39.34GB   Users logged in:     0
          Memory usage: 27%               IP address for eth0: 10.0.2.15
          Swap usage:   0%
          .
          .
          .

        2016.0711.0215.59
        vagrant@vagrant-ruby-rails:~
        $

Enter the following commands.  Notice the components which have been installed, and their associated version numbers :

> $ ruby --version

          Result :

            ruby 2.3.4p301 (2017-03-30 revision 58214)

> $ rails --version
    
          Result : Rails 5.0.7

> $ gem --version
    
          Result : 2.5.2

> $ bundler --version
    
          Result : Bundler version 1.14.6

> $ nodejs --version
    
          Result : v4.2.6

> $ git --version
    
          Result : git version 2.7.4

> $ gem list sqlite3
    
          Result : sqlite3 (1.3.13)


Note the name of the currrently logged-in user is _vagrant_, the default built-in user on this _vagrantbox_.

##### Construct And Test A Minimal App Which Confirms Working _Rails_ Scaffolding

Ensure you are still in the "vagrant ssh" session in your terminal program.

Enter the following commands.

Become root user by executing this command :

> $ sudo -s

The next command line builds and serves a web page from an example _Rails_ app named "myapp" :

> (root)# cd /vagrant/workspace && rails new myapp && cd myapp && rails s -b 0.0.0.0

Terminal output messages shown below trace the progress of the command above, which builds the scaffolding for a new Rails app named "myapp", and then executes the Rails server.

            .
            .
        Puma starting in single mode...
        Version 3.8.2 (ruby 2.4.1-p111), codename: Sassy Salamander
             .
            .
        Listening on tcp://0.0.0.0:3000
        Use Ctrl-C to stop

The Rails default test server, Puma, is now running.

Use a web browser on your _host_ to examine the resulting example web page at URL :

        http://localhost:3033

The example web page shows :

        Yay! You’re on Rails!

You may now terminate execution of the test server, by entering _Ctrl-C_ in the _guest-vbox_ terminal.

It no longer necessary now to work as root, so be sure to exit as root and resume operating as the mormal "lower priviledge" user :

> (root)# exit

This ends verification of a successful build.  You may now continue to experiment with "myapp", or you may remove it if you have no other use for it.  If you wish to remove it, you may enter the following command.

> $ cd && rm -rf /vagrant/workspace/myapp

        Result :

          The "myapp" directory and its subdirectories are deleted.
          Return to prompt :
          
          2016.0711.0410.45
          vagrant@vagrant-ruby-rails:~
          $ 

#### Quicklist Of Vagrant Commands

The following set of commands is the minimum required to control a _Vagrant Box_:

  * "vagrant up" - creates a new _Vagrant Box_ on the _host_, directed by the _Vagrantfile_. Also restarts a previously halted _Vagrant Box_.

  * "vagrant ssh" - opens an _ssh_ terminal session with the _Vagrant Box_, allowing its system administration.

  * "vagrant halt" - stops execution of a running _Vagrant Box_.

  * "vagrant destroy" - halts an executing _Vagrant Box_, and then removes its image files, including its file system, from _host_ storage.  When this command finishes executing, the _Vagrant Box_ and its contents have been permanently deleted from _host_ file system storage.

## Using _vagrant-ruby-rails_

While following the instructions immediately above, you ventured "inside" the _guest-vbox_, using "vagrant ssh" to verify the success of the build and the versions of its components.  Now, let's do some exploring.

Enter the following command :

> $ ls -l /

The listing which results shows a typical _Ubuntu Server 14.04_ root directory hierarchy, on the _guest-vbox_ file system.

        total 92
        drwxr-xr-x  2 root    root     4096 Apr  6 20:06 bin
        drwxr-xr-x  3 root    root     4096 Apr  6 20:06 boot
                      .
                      .
                      .
        drwxrws---  1 vagrant vagrant  4096 Apr  8 08:34 vagrant
        drwxr-xr-x 13 root    root     4096 Apr 11 21:05 var
        lrwxrwxrwx  1 root    root       30 Apr  6 20:05 vmlinuz...

Notice there is one subdirectory not typically found in an _Ubuntu Server_ root directory hierarchy.  It is named "/vagrant/".

#### Guest VBox "/vagrant/" Subdirectory

The _guest-vbox_ "/vagrant/" subdirectory is created by _Vagrant_ during construction of the _guest-vbox_.  Upon loading, "/vagrant/" is sync'd by _VirtualBox_ to a directory you created earlier on the _host_ file system, the one (herein) named ".../vagrant-ruby-rails/".  The result of the _VirtualBox_ sync is that _guest-vbox_ "/vagrant/" and _host_ ".../vagrant-ruby-rails/" are effectively "mapped into" a single directory.  You can observe evidence of that by entering the following command :

> $ ls -al /vagrant

Note that the _guest-vbox_ _Vagrantfile_ and _.sh_ provisioning _Bash_ files, among others, are listed.

        drwxrwxr-x  1 vagrant vagrant  4096 Jul 11 01:48 .
        drwxr-xr-x 23 root    root     4096 Jul 11 01:49 ..
        -rw-rw-r--  1 vagrant vagrant    28 Jul 11 01:43 .gitignore
        -rw-rw-r--  1 vagrant vagrant 11350 Jul 11 01:43 LICENSE
        -rw-rw-r--  1 vagrant vagrant 28552 Jul 11 01:43 README.md
        drwxrwxr-x  1 vagrant vagrant  4096 Jul 11 01:48 .vagrant
        -rw-rw-r--  1 vagrant vagrant  3050 Jul 11 01:43 Vagrantfile
        drwxrwxr-x  1 vagrant vagrant  4096 Jul 11 01:59 workspace


These are the same files you placed into ".../vagrant-ruby-rails/" after you created it, when beginning installation of this product.

You can manage or edit those files either from "within" the _guest-vbox_, (in _guest-vbox_ "/vagrant/"), or from "outside" the _guest-vbox_, (in _host_ ".../vagrant-ruby-rails/").

It is important to clearly understand that the files which _appear_ in _guest-vbox_ "/vagrant/" can have _create-read-write-delete_ operations done on them from that _guest-vbox_ directory, but, those files are not _stored_ in the _guest-vbox_ file system.  Those files reside on the _host_ file system.

That implementation detail means that files which you place in the _guest-vbox_ "/vagrant" subdirectory tree are _not_ deleted by a "vagrant destroy" command.  This is because those files can be _referenced_ in _guest-vbox_ "/vagrant", but they are _stored_ on the _host_, in ".../vagrant-ruby-rails".

Conversely, any files _stored_ on the _guest-vbox_ file system, in any other subdirectory hierarchy, _are deleted_ along with the _guest-vbox_, by a "vagrant destroy" command.

#### Guest VBox ".../workspace/" Subdirectory

Recall that earlier you created a subdirectory in ".../vagrant-ruby-rails/" named "workspace/".  You created it while in a terminal session on the _host_ computer, on its file system.  Later, while in a "vagrant ssh" session, you created a _Rails_ app in _guest-vbox_ "/vagrant/workspace", and served its web pages from the server.

That is an example of how a subdirectory heirarchy in the _host_ ".../vagrant-ruby-rails/" subdirectory can be used from "within" the _guest-vbox_ file system.

Here is a ".../workspace/"-related tip for using _Git_ : At some point you may wish to commit your _guest-vbox_ _Vagrantfile_ and _.sh_ provisioning files to a _Git_ repository.  However, you probably do _not_ want the files in "workspace/", or equivalent subdirectories of ".../vagrant-ruby-rails/", to be co-mingled with commits of your _guest-vbox_ configuration/provisioning files.  You can prevent that by adding the name "workspace" into your ".../vagrant-ruby-rails/.gitignore" file.  The same is true of the hidden ".../vagrant-ruby-rails/.vagrant" subdirectory.  See the _.gitignore_ file which you placed into ".../vagrant-ruby-rails/" during installation.

## Other Notes

##### Gems Documentation Is Not Built-in

In order to minimize both the build time and the storage space consumed by this _guest-vbox_, _Gems_ documentation is not included during _The Build_.

##### Port Mapping

The _Rails_ server port default number is 3000.  The _vagrant-ruby-rails_ _Vagrantfile_ maps _guest-vbox_ port number 3000 to _host_ port number 3033, so it will not conflict with the Rails default port 3000 you may have already been using before installing the _vagrant-ruby-rails_ _guest-vbox_.  The choice of port number 3033 is arbitrary.  If you wish to change this port mapping to a _host_ number port which better suits your needs, you can do so by editing the _Vagrantfile_.  By revising this port mapping for each instance, you may also run more than one instance of _vagrant-ruby-rails_ _guest-vbox_ at the same time.  For more information, see the _Vagrant_ documentation about the _config.vm.network_ directive.

##### Memory (RAM) Usage

Based on your application needs you may wish to reduce or increase the amount of memory allocated to your _guest-vbox_.  If that is the case, after installation of this _guest-vbox_, you can use the _Vagrantfile_ directive _vb.memory_ to change the amount of allocated memory.  For more information, see the _Vagrant_ documentation.

##### Storage Usage

_VirtualBox_ will dynamically increase the size of the _guest-vbox_ _Ubuntu Server_ virtual disk drive as you add new files into its file system.  The maximum virtual disk drive size of this _guest-vbox_ _Ubuntu Server_ is 40GB.  This limit was set by the original developer of the _Ubuntu Server 14.04_ _VirtualBox_ image; it cannot be changed by the user.

##### Provisioning

Provisioning is a process during which all of the components needed for the _vagrant-ruby-rails_ _guest-vbox_ are downloaded, built, and placed into the _vagrant-ruby-rails_ _guest-vbox_.  By default, _Vagrant_ executes this time-consumng provisioning of the _guest-vbox_ only the first time "vagrant up" is executed.  Subsequent "vagrant up" commands will fetch the previously provisioned image from _host_ local storage, rather than redundantly provisioning the _guest-vbox_ every time "vagrant up" is executed.

The provisioning file is the _Vagrantfile_.  Inspect the _Vagrantfile_, and notice the provisioning commands which are located at the end of the file, following the "config.vm.provision" directive.  Notice that these are typical GNU/Linux-style commands which you might use on a command line or in a _Bash_ shell script.  By understanding how the _Vagrant_-specific directives, and the _Bash_-type commands work together, you can easily change the default versions of the components installed, or add/remove components, as desired.

Note that if you change the provisioning commands at the end of the _Vagrantfile_, the installed _guest-vbox_ image will need to be rebuilt, (re-provisioned), in order to implement those changes.  The _guest-vbox_ is re-provisioned by executing the "vagrant provision" command.

Please see the _Vagrant_ documentation for more information about provisioning _Vagrant Boxes_.

##### Installing _Vagrant_

The _vagrant-ruby-rails_ _guest-vbox_ is built and managed by _Vagrant_.  The specific version of _Vagrant_ used on the _vagrant-ruby-rails_ project development computer is _Vagrant_ 1.9.3.  You may have success with other versions of _Vagrant_, but the _vagrant-ruby-rails_ project has been built/tested using only 1.9.3.

_Vagrant_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _Vagrant_ installation instructions, please visit the _Vagrant_ web site : http://docs.vagrantup.com/v2/installation/index.html

##### Installing _VirtualBox_

_vagrant-ruby-rails_ uses _VirtualBox_ as the provider.  The specific version of _VirtualBox_ used as the provider on the _vagrant-ruby-rails_ project development computer is _VirtualBox_ 5.1.14 (AMD64).  You will probably have success with slightly differing versions of _VirtualBox_, or the most recent stable version, but the _vagrant-ruby-rails_ project has not tested those.

_VirtualBox_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _VirtualBox_ installation instructions, please visit the _VirtualBox_ web site : https://www.virtualbox.org/

##### _Bento/Ubuntu-16.04-i386_

The _Vagrantfile_ specifies that the _VirtualBox_ image to be loaded during provisioning is _bento/ubuntu-16.04-i386_, which is a 32-bit CPU image.  It is not strictly required, you may use a 64-bit Ubuntu Linux image, or possibly some other compatible (e.g., Debian-based), distibution of Linux, if necessary.  If that is the case, revise the _Vagrantfile_, to specify some other image, e.g., find and change:

        config.vm.box = "bento/ubuntu-16.04-i386"

to:

        config.vm.box = "bento/ubuntu-16.04".

An image specifier of _bento/ubuntu-16.04_ downloads and starts a 64-bit version of Ubunut 16.04.2.  For more information, or to use other compatible versions of Linux, see the Bento page on Hashicorp's website :  https://atlas.hashicorp.com/bento

If you previously provisioned a _guest-vbox_, then after revising the _Vagrantfile_ to specify a different VagrantBox image, execute "vagrant destroy", to remove the existing _guest-vbox_ image.  Then execute "vagrant up", which downloads the new _VirtualBox_ image from the Hashicorp Ubuntu repository, and is used to build the _guest-vbox_.

##### Misc Troubleshooting Tips

###### "Vagrant SSH" Times Out

If "vagrant ssh" times out while attempting to shell into the _guest-vbox_, one cause may be that the _guest-box_ image requires a 64-bit installation of VirtualBox, but your host is capable of only 32-bit guests.  Also, it is possible that some _guest-box_ image you have installed is simply defective.  As an example, prompting for a password during boot has been observed with the _ubuntu/xenial64_ _guest-vbox_.  Consider trying a different _guest-vbox_ image.  See "Using _Bento/Ubuntu-16.04-i386_", above.

###### Remote SSH Times Out

When using _ssh_ from a remote terminal to shell into the _guest-vbox_, if it times out instead of presenting a _guest-vbox_ prompt, investigate the _host_ firewall settings and ensure it does not block the _guest-vbox_ _ssh_ port.  The default _ssh_ port number of the _guest-vbox_ is 2222.

##### If _The Build_ Fails

First, ensure you save the terminal output messages of the "vagrant up" provisioning build for future reference.  This is usually easily done by backscrolling the terminal, highlighting the terminal text, and then doing copy-paste into a file, and saving it.

Only you have access to the necessary configuration information about your _host_, so the only practical advice which can be offered here is :

###### Divide And Conquer

Identify the "milestone" at which the provisioning error occurred.  Inspect the _install.sh_ provisioning file.  Find the milestone locations in the _Vagrantfile_ at which the terminal messages indicate an eror, (notice echoed markers "-->").  Narrow down which milestone succeeded, and which did not.  Once you find the most likely script commands, investigate as to why that particular command may have failed.

It's possible for a build to fail for quite a few reasons.  Some are :

* Unreliable Internet connection.

* One or more web sites which provide source code, or build scripts, have become unavailable, (broken links, temporarily or permanently offline).

* Missing, misconfigured, or incompatible versions of _Vagrant_ or _VirtualBox_.

After you have found something suspicious, address it, either by changing some configuration of your _host_, (most likely to resolve the problem), or by modifying the _Vagrantfile_ custom provisioning script, (see broken links, above).

Then, try again to "vagrant up" _vagrant-ruby-rails_.  Before doing so, be aware that the _Vagrantfile_ provisioning script is not idempotent, meaning, the likelyhood of producing a correctly provisioned _vagrant-ruby-rails_ _Vagrant Box_ is low if you simply re-run "vagrant up" after installation failed, even after you have implemented a "guaranteed" fix for an error.  Unless you know otherwise, your best course of action after implementing an error correction is to execute "vagrant destroy", and then execute "vagrant up" again.

## The Short List Of Online References

If you are unfamiliar with the products in this document, you may wish to inform yourself about them.  The references "short list" is :

###### _Vagrant_        : https://docs.vagrantup.com/v2/
###### _VirtualBox_     : https://www.virtualbox.org/
###### _Ruby On Rails_  : http://rubyonrails.org/
###### _Ruby_           : https://www.ruby-lang.org/en/
###### _Ruby Gems_      : https://rubygems.org/
###### _Git_            : http://git-scm.com/
###### _Node.js_        : https://nodejs.org/

### Caveats And Known Issues

##### "works on my machine"

This product, at this time, is in the _alpha_ stage of development.  Extensive testing has not been done on its components, only its gross operation has been confirmed .  _Host_ hardware and _host_ OS environment testing has been limited to the single generic _AMD/Ubuntu_ box used for development.

Your feedback is appreciated, especially with regard to success or problems using this product on _OS X_.

### Licensing And Disclaimer

_USE THIS PRODUCT AT YOUR OWN RISK. The author and other contributors are not responsible or liable for adverse consequences caused by use of this product, even if used as designed, or as described or implied, herein or elsewhere._

Please read the _Apache License, Version 2.0_ included with this README file for important licensing information and disclaimers.




###### Copyright 2018 Rex Addiscentis, all rights reserved.
###### http://addiscent.com
