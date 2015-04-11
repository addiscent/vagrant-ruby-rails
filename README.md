# vagrant-ruby-rails

### A Ruby On Rails Development Environment (Basic)

##### Containing Ubuntu Server 14.04, Ruby 2.2.1, Gems 2.4.6, Rails 4.2.1, RVM 1.26.11, Git 1.9.1, and Node.js 0.10.25.

This is a _Vagrant Box_, (https://www.vagrantup.com), intended for quick installation of a very basic _Ruby On Rails_ development environment.  Assuming _Vagrant_ and _VirtualBox_ are already installed on your host computer, this _Vagrant Box_ may be easily and quickly installed, and removed.

Because it can be rebuilt quickly if necessary, this _Vagrant Box_ may be handy for transient work, perhaps due to a need for a sacrificial development environment.  Or, it can be easily discarded after Ruby/Rails evaluation or tutorials.

It also allows easy reproduction and distribution of exact duplicates of a development environment shared among multiple project members.

_Git_ is used for committing _Ruby/Rails_ files or other sources into repositories.  If you customize the configuration and provisioning files of this "vagrant-ruby-rails" _Vagrant Box_, saving them in a _Git_ repository will allow you to recreate your custom "vagrant-ruby-rails" _Vagrant Box_ environment in the future.  Or, using an online _Git_ repository, you can easily share your customized "vagrant-ruby-rails" _Vagrant Box_ with other users.

## Overview Of Installation And Use

To install "vagrant-ruby-rails", your computer needs :

1. An Internet connection
2. 1GB of available memory (free RAM) - After installation, you may increase or decrease the amount of memory allocated
3. 3GB of disk storage - Your long term disk storage space requirement will be determined by your application.
4. _Vagrant_ and _VirtualBox_ - Your computer must have an operating system installed which supports _Vagrant_ and _VirtualBox_.
5. A previously installed terminal emulation program

Here is a quick introduction to the most essential Vagrant commands :

1. "vagrant up" - creates a new _Vagrant Box_, directed by the _Vagrantfile_. Also "restarts" an existing _Vagrant Box_.
2. "vagrant ssh" - opens an ssh session with the _Vagrant Box_, allowing its system administration.
3. "vagrant halt" - stops an executing _Vagrant Box_.  "vagrant up" restarts a halted _Vagrant Box_.
4. "vagrant destroy" - halts an executing _Vagrant Box_, and removes its files from disk storage.  When done, the _Vagrant Box_ and all files which it contained have been permanently deleted.

Definition of a few terms : A "host" is a computer on which you will be installing "vagrant-ruby-rails".  The "vagrant-ruby-rails" _Vagrant Box_ is a "guest" installed on your "host" computer.  Because the "vagrant-ruby-rails" guest is a _Vagrant Box_, it is referred to below as a "guest-vbox".

If you are very unfamiliar with the products in this document, you may wish to visit online references before proceeding.  Some relevant online resources are listed in a section near the end of this document, titled "The Short List Of Online References".

## Software Installation

Before beginning installation of "vagrant-ruby-rails", you must already have _Vagrant_ and _VirtualBox_ installed and properly configured.  For more information, see the section near the end of this document, titled, "Other Notes".
  
### Installation of _"vagrant-ruby-rails"_

#### Prepare For The Build

Bring up a terminal in your host, and follow the instructions below.  In the following sections, a terminal command prompt is indicated by the symbol $.

1. Create a "home" directory for the guest-vbox in a convenient subdirectory location.  Name it whatever you wish.  Herein, I will refer to it as "vagrant-ruby".  At times it may also be referred to as ".../vagrant-ruby/" :
    
    - $ mkdir vagrant-ruby

2. Download a zip file containing the files from the github repository page, https://github.com/ckthomaston/vagrant-ruby-rails.

  While using the same file and subdirectory hierarchy as in the repository, extract those files into the ".../vagrant-ruby/" subdirectory you just created above.

3. Make the guest-vbox "home" directory your current working directory :

    - $ cd vagrant-ruby

4. Enter the following command :
  
    - $ mkdir workspace
      
    A subdirectory named ".../vagrant-ruby/workspace/" is created.  It will be used later.
      
#### Do The Build

The "vagrant up" command introduced below will provision, (create and initialize), a "vagrant-ruby-rails" _Vagrant Box_.  Depending on the speed of your computer and the speed of your Internet connection, the build done by this "vagrant up" will take eight to fifteen minutes or more.  However, the work done by the provisioning scripts during this initial "vagrant up" build will not be invoked the next time "vagrant up" is executed, because provisioning is a one-time process.  Therefore, subsequent "vagrant up" operations will result in a loaded guest-vbox within a minute or less.

Enter the following command :
  
    - $ vagrant up
      
The build starts.

Now wait...

A very long list of text messages is output during the build process, beginning with :
  
        "==> Bringing machine 'default' up with 'virtualbox' provider..."
     
The build tools will output numerous status/progress messages.  Most of the informational messages displayed are green in color, but, there will also be a _lot_ of red-color text output.  The output messages of _gpg_ and _curl_ are _red_ and the formatting is very _broken_.

Unfortunately, this messy output makes it difficult to spot a genuine error which should be investigated.  Typically, if the build fails, it will often stop with an obvious error message, but in some unusual cases it does not.  After the build finishes, you should scroll back through the terminal output messages and scrutinize them, because sometimes the build forges onward after an error.

After the build completes successfully, the last build message reads :
  
        "==> default: Setting up git (1:1.9.1-1ubuntu0.1) ..."
  
#### Verify "The Build"

##### Verify The Toolset Has Properly Installed

When the command prompt is subsequently displayed, enter the following command :
  
    - $ vagrant ssh
    
This will open an _ssh_ terminal shell on the guest-vbox.  After a few seconds, you see an _Ubuntu_ shell welcome screen, and a command prompt which reads :
    
  vagrant@vagrant-ubuntu-trusty-64:~$
        
Enter the following commands.  Notice the components which have been installed, and their associated version numbers :
    
    - $ ruby --version         # verifies ruby installed
        
        Result :
        
          ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]
            
    - $ gem --version          # version of gems
      
        Result : 2.4.6
        
    - $ rvm --version          # verifies rvm installed
        
        Result : rvm 1.26.11 (latest) by Wayne E. Seguin...
        
    - $ rvm gemset list        # lists ruby versions and gem sets managed by rvm
      
        Result :
        
          gemsets for ruby-2.2.1 (found in /usr/local/rvm/gems/ruby-2.2.1)
          
              (default)
              
              global
              
              => rails4.2.1
        
    - $ rails --version        # verifies rails installed
      
        Result : 4.2.1
        
    - $ git --version          # verifies git installed
        
        Result : git version 1.9.1
        
##### Construct And Test A Minimal App Which Confirms Working _Rails_ Scaffolding

Ensure you are still in the "vagrant ssh" session in your terminal program.  Enter the following commands.  These commands build and serve a web page from an example _Rails_ app named "myapp" :
    
    - $ cd /vagrant/workspace; mkdir myapp; cd myapp      # note semicolons
  
        Result :
        
          A command prompt in the terminal.  "myapp" is the cwd.

    - $ rvm use ruby-2.2.1@rails4.2.1
  
        Result : Using /usr/local/rvm/gems/ruby-2.2.1 with gemset rails4.2.1

    - $ rails new .   # note the dot, (current working directory)
  
        Result :
                  exist
                  
                  create  README.rdoc
                  
                  create  Rakefile
                  
                  create  config.ru
                  
                  create  .gitignore
                  
                      .
                      
                  Use `bundle show [gemname]` to see where a bundled gem is installed.
                  
                           run  bundle exec spring binstub --all
                           
                  * bin/rake: spring inserted
                  
                  * bin/rails: spring inserted

    - $ ls -l     # view the scaffolding hierarchy created by rails new
  
        Result :
                  total 100
        
                  drwxrws--- 1 vagrant vagrant 4096 Apr 10 02:14 app
                  
                  drwxrws--- 1 vagrant vagrant 4096 Apr 10 02:14 bin
                  
                  drwxrws--- 1 vagrant vagrant 4096 Apr 10 02:14 config
                  
                      .
                      
                  drwxrws--- 1 vagrant vagrant 4096 Apr 10 02:14 test
                  
                  drwxrws--- 1 vagrant vagrant 4096 Apr 10 02:14 tmp
                  
                  drwxrws--- 1 vagrant vagrant 4096 Apr 10 02:14 vendor

    - $ rails s -b 0.0.0.0   # 0.0.0.0 specification required for vagrant box
  
        Result :
      
          => Booting WEBrick
                  
          => Rails 4.2.1 application starting in development on http://0.0.0.0:3000
                  
          => Run `rails server -h` for more startup options
                  
          => Ctrl-C to shutdown server
                  
          [2015-04-10 02:36:11] INFO  WEBrick 1.3.1
                  
          [2015-04-10 02:36:11] INFO  ruby 2.2.1 (2015-02-26) [x86_64-linux]
                  
          [2015-04-10 02:36:11] INFO  WEBrick::HTTPServer#start: pid=11540 port=3000

The built in WEBrick test server is now running.

Use a web browser on your host to examine the resulting test web page at :

        http://localhost:3030
  
The test web page shows :

        "Welcome aboard. You’re riding Ruby on Rails!".

You may now terminate execution of the _Rails_ WEBrick test server, by entering _Ctrl-C_ in the guest-vbox terminal.

This ends preliminary verification of a successful build.  You may now remove the "myapp" scaffolding example app, if you have no other use for it.  If you wish to remove it, you may enter the following command.  (Always double-check your spelling when entering a command which contains "rm -rf ...").

    - $ cd ../; rm -rf /vagrant/workspace/myapp     # be careful with rm -rf
  
        Result :
        
          "myapp" deleted.  The current working directory is now /workspace.

## Using "vagrant-ruby-rails"

While following the instructions above, you ventured "inside" the guest-vbox, using "vagrant ssh" to verify the success of the build and the versions of its components.  Let's go back in there again, and do some exploring.

Starting from within the ".../vagrant-ruby/" directory, (in your regular host terminal shell), enter the following command :
    
    - $ vagrant ssh
    
This will open an _ssh_ terminal shell on the guest-vbox.  Next, enter :

    - $ ls -l /     # list the contents of the root directory
    
The listing which results shows a typical _Ubuntu Server 14.04_ root directory hierarchy, inside the guest-vbox file system.

        total 92
        
        drwxr-xr-x  2 root    root     4096 Apr  6 20:06 bin
        
        drwxr-xr-x  3 root    root     4096 Apr  6 20:06 boot
        
        drwxr-xr-x 13 root    root     3880 Apr  8 20:43 dev
        
                .
                
        drwxrws---  1 vagrant vagrant  4096 Apr  8 08:34 vagrant
        
        drwxr-xr-x 13 root    root     4096 Apr  8 11:10 var
        
        lrwxrwxrwx  1 root    root       30 Apr  6 20:05 vmlinuz...
        
Notice there is one subdirectory not typically found in an _Ubuntu Server_ root directory hierarchy.  It is named "/vagrant/".

#### Guest VBox "/vagrant/" Subdirectory

The guest-vbox "/vagrant/" subdirectory is created by _Vagrant_ during construction of the guest-vbox, and sync'd by _VirtualBox_ to a directory you created earlier on the host filesystem, the one (herein) named ".../vagrant-ruby/".  Due to the _VirtualBox_ sync, the guest-vbox "/vagrant/" subdirectory and the host ".../vagrant-ruby/" directory are effectively "mapped into" a single directory.  You may observe evidence of that by entering the following command :

    - $ ls -l /vagrant    # list the contents of the guest-vbox /vagrant dir
    
Note that the guest-vbox's _Vagrantfile_ and _.sh_ provisioning _BASH_ files, among others, are listed.

        -rw-rw-r-- 1 ckt admins 1.1K Apr  9 16:19 LICENSE
        
        -rw-rw-r-- 1 ckt admins 1.1K Apr  9 18:46 rails421-inst.sh
        
        -rw-rw-r-- 1 ckt admins  24K Apr 10 18:13 README.md
        
        -rw-rw-r-- 1 ckt admins  110 Apr  9 17:18 ruby221-inst.sh
        
        -rw-rw-r-- 1 ckt admins  375 Apr  9 16:19 rvm-inst.sh
        
        -rw-rw-r-- 1 ckt admins 3.2K Apr  9 20:30 Vagrantfile

These are the same files you placed into the ".../vagrant-ruby/" subdirectory after you created it, when beginning installation of this product. 

You may manage or edit those files either from "within" the guest-vbox, (in the guest-vbox "/vagrant/" subdirectory), or from "outside" the guest-vbox, (in the host ".../vagrant-ruby/" subdirectory).
  
It is important to clearly understand that the files which _appear_ in the guest-vbox "/vagrant/" subdirectory can have _create-read-write-delete_ operations done on them from that guest-vbox directory, but those files are not _stored_ in the guest-vbox filesystem.  The files reside on the _host_ filesystem.

That implementation detail means that files which you place in the guest-vbox "/vagrant" subdirectory tree are _not_ deleted by a "vagrant destroy" command.  But, conversely, any files stored "inside the guest-vbox" filesystem are _irretrievably deleted_ by a "vagrant destroy" command.

#### Guest VBox ".../workspace/" Subdirectory

Recall that earlier you created a subdirectory in ".../vagrant-ruby/" named "workspace/".  You created it while in a terminal session on the host computer, on its filesystem.  Later, while in a "vagrant ssh" session, you created a _Rails_ app in the guest-vbox's "/vagrant/workspace" subdirectory, and served its web pages from the WEBrick server.

That is an example of how a subdirectory heirarchy in ".../vagrant-ruby/" can be used from "within" the guest-vbox filesystem.
  
Here is a _Git_-related tip : At some point you may wish to commit your guest-vbox _Vagrantfile_ and _.sh_ provisioning files to a _Git_ repository.  However, you probably do _not_ want the files in "workspace" or equivalent subdirectories of ".../vagrant-ruby/" to be co-mingled with commits of your guest-vbox configuration/provisioning files.  You may prevent that by adding "workspace" into your ".../vagrant-ruby/.gitignore" file.

## Other Notes

##### Port Mapping

The _Rails_ WEBrick server port default number is 3000.  The "vagrant-ruby-rails" _Vagrantfile_ maps guest-vbox port number 3000 to host port number 3030.  The choice of port number 3030 is arbitrary.  If you wish to change this port mapping to a host number port which better suits your needs, you may do so by editing the _Vagrantfile_.  For more information, see the _Vagrant_ documentation about the "config.vm.network" directive.

##### Memory (RAM) Usage

This guest-vbox needs 1GB of memory allocated to it during installation, because it compiles component sources at that time.  However, after installation of this guest-vbox, you may wish to reduce or increase the amount of memory allocated to your guest-vbox.  If that is the case, you may use the _Vagrantfile_ "vb.memory" directive to change that amount of memory.  For more information, see the _Vagrant_ documentation.

##### Disk Drive Storage Usage

_VirtualBox_ will dynamically increase the size of the _Ubuntu Server_ virtual disk drive as you add new files into its file system.  The maximum virtual disk drive size of _Ubuntu Server_ is 40GB.

##### Provisioning

Provisioning is a process during which all of the components needed for the "vagrant-ruby-rails" guest-vbox are downloaded, built, and stored on your hard drive.  Vagrant executes this time-consumng provisioning of the guest-vbox the first time "vagrant up" is executed.  Subsequent "vagrant up" commands will load the previously built image from your local hard drive, rather than redundantly provisioning the guest-vbox.  Unless you "vagrant destroy" your already-provisioned guest-vbox image, or command-force "vagrant up" to re-provision the guest-vbox, subsequent "vagrant up" commands will skip the provisioning step, and instead will load the previously provisioned image, usually in one minute or less.

The provisioning files, _rvm-inst.sh_, _ruby221-inst.sh_, and _rails421-inst.sh_, are _BASH_ scripts.  By understanding how the _Vagrantfile_ and the _.sh_ provisioning files work together, and by editing the contents of those files, you can easily change the (known) versions of the components installed, or add/remove components, as desired.  Please see the _Vagrant_ documentation for more information about provisioning _Vagrant Boxes_.
  
##### Installing _VirtualBox_ 

"vagrant-ruby-rails" uses _VirtualBox_ as the provider.  The specific version used as the provider on my development computer is _VirtualBox_ 4.3.10 (AMD64).  You will probably have success with slightly earlier versions of _VirtualBox_, or the most recent stable version, but I have not tested those.

_VirtualBox_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _VirtualBox_ installation instructions, please visit the _VirtualBox_ web site : https://www.virtualbox.org/

##### Installing _Vagrant_

The "vagrant-ruby-rails" guest-vbox is built and managed by _Vagrant_.  The specific version used as the provider on my development computer is _Vagrant_ 1.7.2 (DEB-64bit), which is the most recent version.  You may have success with earlier versions of _Vagrant_, but I have built/tested using only 1.7.2.

_Vagrant_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _Vagrant_ installation instructions, please visit the _Vagrant_ web site : http://docs.vagrantup.com/v2/installation/index.html

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

The software components installed by the provisioning scripts are noted below.  Their versions may be updated in the future.  Their initial commit versions are :

##### _Ubuntu Server_ 14.04 "ubuntu/trusty64"
  
_Ubuntu Server_ "ubuntu/trusty64" is an "official" image from https://atlas.hashicorp.com/boxes/search.
        
##### _Ruby_ 2.2.1, _Gems_ 2.4.6, _Rails_ 4.2.1
  
_Ruby_ and _Gems_ are downloaded and compiled by _RVM_.  _RVM_ compiles them using _make_ sources from https://github.com/postmodern/ruby-install.
        
##### _RVM_ 1.26.11, (Ruby Version Manager).
  
_RVM_ is installed using https://rvm.io/.
        
##### _Git_ 1.9.1
  
_Git_ is installed using the official _Canonical Ubuntu_ package repositories, "sudo apt-get install -y git".

##### _Node.js_ 0.10.25
  
_Node.js_ is installed using the official _Canonical Ubuntu_ package repositories, "sudo apt-get install -y nodejs".

##### _Nokogiri_ 1.6.6.2
  
_Nokogiri_ is installed by _Gem_, "gem install nokogiri --no-document".

### Caveats And Known Issues

###### The computer used for development of this project is a generic _AMD/Linux_ box running _Ubuntu Desktop 14.04 LTS_. If you install this guest-vbox on _OS X_ or _Windows_, you are venturing into unexplored territory; installation may be successful, or it may not.  Which of the two is unknown as of this writing.  For _OS X_ or _Windows_, you may also need to install other software unknown to the author of this document.

##### "works on my machine"

This product, at this time, is in the _alpha_ stage of development.  Extensive testing has not been done on its components, only its gross operation has been confirmed .  Hardware and host OS environment testing has been limited to the single generic _AMD/Ubuntu Linux_ box used for development.

##### The Provisioning Scripts Are Incomplete

The provisioning _BASH_ scripts build a working _Vagrant Box_ by downloading essential components/sources from the Internet.  The provisioning _BASH_ scripts install the components as described herein, but, at this time they have _no_ error detection/handling, per se.  If, as examples, a flaky Internet connection, or lack of disk space, causes errors during the build, the provisioning scripts will _not_ handle these errors gracefully.

### Licensing And Disclaimers

_USE THIS PRODUCT AT YOUR OWN RISK. The author and any other contributors are not responsible or liable for adverse consequences caused by use of this product, even if it is used as designed, or as implied by any description, herein or elsewhere._

Please read the _MIT License_ included with this README file for important licensing information and disclaimers.



  
###### Copyright 2015 CK Thomaston, all rights reserved.
###### DalorWeb LLC, http://dalorweb.com

