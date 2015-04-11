# _vagrant-ruby-rails_

### A Ruby On Rails Development Environment (Basic)

##### Containing Ubuntu Server 14.04, Ruby 2.2.1, Gems 2.4.6, Rails 4.2.1, RVM 1.26.11, Git 1.9.1, and Node.js 0.10.25.

This is a _Vagrant Box_, (https://www.vagrantup.com), intended for quick installation of a very basic _Ruby On Rails_ development environment.  Assuming _Vagrant_ and _VirtualBox_ are already installed on your _host_ computer, this _Vagrant Box_ can be easily and quickly installed, and removed.

Because it can be quickly built or rebuilt if necessary, this _Vagrant Box_ may be handy for transient work environments, such as tutorials, or experimental work which may sacrifice the development environment.

It also allows easy reproduction and distribution of exact duplicates of a development environment shared among multiple project members.

_Git_ can be used for committing _Ruby/Rails_ project files or other sources into repositories.  If you customize the configuration and provisioning files of this _vagrant-ruby-rails_ _Vagrant Box_, saving them in a _Git_ repository will allow you to recreate your custom _vagrant-ruby-rails_ _Vagrant Box_ environment in the future.  Or, using an online _Git_ repository, you can easily share your customized _vagrant-ruby-rails_ _Vagrant Box_ with other users.

Definitions : A "_host_" is a computer on which you will be installing _vagrant-ruby-rails_.  The _vagrant-ruby-rails_ _Vagrant Box_ is a "guest" installed on your "_host_" computer.  Because the _vagrant-ruby-rails_ guest is a _Vagrant Box_, it is referred to in this document as a "_guest-vbox_".

If you are very unfamiliar with the products in this document, you may wish to visit online references before proceeding.  Some relevant online resources are listed in a section near the end of this document, titled "The Short List Of Online References".

## Overview Of Installation And Use

To install _vagrant-ruby-rails_, your computer needs :

1. An Internet connection
2. 1GB of available memory (free RAM) - After installation, you may increase or decrease the amount of _host_ memory allocated to the _guest-vbox_.
3. 3GB of storage (minimum) - Your long term _host_ storage space requirement will be determined by your application.
4. _Vagrant_ and _VirtualBox_ - Your _host_ computer must have an operating system installed which supports _Vagrant_ and _VirtualBox_, and those must be installed prior to installing _vagrant-ruby-rails_.
5. A terminal program - previously installed on the _host_.
6. A zip file extraction program - previously installed on the _host_.

This set of commands is the minimum required to control a _Vagrant Box_:

1. "vagrant up" - creates a new _Vagrant Box_ on the _host_, directed by the _Vagrantfile_. Also restarts a previously halted_Vagrant Box_.
2. "vagrant ssh" - opens an _ssh_ session with the _Vagrant Box_, allowing its system administration.
3. "vagrant halt" - stops execution of a running _Vagrant Box_.
4. "vagrant destroy" - halts an executing _Vagrant Box_, and then removes its image files, including its file system, from storage.  When this command finishes executing, the _Vagrant Box_ and its contents have been permanently deleted from _host_ file system storage.

## Software Installation

Before beginning installation of _vagrant-ruby-rails_, you must already have _Vagrant_ and _VirtualBox_ installed and properly configured.  For more information, see the section near the end of this document, titled, "Other Notes".

### Installation of _vagrant-ruby-rails_

#### Prepare For The Build

Bring up a terminal on your _host_, and follow the instructions below.  In the following sections, a terminal command prompt is indicated by the symbol $.

1. Create a "home" directory for the _guest-vbox_ in a convenient subdirectory location of your choice.  Name it whatever you wish.  Herein, the _guest-vbox_ "home" subdirectory will be referred to as "vagrant-ruby".  At times it may also be referred to as ".../vagrant-ruby/" :
    
> $ mkdir vagrant-ruby

2. Make the _guest-vbox_ "home" directory your current working directory :

> $ cd vagrant-ruby

3. Download a zip file containing the _vagrant-ruby-rails_ product files from the _Github_ repository page, https://github.com/ckthomaston/vagrant-ruby-rails.

  Extract those files into this subdirectory, (".../vagrant-ruby/").  During extraction, ensure the same file and subdirectory hierarchy as in the repository is retained.

4. After extraction, verify the contents of the directory.  Enter the following command :
  
> $ ls -al      # list the directory contents
      
    A directory listing shows the following, (or very similar), contents :
    
        -rw-rw-r-- 1 user group    20 Apr  9 16:19 .gitignore
        -rw-rw-r-- 1 user group  1085 Apr  9 16:19 LICENSE
        -rw-rw-r-- 1 user group  1073 Apr  9 18:46 rails421-inst.sh
        -rw-rw-r-- 1 user group 22112 Apr 11 10:55 README.md
        -rw-rw-r-- 1 user group   110 Apr  9 17:18 ruby221-inst.sh
        -rw-rw-r-- 1 user group   375 Apr  9 16:19 rvm-inst.sh
        drwxrws--- 3 user group  4096 Apr  9 16:19 .vagrant
        -rw-rw-r-- 1 user group  3250 Apr 10 19:03 Vagrantfile
      
5. Enter the following command :
  
> $ mkdir workspace
      
    A subdirectory named ".../vagrant-ruby/workspace/" is created.  It will be used later.
      
#### Do The Build

The "vagrant up" command executed below will provision, (create and initialize), a _vagrant-ruby-rails_ _Vagrant Box_.  Depending on the speed of your computer and the speed of your Internet connection, the build done by this "vagrant up" will take eight to fifteen minutes or more.

However, the work done by the provisioning scripts during this initial "vagrant up" build will not be invoked the next time "vagrant up" is executed, because provisioning is a one-time process.  Therefore, subsequent "vagrant up" operations will result in a loaded _guest-vbox_ within approximately one minute.

Enter the following command :
  
> $ vagrant up
      
The build starts.

Now wait...

A very long list of text messages is output during the build process, beginning with :
  
        "==> Bringing machine 'default' up with 'virtualbox' provider..."
              .
              .
     
The build tools will output numerous status/progress messages.  Most of the informational messages displayed are green in color, but, there will also be a _lot_ of red-color text output.  The output messages of _gpg_ and _curl_ are _red_ and the formatting is very _broken_.

Unfortunately, this messy output makes it difficult to spot a genuine error which should be investigated, if one occurs.  Typically, if the build fails, it will often stop with an obvious error message, but in some unusual cases it does not.

After the build finishes, you should scroll back through the terminal output messages and scrutinize them for messages which _may_ indicate an obvious error.

After the build completes successfully, the last build message reads :
  
              .
              .
        "==> default: Setting up git (1:1.9.1-1ubuntu0.1) ..."
  
#### Verify The Build

##### Verify The Toolset Has Properly Installed

When the command prompt is subsequently displayed, enter the following command :
  
> $ vagrant ssh
    
This will open an _ssh_ terminal shell on the _vagrant-ruby-rails_ _Vagrant Box_.  After a few seconds, you see an _Ubuntu_ shell welcome screen, and a command prompt which reads :
    
>  vagrant@vagrant-ubuntu-trusty-64:~$
        
Enter the following commands.  Notice the components which have been installed, and their associated version numbers :
    
> $ ruby --version     # verifies ruby installed
        
          Result :
        
            ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]
            
> $ gem --version      # version of gems
      
          Result : 2.4.6
        
> $ rvm --version      # verifies rvm installed
        
          Result : rvm 1.26.11 (latest) by Wayne E. Seguin...
        
> $ rvm gemset list    # lists ruby versions and gem sets managed by rvm
      
          Result :
        
            gemsets for ruby-2.2.1 (found in /usr/local/rvm/gems/ruby-2.2.1)
          
                (default)
              
                global
              
                => rails4.2.1
        
> $ rails --version    # verifies rails installed
      
          Result : 4.2.1
        
> $ git --version      # verifies git installed
        
          Result : git version 1.9.1
        
##### Construct And Test A Minimal App Which Confirms Working _Rails_ Scaffolding

Ensure you are still in the "vagrant ssh" session in your terminal program.  Enter the following commands.  These commands build and serve a web page from an example _Rails_ app named "myapp" :
    
> $ cd /vagrant/workspace; mkdir myapp; cd myapp      # note semicolons
  
          Result :
        
            A command prompt in the terminal.  "myapp" is the cwd.

> $ rvm use ruby-2.2.1@rails4.2.1
  
          Result :
          
            Using /usr/local/rvm/gems/ruby-2.2.1 with gemset rails4.2.1

> $ rails new .   # note the dot, (current working directory)
  
          Result :
        
            exist
                  
            create  README.rdoc
                  
            create  Rakefile
                      .
                      .
                      .
            * bin/rake: spring inserted
                  
            * bin/rails: spring inserted

> $ ls -l     # view the scaffolding hierarchy created by rails new
  
          Result :
        
            total 100
        
            drwxrws--- 1 vagrant vagrant 4096 Apr 10 02:14 app
                  
            drwxrws--- 1 vagrant vagrant 4096 Apr 10 02:14 bin
                      .
                      .
                      .
            drwxrws--- 1 vagrant vagrant 4096 Apr 10 02:14 tmp
                  
            drwxrws--- 1 vagrant vagrant 4096 Apr 10 02:14 vendor

> $ rails s -b 0.0.0.0   # 0.0.0.0 specification required for vagrant box
  
          Result :
      
            => Booting WEBrick
                  
            => Rails 4.2.1 application starting ... on http://0.0.0.0:3000
                      .
                      .
                      .
            [2015-04-10 02:36:11] INFO  ruby 2.2.1 ... [x86_64-linux]
                  
            [2015-04-10 02:36:11] INFO  WEBrick ... : pid=11540 port=3000

The built in WEBrick test server is now running.

Use a web browser on your _host_ to examine the resulting example web page at URL :

        http://local_host_:3030
  
The example web page shows :

        "Welcome aboard. You’re riding Ruby on Rails!".

You may now terminate execution of the _Rails_ WEBrick test server, by entering _Ctrl-C_ in the _guest-vbox_ terminal.

This ends preliminary verification of a successful build.  You may now remove the "myapp" scaffolding example app, if you have no other use for it.  If you wish to remove it, you may enter the following command.  (Always double-check your spelling when entering a command which contains "rm -rf ...").

> $ cd ../; rm -rf /vagrant/workspace/myapp     # be careful with rm -rf
  
        Result :
        
          "myapp" deleted.  The current working directory is now "/workspace".

## Using _vagrant-ruby-rails_

While following the instructions above, you ventured "inside" the _guest-vbox_, using "vagrant ssh" to verify the success of the build and the versions of its components.  Let's go back in there again, and do some exploring.

Starting from within the ".../vagrant-ruby/" directory, (in your regular _host_ terminal shell), enter the following command :
    
> $ vagrant ssh
    
This will open an _ssh_ terminal shell on the _guest-vbox_.  Next, enter :

> $ ls -l /     # list the contents of the root directory
    
The listing which results shows a typical _Ubuntu Server 14.04_ root directory hierarchy, on the _guest-vbox_ file system.

        total 92
        
        drwxr-xr-x  2 root    root     4096 Apr  6 20:06 bin
        
        drwxr-xr-x  3 root    root     4096 Apr  6 20:06 boot
                      .
                      .
                      .
        drwxrws---  1 vagrant vagrant  4096 Apr  8 08:34 vagrant
        
        lrwxrwxrwx  1 root    root       30 Apr  6 20:05 vmlinuz...
        
Notice there is one subdirectory not typically found in an _Ubuntu Server_ root directory hierarchy.  It is named "/vagrant/".

#### Guest VBox "/vagrant/" Subdirectory

The _guest-vbox_ "/vagrant/" subdirectory is created by _Vagrant_ during construction of the _guest-vbox_.  Upon loading, "/vagrant/" is sync'd by _VirtualBox_ to a directory you created earlier on the _host_ file system, the one (herein) named ".../vagrant-ruby/".  Due to the _VirtualBox_ sync, _guest-vbox_ "/vagrant/" and _host_ ".../vagrant-ruby/" are effectively "mapped into" a single directory.  You can observe evidence of that by entering the following command :

> $ ls -l /vagrant    # list the contents of the _guest-vbox_ /vagrant dir
    
Note that the _guest-vbox_ _Vagrantfile_ and _.sh_ provisioning _BASH_ files, among others, are listed.

        -rw-rw-r-- 1 ckt admins 1.1K Apr  9 16:19 LICENSE
        
        -rw-rw-r-- 1 ckt admins 1.1K Apr  9 18:46 rails421-inst.sh
        
        -rw-rw-r-- 1 ckt admins  24K Apr 10 18:13 README.md
        
        -rw-rw-r-- 1 ckt admins  110 Apr  9 17:18 ruby221-inst.sh
        
        -rw-rw-r-- 1 ckt admins  375 Apr  9 16:19 rvm-inst.sh
        
        -rw-rw-r-- 1 ckt admins 3.2K Apr  9 20:30 Vagrantfile

These are the same files you placed into ".../vagrant-ruby/" after you created it, when beginning installation of this product. 

You can manage or edit those files either from "within" the _guest-vbox_, (in _guest-vbox_ "/vagrant/"), or from "outside" the _guest-vbox_, (in _host_ ".../vagrant-ruby/").
  
It is important to clearly understand that the files which _appear_ in _guest-vbox_ "/vagrant/" can have _create-read-write-delete_ operations done on them from that _guest-vbox_ directory, but, those files are not _stored_ in the _guest-vbox_ file system.  Those files reside on the _host_ file system.

That implementation detail means that files which you place in the _guest-vbox_ "/vagrant" subdirectory tree are _not_ deleted by a "vagrant destroy" command.

Conversely, any files stored "inside the _guest-vbox_" file system in any other subdirectory hierarchy _are irretrievably deleted_ along with the _guest-vbox_, by a "vagrant destroy" command.

#### Guest VBox ".../workspace/" Subdirectory

Recall that earlier you created a subdirectory in ".../vagrant-ruby/" named "workspace/".  You created it while in a terminal session on the _host_ computer, on its file system.  Later, while in a "vagrant ssh" session, you created a _Rails_ app in _guest-vbox_ "/vagrant/workspace", and served its web pages from the WEBrick server.

That is an example of how a subdirectory heirarchy in ".../vagrant-ruby/" can be used from "within" the _guest-vbox_ file system.
  
Here is a ".../workspace/"-related tip for using _Git_ : At some point you may wish to commit your _guest-vbox_ _Vagrantfile_ and _.sh_ provisioning files to a _Git_ repository.  However, you probably do _not_ want the files in "workspace/", or equivalent subdirectories of ".../vagrant-ruby/", to be co-mingled with commits of your _guest-vbox_ configuration/provisioning files.  You can prevent that by adding "workspace" into your ".../vagrant-ruby/.gitignore" file.  See the _.gitignore_ file which you placed into ".../vagrant-ruby/" during installation.

## Other Notes

##### Port Mapping

The _Rails_ WEBrick server port default number is 3000.  The _vagrant-ruby-rails_ _Vagrantfile_ maps _guest-vbox_ port number 3000 to _host_ port number 3030.  The choice of port number 3030 is arbitrary.  If you wish to change this port mapping to a _host_ number port which better suits your needs, you can do so by editing the _Vagrantfile_.  For more information, see the _Vagrant_ documentation about the _config.vm.network_ directive.

##### Memory (RAM) Usage

This _guest-vbox_ needs 1GB of memory allocated to it during installation, because it compiles component sources at that time.  However, after installation of this _guest-vbox_, you may wish to reduce or increase the amount of memory allocated to your _guest-vbox_.  If that is the case, you can use the _Vagrantfile_ directive _vb.memory_ to change that amount of memory.  For more information, see the _Vagrant_ documentation.

##### Storage Usage

_VirtualBox_ will dynamically increase the size of the _Ubuntu Server_ virtual disk drive as you add new files into its file system.  The maximum virtual disk drive size of this _guest-vbox_ _Ubuntu Server_ is 40GB.

##### Provisioning

Provisioning is a process during which all of the components needed for the _vagrant-ruby-rails_ _guest-vbox_ are downloaded, built, and placed on your storage.  Vagrant executes this time-consumng provisioning of the _guest-vbox_ the first time "vagrant up" is executed.  Subsequent "vagrant up" commands will load the previously built image from your local storage, rather than redundantly provisioning the _guest-vbox_.  Unless you "vagrant destroy" your already-provisioned _guest-vbox_ image, or command-force "vagrant up" to re-provision the _guest-vbox_, subsequent "vagrant up" commands will skip the unecessary provisioning step.

The provisioning files, _rvm-inst.sh_, _ruby221-inst.sh_, and _rails421-inst.sh_, are _BASH_ scripts.  By understanding how the _Vagrantfile_ and the _.sh_ provisioning files work together, and by editing the contents of those files, you can easily change the default versions of the components installed, or add/remove components, as desired.  However, note that if you change your provisioning files, your _guest-vbox_ must be rebuilt, (re-provisioned), to implement those changes; your _guest-vbox_ will be "vagrant destroyed" in the process.  Please see the _Vagrant_ documentation for more information about provisioning _Vagrant Boxes_.
  
##### Installing _Vagrant_

The _vagrant-ruby-rails_ _guest-vbox_ is built and managed by _Vagrant_.  The specific version of _Vagrant_ used on my development computer is _Vagrant_ 1.7.2 (DEB-64bit), which is the most recent version.  You may have success with earlier versions of _Vagrant_, but I have built/tested using only 1.7.2.

_Vagrant_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _Vagrant_ installation instructions, please visit the _Vagrant_ web site : http://docs.vagrantup.com/v2/installation/index.html

##### Installing _VirtualBox_ 

_vagrant-ruby-rails_ uses _VirtualBox_ as the provider.  The specific version of _VirtualBox_ used as the provider on my development computer is _VirtualBox_ 4.3.10 (AMD64).  You will probably have success with slightly earlier versions of _VirtualBox_, or the most recent stable version, but I have not tested those.

_VirtualBox_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _VirtualBox_ installation instructions, please visit the _VirtualBox_ web site : https://www.virtualbox.org/

## The Short List Of Online References

If you are unfamiliar with the products in this document, you may wish to inform yourself about them.  The references "short list" is :

###### _Vagrant_        : https://docs.vagrantup.com/v2/
###### _VirtualBox_     : https://www.virtualbox.org/
###### _Ruby On Rails_  : http://rubyonrails.org/
###### _Ruby_           : https://www.ruby-lang.org/en/
###### _Ruby Gems_      : https://rubygems.org/
###### _Git_            : http://git-scm.com/
###### _RVM_            : https://rvm.io/

### Product Pedigree

The software components installed by the provisioning scripts are noted here.  Their versions may be updated in the future.  Their initial commit versions are :

##### _Ubuntu Server_ 14.04 "ubuntu/trusty64"
  
_Ubuntu Server_ "ubuntu/trusty64" is an "official" image from https://atlas.hashicorp.com/boxes/search.
        
##### _Ruby_ 2.2.1, _Gems_ 2.4.6, _Rails_ 4.2.1
  
_Ruby_ and _Gems_ are downloaded and compiled by _RVM_.  _RVM_ compiles them using _make_ sources from https://github.com/postmodern/ruby-install.
        
##### _RVM_ 1.26.11, (Ruby Version Manager).
  
_RVM_ is installed using _curl_ and the instructions at https://rvm.io/.
        
##### _Git_ 1.9.1
  
_Git_ is installed using the official _Canonical Ubuntu_ package repositories, "sudo apt-get install -y git".

##### _Node.js_ 0.10.25
  
_Node.js_ is installed using the official _Canonical Ubuntu_ package repositories, "sudo apt-get install -y nodejs".

##### _Nokogiri_ 1.6.6.2
  
_Nokogiri_ is installed by _Gem_, "gem install nokogiri --no-document".

### Caveats And Known Issues

###### The computer used for development of this project is a generic _AMD/Linux_ box running _Ubuntu Desktop 14.04 LTS_. If you install this _guest-vbox_ on _OS X_ or _Windows_, you are venturing into unexplored territory; installation may be successful, or it may not.  Which of the two is unknown as of this writing.  For _OS X_ or _Windows_, you may also need to install other software unknown to the author of this document.

##### "works on my machine"

This product, at this time, is in the _alpha_ stage of development.  Extensive testing has not been done on its components, only its gross operation has been confirmed .  _Host_ hardware and _host_ OS environment testing has been limited to the single generic _AMD/Ubuntu Linux_ box used for development.

##### The Provisioning Scripts Are Incomplete

The provisioning _BASH_ scripts build a working _Vagrant Box_ by downloading essential components/sources from the Internet.  The provisioning _BASH_ scripts install the components as described herein, but, at this time they have _no_ error detection/handling, per se.  If system environment problems, such as a flaky Internet connection, or lack of storage space, causes errors during the build, the provisioning scripts will _not_ handle these errors gracefully.

### Licensing And Disclaimers

_USE THIS PRODUCT AT YOUR OWN RISK. The author and any other contributors are not responsible or liable for adverse consequences caused by use of this product, even if it is used as designed, or as described or implied, herein or elsewhere._

Please read the _MIT License_ included with this README file for important licensing information and disclaimers.



  
###### Copyright 2015 CK Thomaston, all rights reserved.
###### DalorWeb LLC, http://dalorweb.com

