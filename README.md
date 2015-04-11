# vagrant-ruby-rails

### A Ruby On Rails Development Environment (Basic)

##### Containing Ubuntu Server 14.04, Ruby 2.2.1, Gems 2.4.6, Rails 4.2.1, RVM 1.26.11, Git 1.9.1, and Node.js 0.10.25.

This is a _Vagrant Box_, (https://www.vagrantup.com), intended for quick installation of a very basic _Ruby On Rails_ development environment.  The virtual machine "provider" in this guest vbox is _VirtualBox_.

Assuming _Vagrant_ and _VirtualBox_ are already installed on your host computer, this _Vagrant Box_ may be quickly installed.  If desired, it may also be even more qickly removed. After removal, only a small number of associated files, which are easily located, may be reused to re-install the guest vbox.  Or, after being removed by the "vagrant destroy" command, all traces of this product can be quickly removed by deleting the subdirectory containing those associated files.

Because it can be rebuilt quickly if necessary, this _Vagrant Box_ may be handy for transient work, perhaps due to a need for a sacrificial development environment, or simply to be easily discarded after Ruby/Rails evaluation or tutorials.  Or, if the configuration/provisioning files are maintained as needed during any significant customization of the environment by developers, the guest vbox may be used to recover from unanticipated corruption of a long-term development environment.  It also allows easy reproduction and distribution of exact duplicates of a development environment shared among multiple project members.

_Git_ is included as a convenience, for placing _Ruby/Rails_ files or other sources into repositories.  If you customize this guest vbox's configuration and provisioning files, using a _Git_ repository may allow you to recreate your custom guest vbox environment in the future.  In that case, _Git_ is useful for managing versions for yourself, or for sharing your customized guest vbox with others, via an online _Git_ repository.

_Ruby Version Manager, (RVM)_, is used during some of the guest vbox provisioning, and it may also be useful later during _Ruby/Rails_ project managment.

_Node.js_ is installed during installation of this guest vbox.  It is used during compilation of one or more gems required by _Rails_.

The gem _Nokogiri_, a dependency of many other commonly used gems, is compiled and installed into the _RVM_ global gemset during installation of this guest vbox.

#### Overview Of Installation And Use

To install this software, your computer needs an Internet connection, and your computer has to meet the hardware minimum requirements of 1GB of available memory (Free RAM), and 3GB of disk storage.  Your specific application may require more, or less, memory allocated to the guest vbox image at run-time, but 1GB will install "vagrant-ruby-rails", and be adequate for evaluation of its capabilities.  Your long term disk storage space requirement will also be determined by your application.  _VirtualBox_ will dynamically increase the size of the _Ubuntu Server_ virtual disk drive as you add new files into its file system.  The maximum virtual disk drive size of _Ubuntu Server_ is 40GB.  For more information, see the "Other Notes" section in this document, below.

Your computer mist have an operating system installed which supports _Vagrant_ and _VirtualBox_.

A terminal emulation program must be installed on your host, which is used for opening an _ssh_ terminal session on the installed guest vbox.  This is necessary for sysadmin work on the _Ubuntu Server_ guest vbox, and with the other installed development tools, (_Rails_, etc).

The "vagrant-ruby-rails" installation process is described in detail below.

###### Caveat :  The computer used for development of this project is a generic _AMD/Linux_ box running _Ubuntu Desktop 14.04 LTS_. If you install this guest vbox on _OS X_ or _Windows_, you are venturing into unexplored territory; installation may be successful, or it may not.  Which of the two is unknown as of this writing.  For _OS X_ or _Windows_, you may also need to install other software unknown to the author of this document.

#### Online References You May Wish To Review Before Proceeding

If you are unfamiliar with the products in this document, you may wish to inform yourself about them.  The references "short list" is :

###### _Vagrant_        : https://docs.vagrantup.com/v2/
###### _VirtualBox_     : https://www.virtualbox.org/
###### _Ruby On Rails_  : http://rubyonrails.org/
###### _Ruby_           : https://www.ruby-lang.org/en/
###### _Ruby Gems_      : https://rubygems.org/
###### _Git_            : http://git-scm.com/
###### _RVM_            : https://rvm.io/

## Software Installation

Before beginning installation of "vagrant-ruby-rails", you must already have _Vagrant_ and _VirtualBox_ installed and properly configured. Because "vagrant-ruby-rails" is built from sources using scripts, 32-bit vs 64-bit, (and other), binary compatibility issues should not be a problem.  Choose versions of _Vagrant_ and _VirtualBox_ which you deem are the best fit for your needs.
  
### Install _VirtualBox_ 

"vagrant-ruby-rails" uses _VirtualBox_ as the provider.  The specific version used as the provider on my development computer is _VirtualBox_ 4.3.10 (AMD64).  You will probably have success with slightly earlier versions of _VirtualBox_, or the most recent stable version, but I have not tested those.

_VirtualBox_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _VirtualBox_ installation instructions, please visit the _VirtualBox_ web site : https://www.virtualbox.org/

### Install _Vagrant_

The "vagrant-ruby-rails" guest vbox is built and managed by _Vagrant_.  The specific version used as the provider on my development computer is _Vagrant_ 1.7.2 (DEB-64bit), which is the most recent version.  You may have success with earlier versions of _Vagrant_, but I have built/tested using only 1.7.2.

_Vagrant_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _Vagrant_ installation instructions, please visit the _Vagrant_ web site : http://docs.vagrantup.com/v2/installation/index.html

### Installation of _"vagrant-ruby-rails"_

#### Prepare For "The Build"

Let's begin installation of "vagrant-ruby-rails" proper.  Bring up a terminal in your host, and follow the instructions below.  In the following sections, a terminal command prompt is indicated by the symbol $.

1. Create a "home" directory for the guest vbox in a convenient subdirectory location.  Name it whatever you wish.  Herein, I will refer to it as "vagrant-ruby".  At times it may also be referred to as ".../vagrant-ruby/" :
    
    - $ mkdir vagrant-ruby

2. Download a zip file containing the files from the github repository page, https://github.com/ckthomaston/vagrant-ruby-rails.

  While using the same file and subdirectory hierarchy as in the repository, extract those files into the ".../vagrant-ruby/" subdirectory you just created above.

3. Make the guest vbox "home" directory your current working directory :

    - $ cd vagrant-ruby

4. Enter the following command :
  
    - $ mkdir workspace
      
    A ".../vagrant-ruby/workspace/" subdirectory is created.
      
#### Do "The Build"

The work done by the provisioning scripts during this initial "vagrant up" build will not be done the next time "vagrant up" is executed, because provisioning is a one-time process.  Subsequent "vagrant up" operations result in a loaded and operational system in approximately one minute or less.  Also, the likelyhood of an error occurring during future "vagrant up" operations is significantly reduced, assuming initial provisioning completes successfully.  If necessary, you may force "vagrant up" to re-provision whenever you wish.

Enter the following command :
  
    - $ vagrant up
      
The build starts.

Now wait...

A very long list of text messages is output during the build process, beginning with :
  
        "==> Bringing machine 'default' up with 'virtualbox' provider..."
     
Depending on the speed of your computer and the speed of your Internet connection, the build will take eight to fifteen minutes or more, as the _Ubuntu Server_ image is downloaded, _Ruby_ and the _Gem_ sources are downloaded and compiled, and _RVM_ and _Git_ are downloaded and installed.

During that process, the build tools will output status/progress messages.  Most of the informational messages displayed are green in color, but, there will also be a _lot_ of red-color text output.  Seeing all that "blood" is somewhat alarming, but it is normal.  The output messages of _gpg_ and _curl_ are _red_ and the formatting is very _broken_.  This unpleasant output is an artifact of the "vagrant up" command, as _gpg_ and _curl_ typically have nice output.

Unfortunately, this messy output makes it difficult to spot a genuine error which should be investigated.  Typically, if the build fails, it will often stop with an obvious error message, but in some unusual cases it does not.  After the build finishes, you should scroll back through the terminal output messages and scrutinize them, because sometimes the build forges onward after an error.

However, until the build stops, don't be unnecessarily alarmed.  There are a number of _red_ messages which are not errors, they are informational only.  As an example, the _red_ text message,

        "==> default: stdin: is not a tty"
    
can be safely ignored.
  
After the build completes successfully, the last build message reads :
  
        "==> default: Setting up git (1:1.9.1-1ubuntu0.1) ..."
  
#### Verify "The Build"

##### Verify The Toolset Has Properly Installed

When the command prompt is subsequently displayed, enter the following command :
  
    - $ vagrant ssh
    
This will open an _ssh_ terminal shell on the guest vbox.  After a few seconds, you see an _Ubuntu_ shell welcome screen, and a command prompt which reads :
    
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

Enter the following commands.  These commands build and execute a "basic" _Rails_ app named "myapp" :
    
    - $ cd /workspace; mkdir myapp; cd myapp      # note semicolons
  
        Result : A command prompt in the terminal.  "myapp" is the cwd

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
                      
                      .
                      
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
                      
                      .
                      
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

You may now terminate execution of the _Rails_ WEBrick test server, by entering _Ctrl-C_ in the guest vbox terminal.

This ends preliminary verification of a successful build.  You may now remove the "myapp" scaffolding test program, if you have no other use for it.  If you wish to remove it, you may enter the following command.  (Always double-check your spelling when entering a command which contains "rm -rf ...").

    - $ cd ../; rm -rf /workspace/myapp     # be careful with rm -rf
  
        Result :
        
          "myapp" deleted.  The current working directory is now /workspace.

### Using "vagrant-ruby-rails"

Not much can be said here about how to use _Ruby_, the _Gems_, _Rails_, _RVM_, _Git_, and the other tools which come with _Ubuntu Server_, such as _VIM_.  Those subjects are better covered elsewhere.  But a few points unique to this particular project warrant some elaboration.
  
Using the instructions above, you ventured "inside" the guest vbox, using "vagrant ssh" to verify the success of the build and the versions of its components.  If you are not still there in your terminal, let's go back in there again, and do some exploring.

Starting from within the ".../vagrant-ruby/" directory, in your regular host terminal shell, enter the following command :
    
    - $ vagrant ssh
    
This will open an _ssh_ terminal shell into the guest vbox.  Then, enter :

    - $ ls -l /     # list the contents of the root directory
    
In the listing which results, notice a typical _Ubuntu Server 14.04_ root directory hierarchy, inside the guest vbox file system.

        total 92
        
        drwxr-xr-x  2 root    root     4096 Apr  6 20:06 bin
        
        drwxr-xr-x  3 root    root     4096 Apr  6 20:06 boot
        
        drwxr-xr-x 13 root    root     3880 Apr  8 20:43 dev
        
                .
                
                .
                
                .
                
        drwxrws---  1 vagrant vagrant  4096 Apr  8 08:34 vagrant
        
        drwxr-xr-x 13 root    root     4096 Apr  8 11:10 var
        
        lrwxrwxrwx  1 root    root       30 Apr  6 20:05 vmlinuz...
        
However, also notice there is one subdirectory not typically found in an _Ubuntu Server_ root directory hierarchy.  It is named "/vagrant/".  It is discussed below.

#### Guest VBox"/vagrant/" Subdirectory

The guest vbox "/vagrant/" subdirectory is sync'd by _VirtualBox_ to a directory you created earlier on the host filesystem, the one (herein) named ".../vagrant-ruby/".  The guest vbox "/vagrant/" subdirectory and the host ".../vagrant-ruby/" directory can be considered as being the same directory; they are effectively "mapped into" a single directory.  See that for yourself by entering the following command :

    - $ ls -l /vagrant    # list the contents of the guest vbox  /vagrant dir
    
Note that the guest vbox's _Vagrantfile_ and _.sh_ provisioning _BASH_ files, among others, are listed.

        -rw-rw-r-- 1 ckt admins 1.1K Apr  9 16:19 LICENSE
        
        -rw-rw-r-- 1 ckt admins 1.1K Apr  9 18:46 rails421-inst.sh
        
        -rw-rw-r-- 1 ckt admins  24K Apr 10 18:13 README.md
        
        -rw-rw-r-- 1 ckt admins  110 Apr  9 17:18 ruby221-inst.sh
        
        -rw-rw-r-- 1 ckt admins  375 Apr  9 16:19 rvm-inst.sh
        
        -rw-rw-r-- 1 ckt admins 3.2K Apr  9 20:30 Vagrantfile

You may therefore manage or edit those files either from "within" the guest vbox, (in the guest vbox "/vagrant/" subdirectory), or from "outside" the guest vbox, (in the host ".../vagrant-ruby/" subdirectory).
  
By the way, if you desire to do so, you may customize the configuration/operation of your guest vbox by modifying the _Vagrantfile_ and _.sh_ provisioning files.  After having done so, if you wish to place those modified _Vagrant Box_ configuration files into a _Git_ source repository of your own, the host's ".../vagrant-ruby/" directory is probably the best place to install a local _Git_ repository, (do a "git init"), for that purpose.  _Git_ is ready to be executed from the "vagrant ssh" shell immediately after guest vbox installation.  All you need to do is enter your "git config..." info, such as your name and email address, (and remote repository URL, if desired), and _Git_ is ready for use.

Recall that earlier you created a subdirectory in ".../vagrant-ruby/" named "workspace/".  "workspace" is an example of how a subdirectory heirarchy under ".../vagrant-ruby/" can be used to edit, build, or otherwise manage your project's files from "within" the guest vbox filesystem, or "outside" of the guest vbox by using the host's filesytem.
  
If you want your guest vbox _Vagrantfile_ and _.sh_ files committed in a _Git_ repository, you probably want to exclude "workspace" or other subdirectories of ".../vagrant-ruby/" from your _Git_ commits, because if your projects are non-trivial you probably don't want your project's files co-mingled with your commits of your ".../vagrant-ruby/" _Vagrantfile_ and _.sh_ files.  Do that by adding "workspace" into your ".../vagrant-ruby/.gitignore" file.

It is important to clearly understand that the files which _appear_ in the guest vbox "/vagrant/" subdirectory are _accessible_ from that directory, but those files are not actually _stored_ in the guest vbox filesystem.  The files actually reside on the _host_ filesystem.  Another way to think of those files is that they are accessed from "within" the guest vbox via file system links.

An important advantage to that implementation detail is that your files are not deleted by a "vagrant destroy" command.  This is a very important system configuration detail to understand.  If you have stored any of your non-disposable project files "inside the box's" filesystem, then executing "vagrant destroy" without first backing up your project files will probably ruin your day.

#### Other Notes

##### Port Mapping

The _Rails_ WEBrick server port default number is 3000.  The "vagrant-ruby-rails" _Vagrantfile_ maps the guest vbox port number 3000 to host port number 3030.  The choice of port number 3030 is arbitrary.  If you wish to change this port mapping to a host number port which better suits your needs, you may do so by editing the _Vagrantfile_.  For more information, see the _Vagrant_ documentation about the "config.vm.network" directive.

##### Memory (RAM) Usage

This guest vbox needs 1GB of memory during installation because it compiles component sources at that time.  However, after installation of this guest vbox, you may need less memory, (or more), while developing your projects.  If that is the case, you may use the _Vagrantfile_ memory directive to change the amount of memory allocated to this guest vbox when it is loaded into memory.  For more information, see the _Vagrant_ documentation about the "vb.memory" directive.

##### Provisioning

Provisioning is a process during which the all of the components needed for the "vagrant-ruby-rails" guest vbox are downloaded, (some of them are also compiled), and stored on your hard drive.  Vagrant executes this time-consumng provisioning of the guest vbox only once, the first time "vagrant up" is executed.  Subsequent "vagrant up" commands will load the previously built image from your local hard drive.  Therefore, the most time consuming "vagrant up" operation is the first one.  Unless you "vagrant destroy" your image, or force "vagrant up" to re-provision the guest vbox, doing subsequent "vagrant up" commands will skip the provisioning stage, and instead will load the previously provisioned image, usually in one minute or less.

The provisioning files, _rvm-inst.sh_, _ruby221-inst.sh_, and _rails421-inst.sh_, are _BASH_ scripts.  By understanding how the _Vagrantfile_ and the _.sh_ provisioning files work together, and by editing the contents of those files, you can easily change the (known) versions of the components installed, or add/remove components, as desired.  Read the _Vagrant_ documentation for more information about provisioning _Vagrant Boxes_.
  
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

##### "works on my machine"

This product, at this time, is in the _alpha_ stage of development.  Extensive testing has not been done on its components, only its gross operation has been confirmed .  Hardware and host OS environment testing has been limited to the single generic _AMD/Ubuntu Linux_ box used for development.

##### The Provisioning Scripts Are Incomplete

The provisioning _BASH_ scripts build a working _Vagrant Box_ by downloading essential components/sources from the Internet.  The provisioning _BASH_ scripts install the components as described herein, but, at this time they have _no_ error detection/handling, per se.  If, as examples, a flaky Internet connection, or lack of disk space, causes errors during the build, the provisioning scripts will _not_ handle these errors gracefully.

### Licensing And Disclaimers

_USE THIS PRODUCT AT YOUR OWN RISK. The author and any other contributors are not responsible or liable for adverse consequences caused by use of this product, even if it is used as designed or as implied by any description herein or elsewhere._

Please read the _MIT License_ included with this README file for important licensing information and disclaimers.



  
###### Copyright 2015 CK Thomaston, all rights reserved.
###### DalorWeb LLC, http://dalorweb.com

