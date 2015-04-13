# _vagrant-ruby-rails_

### A Ruby On Rails Development Environment (Basic)

##### Containing Ubuntu Server 14.04, Ruby 2.2.1, Gems 2.4.6, Rails 4.2.1, RVM 1.26.11, Git 1.9.1, Node.js 0.12.2

This is a _Vagrant Box_, (https://www.vagrantup.com), intended for quick installation of a very basic _Ruby On Rails_ development environment.  Assuming _Vagrant_ and _VirtualBox_ are already installed on your _host_ computer, this _Vagrant Box_ can be easily and quickly installed and removed.

Because it can be quickly built or rebuilt if necessary, this _Vagrant Box_ may be handy for transient work environments, such as tutorials, or experimental work which may sacrifice the development environment.

It also allows easy reproduction and distribution of exact duplicates of a development environment shared among multiple project members.

The installed _Git_ software can be used for committing _Ruby/Rails_ project files or other sources into repositories.  If you customize the configuration and provisioning files of this _vagrant-ruby-rails_ _Vagrant Box_, and then save them in a _Git_ repository, you can easily recreate your custom _vagrant-ruby-rails_ _Vagrant Box_ development environment in the future.  Or, using an online _Git_ repository, you can easily share your customized _vagrant-ruby-rails_ _Vagrant Box_ with other users.

Definitions : A "_host_" is a computer on which you will be installing _vagrant-ruby-rails_.  _Vagrant-ruby-rails_ is a "guest" installed onto your "_host_" computer.  Because the _vagrant-ruby-rails_ "guest" is a _Vagrant Box_, it is referred to in this document as a _guest-vbox_.

If you are very unfamiliar with the software products listed at the top of this document, you may wish to visit online references before proceeding.  Some relevant online resources are listed in a section near the end of this document, titled "The Short List Of Online References".

#### Quickstart For Experts Already Running Vagrant with VirtualBox

##### A New Rails Dev Env And App, In Five Easy Steps

###### Copy-and-Paste Quoted Commands Into Your Terminal Session

1. Open a terminal session in your _host_ computer storage workspace.
2. "mkdir vagrant-ruby-rails; cd vagrant-ruby-rails; mkdir workspace"
3. Download ZIP _vagrant-ruby-rails_ file from GitHub, https://github.com/ckthomaston/vagrant-ruby-rails.  Unzip _vagrant-ruby-rails_ files into current working directory, "vagrant-ruby-rails".
4. "vagrant up; vagrant ssh".  Now wait a short while for _vagrant@vagrant-ubuntu-trusty-64:~$_ prompt.
5. "cd /vagrant/workspace; rvm use ruby-2.2.1@rails4.2.1; rails new myapp; cd myapp; rails s -b 0.0.0.0"

Open a web browser to http://localhost:3030

        Welcome aboard.
        You’re riding Ruby on Rails!

## Introduction To Installation And Use

To install _vagrant-ruby-rails_, your computer needs :

  * An Internet connection

  * 1GB of available memory (free RAM) - After installation, you may increase or decrease the amount of _host_ memory allocated to the _guest-vbox_.

  * 3GB of storage (minimum) - Your long term _host_ storage space requirement will be determined by your application.

  * _Vagrant_ and _VirtualBox_ - Your _host_ computer must have an operating system installed which supports _Vagrant_ and _VirtualBox_, and those must be installed prior to installing _vagrant-ruby-rails_.

  * A terminal program - previously installed on the _host_.

  * A zip file extraction program - previously installed on the _host_.
  
This set of commands is the minimum required to control a _Vagrant Box_:

  * "vagrant up" - creates a new _Vagrant Box_ on the _host_, directed by the _Vagrantfile_. Also restarts a previously halted _Vagrant Box_.

  * "vagrant ssh" - opens an _ssh_ terminal session with the _Vagrant Box_, allowing its system administration.

  * "vagrant halt" - stops execution of a running _Vagrant Box_.

  * "vagrant destroy" - halts an executing _Vagrant Box_, and then removes its image files, including its file system, from _host_ storage.  When this command finishes executing, the _Vagrant Box_ and its contents have been permanently deleted from _host_ file system storage.

## Software Installation

Before beginning installation of _vagrant-ruby-rails_, you must already have _Vagrant_ and _VirtualBox_ installed and properly configured.  For more information, see the section near the end of this document, titled, "Other Notes".

### Installation of _vagrant-ruby-rails_

#### Prepare For _The Build_

Bring up a terminal on your _host_.  Choose a suitable location for the directory tree which will be created by the commands below.

Enter the following single-line command on your terminal.  In the following sections, a terminal command prompt is indicated by the symbol $.

> $ mkdir vagrant-ruby-rails; cd vagrant-ruby-rails; mkdir workspace

The command above created the "home" directory, named "vagrant-ruby-rails", where your new _vagrant-ruby-rails_ development environment will be installed.  This is the directory from which you will launch your new _vagrant-ruby-rails_ _guest-vbox_.  The "vagrant-ruby-rails" directory is also referred to elsewhere in this document as ".../vagrant-ruby-rails/.  A subdirectory named ".../vagrant-ruby-rails/workspace/" is also created by the command above.  It will be used later.
      
Next, visit the _vagrant-ruby-rails_ GitHub repository at, https://github.com/ckthomaston/vagrant-ruby-rails.  On that page, use the 
"Download ZIP" button to download a ZIP file containing the _vagrant-ruby-rails_ project files.

Extract those files into the current working directory, (".../vagrant-ruby-rails/").

After extraction, verify the contents of ".../vagrant-ruby-rails/".  Enter the following command :
  
> $ ls -al
      
A directory listing shows the following, (or very similar), contents :
    
        -rw-rw-r-- 1 user group    20 Apr  9 16:19 .gitignore
        -rw-rw-r-- 1 user group  1085 Apr  9 16:19 LICENSE
        -rw-rw-r-- 1 user group  1073 Apr  9 18:46 rails421-inst.sh
        -rw-rw-r-- 1 user group 22112 Apr 11 10:55 README.md
        -rw-rw-r-- 1 user group   110 Apr  9 17:18 ruby221-inst.sh
        -rw-rw-r-- 1 user group   375 Apr  9 16:19 rvm-inst.sh
        -rw-rw-r-- 1 user group  3250 Apr 10 19:03 Vagrantfile
        drwxrwsr-x 2 user group  4096 Apr 12 14:30 workspace
      
#### Do _The Build_

The "vagrant up" command executed below will provision and start a _vagrant-ruby-rails_ _Vagrant Box_.  Depending on the speed of your computer and the speed of your Internet connection, the build done by this "vagrant up" will take approximately fifteen minutes or more.

The work done by the provisioning scripts during this "vagrant up" provisioning build will not be invoked the next time "vagrant up" is executed, because provisioning is a one-time process.  Therefore, subsequent "vagrant up" operations will result in a running _guest-vbox_ within approximately one minute.

There is a large amount of terminal message output during provisioning.  The vast majority of messages log the construction of software which is being placed _into the_  _vagrant-ruby-rails_ _Vagrant Box_.  _Ruby, Gems, Rails, RVM, Git, and Node.js_ are _not_ being placed directly onto your _host_, they are being placed into the _guest-vbox_.  When provisioning of the _guest-vbox_ finishes,  the _guest-vbox_ is then stored onto the _host_.

Enter the following command :
  
> $ vagrant up; vagrant ssh
      
_The Build_ starts.

A very long list of text messages is output during the build process, beginning with :
  
        "==> Bringing machine 'default' up with 'virtualbox' provider..."
              .
              .
     
The build tools will output numerous status/progress messages.  If you are using a terminal which is configured to show color text, most of the informational messages displayed are green in color, but, there will also be a _lot_ of red-color text output.  The output messages of _gpg_ and _curl_ are _red_ and the formatting is very _broken_.

Unfortunately, this messy output makes it difficult to spot any genuine error, if one occurs.  Typically, if the build fails, it will often stop with an obvious error message, but in some unusual cases it does not.

After the build finishes, you should scroll back through the terminal output messages and scrutinize them for messages which _may_ indicate an obvious error.

If you believe _The Build_ did not complete successfully, see the section near the end of this document titled, "If _The Build_ Fails".

After the build completes successfully, the last build message reads :
  
              .
              .
        "==> default: Setting up git (1:1.9.1-1ubuntu0.1) ..."
  
#### Verify _The Build_

##### Verify The Toolset Has Properly Installed

When _The Build_ is finished, an _Ubuntu_ shell welcome screen and a command prompt are displayed.  The command prompt shows :
    
>  vagrant@vagrant-ubuntu-trusty-64:~$
        
Enter the following commands.  Notice the components which have been installed, and their associated version numbers :
    
> $ ruby --version
        
          Result :
        
            ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]
            
> $ bundler --version
      
          Result : Bundler version 1.9.2
        
> $ gem --version
      
          Result : 2.4.6
        
> $ rvm --version
        
          Result : rvm 1.26.11 (latest) by Wayne E. Seguin...
        
> $ rvm gemset list
      
          Result :
        
            gemsets for ruby-2.2.1 (found in /usr/local/rvm/gems/ruby-2.2.1)
                (default)
                global
                => rails4.2.1
        
> $ rails --version
      
          Result : 4.2.1
        
> $ git --version
        
          Result : git version 1.9.1
        
> $ nodejs --version
        
          Result : v0.12.2
        
> $ npm --version
        
          Result : 2.7.4
          
> $ nokogiri --version
        
          Result :
          
            # Nokogiri (1.6.6.2)
                  .
                  .
                  .
          
##### Construct And Test A Minimal App Which Confirms Working _Rails_ Scaffolding

Ensure you are still in the "vagrant ssh" session in your terminal program.

Enter the following commands.  These commands build and _WEBrick_ serve a web page from an example _Rails_ app named "myapp" :
    
> cd /vagrant/workspace; rvm use ruby-2.2.1@rails4.2.1; rails new myapp; cd myapp; rails s -b 0.0.0.0

Terminal output messages show the progress of the command above, which selects desired versions of Ruby and Rails, builds the scaffolding for a new Rails app named "myapp", and then executes the Rails _WEBrick_ server.

            Using /usr/local/rvm/gems/ruby-2.2.1 with gemset rails4.2.1
            exist
            create  README.rdoc
            create  Rakefile
                      .
                      .
                      .
            * bin/rake: spring inserted
            * bin/rails: spring inserted
            => Booting WEBrick
            => Rails 4.2.1 application starting ... on http://0.0.0.0:3000
                      .
                      .
                      .
            [2015-04-10 02:36:11] INFO  ruby 2.2.1 ... [x86_64-linux]
            [2015-04-10 02:36:11] INFO  _WEBrick_ ... : pid=11540 port=3000

The Rails built-in _WEBrick_ test server is now running.

Use a web browser on your _host_ to examine the resulting example web page at URL :

        http://localhost:3030
  
The example web page shows :

        Welcome aboard
        You’re riding Ruby on Rails!

You may now terminate execution of the _Rails_ _WEBrick_ test server, by entering _Ctrl-C_ in the _guest-vbox_ terminal.

This ends verification of a successful build.  You may now continue to experiment with "myapp", or you may remove it if you have no other use for it.  If you wish to remove it, you may enter the following command.

> $ cd; rm -rf /vagrant/workspace/myapp
  
        Result :
        
          vagrant@vagrant-ubuntu-trusty-64:~$
          
          The "myapp" directory and its subdirectories are deleted.
          
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
    
Note that the _guest-vbox_ _Vagrantfile_ and _.sh_ provisioning _BASH_ files, among others, are listed.

        -rw-rw-r--  1 vagrant vagrant    28 Apr 11 20:55 .gitignore
        -rw-rw-r--  1 vagrant vagrant  1085 Apr 11 20:55 LICENSE
        -rw-rw-r--  1 vagrant vagrant  1073 Apr 11 20:55 rails421-inst.sh
        -rw-rw-r--  1 vagrant vagrant 22591 Apr 11 20:55 README.md
        -rw-rw-r--  1 vagrant vagrant   110 Apr 11 20:55 ruby221-inst.sh
        -rw-rw-r--  1 vagrant vagrant   375 Apr 11 20:55 rvm-inst.sh
        drwxrws---  1 vagrant vagrant  4096 Apr 11 21:04 .vagrant
        -rw-rw-r--  1 vagrant vagrant  3250 Apr 11 20:55 Vagrantfile
        drwxrws---  1 vagrant vagrant  4096 Apr 12 01:10 workspace

These are the same files you placed into ".../vagrant-ruby-rails/" after you created it, when beginning installation of this product. 

You can manage or edit those files either from "within" the _guest-vbox_, (in _guest-vbox_ "/vagrant/"), or from "outside" the _guest-vbox_, (in _host_ ".../vagrant-ruby-rails/").
  
It is important to clearly understand that the files which _appear_ in _guest-vbox_ "/vagrant/" can have _create-read-write-delete_ operations done on them from that _guest-vbox_ directory, but, those files are not _stored_ in the _guest-vbox_ file system.  Those files reside on the _host_ file system.

That implementation detail means that files which you place in the _guest-vbox_ "/vagrant" subdirectory tree are _not_ deleted by a "vagrant destroy" command.  This is because those files can be _referenced_ in _guest-vbox_ "/vagrant", but they are _stored_ on the _host_, in ".../vagrant-ruby".

Conversely, any files _stored_ on the _guest-vbox_ file system, in any other subdirectory hierarchy, _are deleted_ along with the _guest-vbox_, by a "vagrant destroy" command.

#### Guest VBox ".../workspace/" Subdirectory

Recall that earlier you created a subdirectory in ".../vagrant-ruby-rails/" named "workspace/".  You created it while in a terminal session on the _host_ computer, on its file system.  Later, while in a "vagrant ssh" session, you created a _Rails_ app in _guest-vbox_ "/vagrant/workspace", and served its web pages from the _WEBrick_ server.

That is an example of how a subdirectory heirarchy in the _host_ ".../vagrant-ruby-rails/" subdirectory can be used from "within" the _guest-vbox_ file system.
  
Here is a ".../workspace/"-related tip for using _Git_ : At some point you may wish to commit your _guest-vbox_ _Vagrantfile_ and _.sh_ provisioning files to a _Git_ repository.  However, you probably do _not_ want the files in "workspace/", or equivalent subdirectories of ".../vagrant-ruby-rails/", to be co-mingled with commits of your _guest-vbox_ configuration/provisioning files.  You can prevent that by adding the name "workspace" into your ".../vagrant-ruby-rails/.gitignore" file.  The same is true of the hidden ".../vagrant-ruby-rails/.vagrant" subdirectory.  See the _.gitignore_ file which you placed into ".../vagrant-ruby-rails/" during installation.

## Other Notes

##### Port Mapping

The _Rails_ _WEBrick_ server port default number is 3000.  The _vagrant-ruby-rails_ _Vagrantfile_ maps _guest-vbox_ port number 3000 to _host_ port number 3030.  The choice of port number 3030 is arbitrary.  If you wish to change this port mapping to a _host_ number port which better suits your needs, you can do so by editing the _Vagrantfile_.  For more information, see the _Vagrant_ documentation about the _config.vm.network_ directive.

##### Memory (RAM) Usage

This _guest-vbox_ needs 1GB of memory allocated to it during installation, because it compiles component sources at that time.  However, after installation of this _guest-vbox_, you may wish to reduce or increase the amount of memory allocated to your _guest-vbox_.  If that is the case, you can use the _Vagrantfile_ directive _vb.memory_ to change that amount of memory.  For more information, see the _Vagrant_ documentation.

##### Storage Usage

_VirtualBox_ will dynamically increase the size of the _Ubuntu Server_ virtual disk drive as you add new files into its file system.  The maximum virtual disk drive size of this _guest-vbox_ _Ubuntu Server_ is 40GB.

##### Provisioning

Provisioning is a process during which all of the components needed for the _vagrant-ruby-rails_ _guest-vbox_ are downloaded, built, and placed into the _vagrant-ruby-rails_ _guest-vbox_.  By default, _Vagrant_ executes this time-consumng provisioning of the _guest-vbox_ only the first time "vagrant up" is executed.  Subsequent "vagrant up" commands will fetch the previously provisioned image from _host_ local storage, rather than redundantly provisioning the _guest-vbox_ every time "vagrant up" is executed.

The provisioning files, _rvm-inst.sh_, _ruby221-inst.sh_, and _rails421-inst.sh_, are _BASH_ scripts.  By understanding how the _Vagrantfile_ and the _.sh_ provisioning files work together, and by editing the contents of those files, you can easily change the default versions of the components installed, or add/remove components, as desired.

Note that if you change your provisioning files, your installed _guest-vbox_ image will need to be modified, (re-provisioned), to implement those changes.  Depending on the changes specified in the provisioning scripts, you may be able to simply modify your existing installed _guest-vbox_ image, by executing the "vagrant provision" command.  In other cases your _guest-vbox_ must be "vagrant destroyed", and a "full rebuild" done.

Please see the _Vagrant_ documentation for more information about provisioning _Vagrant Boxes_.
  
##### Installing _Vagrant_

The _vagrant-ruby-rails_ _guest-vbox_ is built and managed by _Vagrant_.  The specific version of _Vagrant_ used on the _vagrant-ruby-rails_ project development computer is _Vagrant_ 1.7.2 (DEB-64bit), which is the most recent version.  You may have success with earlier versions of _Vagrant_, but the _vagrant-ruby-rails_ project has been built/tested using only 1.7.2.

_Vagrant_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _Vagrant_ installation instructions, please visit the _Vagrant_ web site : http://docs.vagrantup.com/v2/installation/index.html

##### Installing _VirtualBox_ 

_vagrant-ruby-rails_ uses _VirtualBox_ as the provider.  The specific version of _VirtualBox_ used as the provider on the _vagrant-ruby-rails_ project development computer is _VirtualBox_ 4.3.10 (AMD64).  You will probably have success with slightly earlier versions of _VirtualBox_, or the most recent stable version, but the _vagrant-ruby-rails_ project has not tested those.

_VirtualBox_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _VirtualBox_ installation instructions, please visit the _VirtualBox_ web site : https://www.virtualbox.org/

##### If _The Build_ Fails

First, ensure you save the terminal output messages of the "vagrant up" provisioning build for future reference.  This is usually easily done by backscrolling the terminal, highlighting the terminal text, and then doing copy-paste into a file, and saving it.

Only you have access to the necessary configuration information about your _host_, so the only practical advice which can be offered here is :

###### Divide And Conquer

Identify the "milestone" at which the provisioning error occurred.  Start with the terminal output produced by the "vagrant up" command.  Use a keen eye, sometimes the clue you need is well hidden by the messy terminal output of "vagrant up" provisioning.

Important milestones can be identified in the terminal messages at intervals during provisioning.  Search your saved "vagrant up" terminal output file for a string of ##########, e.g. :

        ################   Getting RVM PGP key   ###############
                                      .
                                      .
                                      .
        ################   Installing RVM stable   ###############
                                      .
                                      .
                                      .
        ################   Installing Ruby 2.2.1    ###############
                                      .
                                      .

After you identify approximately what the provisioning script was attempting, it may be obvious from the terminal messages what is wrong.

If it's not obvious, then inspect the _.sh_ provisioning files;  _rvm-inst.sh_, _ruby221-inst.sh_, and _rails421-inst.sh_.  Find the corresponding milestone locations in the script file.  Narrow down which milestone succeeded, and which did not.  Once you find the most likely script commands, investigate as to why that particular command may have failed.

It's possible for a build to fail for quite a few reasons.  Some are :

* Unreliable Internet connection.

* One or more web sites which provide source code, or build scripts, have become unavailable, (broken links, temporarily or permanently offline). 

* Missing, misconfigured, or incompatible versions of _Vagrant_ or _VirtualBox_.

After you have found something suspicious, address it, either by changing some configuration of your _host_, (most likely to resolve the problem), or by modifying the provisioning script, (see broken links, above).

Then, try again to "vagrant up" _vagrant-ruby-rails_.  Before doing so, be aware that the _.sh_ provisioning scripts in this version of _vagrant-ruby-rails_ are not idempotent, meaning, the likelyhood of producing a correctly provisioned _vagrant-ruby-rails_ _Vagrant Box_ is low if you simply re-run "vagrant up" after installation failed, even after you have implemented a "guaranteed" fix for an error.  Unless you know otherwise, your best course of action after implementing an error correction is to execute "vagrant destroy", and then execute "vagrant up" again.

## The Short List Of Online References

If you are unfamiliar with the products in this document, you may wish to inform yourself about them.  The references "short list" is :

###### _Vagrant_        : https://docs.vagrantup.com/v2/
###### _VirtualBox_     : https://www.virtualbox.org/
###### _Ruby On Rails_  : http://rubyonrails.org/
###### _Ruby_           : https://www.ruby-lang.org/en/
###### _Ruby Gems_      : https://rubygems.org/
###### _Git_            : http://git-scm.com/
###### _RVM_            : https://rvm.io/
###### _Node.js_        : https://nodejs.org/

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

##### _Node.js_ 0.12.2
  
_Node.js_ is installed using the instructions at Nodesource, https://nodesource.com/blog/nodejs-v012-iojs-and-the-nodesource-linux-repositories.

##### _Nokogiri_ 1.6.6.2
  
_Nokogiri_ is installed by _Gem_, "gem install nokogiri --no-document".

### Caveats And Known Issues

###### The computer used for development of this project is a generic _AMD/Linux_ box running _Ubuntu Desktop 14.04 LTS_. If you install this _guest-vbox_ on _OS X_ or _Windows_, you are venturing into unexplored territory; installation may be successful, or it may not.  Which of the two is unknown as of this writing.  For _OS X_ or _Windows_, you may also need to install other software unknown to the author of this document.

##### "works on my machine"

This product, at this time, is in the _alpha_ stage of development.  Extensive testing has not been done on its components, only its gross operation has been confirmed .  _Host_ hardware and _host_ OS environment testing has been limited to the single generic _AMD/Ubuntu Linux_ box used for development.

##### The Provisioning Scripts Are Incomplete

The provisioning _BASH_ scripts build a working _Vagrant Box_ by downloading essential components/sources from the Internet.  The provisioning _BASH_ scripts install the components as described herein, but, at this time they have _no_ error detection/handling, per se.  If system environment problems, such as a flaky Internet connection, or lack of storage space, causes errors during provisioning, these scripts will not handle errors gracefully.

### Licensing And Disclaimer

_USE THIS PRODUCT AT YOUR OWN RISK. The author and any other contributors are not responsible or liable for adverse consequences caused by use of this product, even if it is used as designed, or as described or implied, herein or elsewhere._

Please read the _MIT License_ included with this README file for important licensing information and disclaimers.



  
###### Copyright 2015 CK Thomaston, all rights reserved.
###### DalorWeb LLC, http://dalorweb.com

