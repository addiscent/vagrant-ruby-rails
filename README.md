# _vagrant-ruby-rails_

### A Ruby On Rails Development Environment (Basic)

##### Containing Ubuntu Server 14.04, Ruby 2.2.4, Rails 4.2.6, Git 1.9.1, Node.js 0.10.37

This is a _Vagrant Box_, (https://www.vagrantup.com), intended for quick installation of a very basic _Ruby On Rails_ development environment.  Assuming _Vagrant_ and _VirtualBox_ are already installed on your _host_ computer, this _Vagrant Box_ can be easily and quickly installed and removed.

Because it can be quickly built or rebuilt if necessary, this _Vagrant Box_ may be handy for transient work environments, such as tutorials, or experimental work which may sacrifice the development environment.

It also allows easy reproduction and distribution of exact duplicates of a development environment shared among multiple project members.

The installed _Git_ software can be used for committing _Ruby/Rails_ project files or other sources into repositories.  If you customize the configuration and provisioning files of this _vagrant-ruby-rails_ _Vagrant Box_, and then save them in a _Git_ repository, you can easily recreate your custom _vagrant-ruby-rails_ _Vagrant Box_ development environment in the future.  Or, using an online _Git_ repository, you can easily share your customized _vagrant-ruby-rails_ _Vagrant Box_ with other users.

Definitions : A "_host_" is a computer on which you will be installing _vagrant-ruby-rails_.  _Vagrant-ruby-rails_ is a "_guest_" installed onto your "_host_" computer.  Because the _vagrant-ruby-rails_ "_guest_" is a _Vagrant Box_, it is referred to in this document as a _guest-vbox_.

If you are very unfamiliar with the software products listed at the top of this document, you may wish to visit online references before proceeding.  Some relevant online resources are listed in a section near the end of this document, titled "The Short List Of Online References".

## Introduction To Installation And Use

To install _vagrant-ruby-rails_, your _host_ computer needs :

  * An Internet connection

  * 512MB of available memory (free RAM) - After installation, you may increase or decrease the amount of _host_ memory allocated to the _guest-vbox_.

  * 2.5GB of storage (minimum) - Your long term _host_ storage space requirement will be determined by your application.

  * _Vagrant_ and _VirtualBox_ - Your _host_ computer must have an operating system installed which supports _Vagrant_ and _VirtualBox_, and those must be installed prior to installing _vagrant-ruby-rails_.

  * A _host_ CPU capable of running a 64bit Ubuntu Linux image inside the _guest-vbox_.  It is possible to use a 32bit Ubuntu Linux image inside the _guest-vbox_, but the _Vagrantfile_ must be revised after downloading the _vagrant-ruby-rails_ setup files.  See the section near the end of this document titled "Using _Ubuntu/Trusty32_".

  * A terminal/shell program - previously installed on the _host_.

  * A zip file extraction program - previously installed on the _host_.

This project has been tested on _Ubuntu 14.04_ and _Windows 7_ _hosts_, but _not_ on _OS X_.

#### Quickstart For Experts Already Running Vagrant With VirtualBox On Linux or Windows

##### A New Rails Dev Env And App, In Seven Easy Steps, (for details, see _Software Installation_)

###### Copy-and-Paste The Given Commands Into Your Terminal Session

1. Open a terminal session in your _host_ computer storage workspace.

2. Navigate to a location where you wish to create a directory which will contain _vagrant-ruby-rails_.

3. Download ZIP _vagrant-ruby-rails_ file from GitHub into the current dirctory, (or move it here if downloaded to a different directory)., e.g.,
> $ wget -O  vagrant-ruby-rails.zip  https://github.com/addiscent/vagrant-ruby-rails/archive/master.zip

4. Unzip _vagrant-ruby-rails_ files from the zip file, e.g.,
> $ unzip  vagrant-ruby-rails.zip

5. Navigate into the vagrant-ruby-rails directory created by unzipping, e.g.,
> $ cd  vagrant-ruby-rails-master

6. Create a directory and spin up a Vagrant Box.  The spin-up provisioning installs Rails.
> $ mkdir workspace && vagrant up && vagrant ssh

  Now wait a while for the _Ubuntu Server 14.04_ image to download and provision. The amount of wait time is mostly determined by the speed of the connection to Atlas/Hashicorp.  Typically, the _Ubuntu Server 14.04_ image requires 18 minutes to download.  The time required to provision the downloaded image is approximately eight minutes. These operations happen only once, the first time _vagrant up_ is executed.
  
  After the image finishes downloading and provisioning is complete, you see the prompt of the _guest-vbox_ :
> _vagrant@vagrant-ubuntu-trusty-64:~$_

7. Create a new Rails app and start the thin web server
> $ cd /vagrant/workspace && rails new myapp && cd myapp && rails s -b 0.0.0.0

Open a web browser to _http://localhost:3030_

        Welcome aboard
        You’re riding Ruby on Rails!

The following set of commands is the minimum required to control a _Vagrant Box_:

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

> $ mkdir vagrant-ruby-rails && cd vagrant-ruby-rails && mkdir workspace

Windows users note : This "one-liner" command above works in PowerShell, but the "Windows Command Prompt" will not process this line properly; you must split it into separate commands like this:

> \> mkdir vagrant-ruby-rails

> \> cd vagrant-ruby-rails

> \> mkdir workspace

The command above created the "home" directory, named "vagrant-ruby-rails", where your new _vagrant-ruby-rails_ development environment will be installed.  This is the directory from which you will launch your new _vagrant-ruby-rails_ _guest-vbox_.  The "vagrant-ruby-rails" directory is also referred to elsewhere in this document as ".../vagrant-ruby-rails/".  A subdirectory named ".../vagrant-ruby-rails/workspace/" is also created by the command above.  It will be used later.

Next, visit the _vagrant-ruby-rails_ GitHub repository at, https://github.com/addiscent/vagrant-ruby-rails.  On that page, click the "(tag) releases" link near the top.  On the subsequent page, download a ZIP file containing the _vagrant-ruby-rails_ project files.  Select the most recent tagged version.

Extract those files into the current working directory, (".../vagrant-ruby-rails/").

After extraction, verify the contents of ".../vagrant-ruby-rails/".  Enter the following command :

> $ ls -al

A directory listing shows the following, (or very similar), contents :

        -rw-rw-r--  1 user group   210 Mar  8 15:06 buildconfig
        -rwxr-xr-x  1 user group   572 Apr 17 15:21 enable_repos.sh
        -rw-rw-r--  1 user group    28 Apr 17 11:37 .gitignore
        -rwxr-xr-x  1 user group   143 Apr 17 13:19 install.sh
        -rw-rw-r--  1 user group 11350 Apr 17 11:37 LICENSE
        -rwxr-xr-x  1 user group   187 Apr 17 15:28 prepare.sh
        -rw-rw-r--  1 user group 26965 Apr 17 14:37 README.md
        -rwxr-xr-x  1 user group  1013 Apr 17 13:20 ruby2.2.sh
        -rwxr-xr-x  1 user group  1692 Apr 17 12:50 ruby-finalize.sh
        -rwxr-xr-x  1 user group  6027 Mar  8 15:06 ruby-switch
        -rwxr-xr-x  1 user group   265 Apr 17 12:49 utilities.sh
        drwxrwsr-x  1 user group  4096 Apr 18 01:43 .vagrant
        -rw-rw-r--  1 user group  3050 Apr 17 13:22 Vagrantfile
        drwxrws---  2 user group  4096 Apr 17 15:29 workspace

#### Do _The Build_

The "vagrant up" command executed below will provision and start a _vagrant-ruby-rails_ _Vagrant Box_.

The work done by Vagrant and the provisioning scripts during this initial "vagrant up" operation will only be performed once; downloading the image and provisioning it is a one-time process.  Therefore, subsequent "vagrant up" operations will result in a running _guest-vbox_ within approximately one minute.

However, downloading and provisioning the _Ubuntu Server 14.04_ image the first time consumes a rather substantial amount of time.  The total time is mostly determined by the speed of the _host's_ Internet connection to Atlas/Hashicorp.  Typically, the _Ubuntu Server 14.04_ image requires 18 minutes to download.  This happens only once, the first time _vagrant up_ is executed.  In the future, whenever an _Ubuntu Server 14.04_ image is needed, it is fetched from the local host's cache of Vagrant Boxes.

Provisioning is also a one-time only operation.  Provisioning typically takes eight minutes.  There is a large amount of terminal message output during provisioning.  The vast majority of messages log the construction of software which is being placed _into the_  _vagrant-ruby-rails_ _Vagrant Box_.  During this procedure, _Ruby, Gems, Rails, Git, and Node.js_ are _not_ placed directly onto your _host_, they are placed into the _guest-vbox_.  When provisioning of the _guest-vbox_ finishes,  the _guest-vbox_ is then stored onto the _host_.

Enter the following command :

> $ vagrant up && vagrant ssh

  Windows users note : Same "Command Prompt Window" caveat as above.

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
        "==> default: RubyGems system software updated"

#### Verify _The Build_

##### Verify The Toolset Has Properly Installed

When _The Build_ is finished, an _Ubuntu_ shell welcome screen and a command prompt are displayed.  The command prompt shows :

>  vagrant@vagrant-ubuntu-trusty-64:~$

Enter the following commands.  Notice the components which have been installed, and their associated version numbers :

> $ ruby --version

          Result :

            ruby 2.2.4p230 (2015-12-16 revision 53155) [x86_64-linux-gnu]]

> $ bundler --version

          Result : Bundler version 1.12.4

> $ gem --version

          Result : 2.6.4

> $ rails --version

          Result : 4.2.6

> $ git --version

          Result : git version 1.9.1

> $ nodejs --version

          Result : v0.10.37

> $ npm --version

          Result : 1.4.28

Note the name of the currrently logged-in user is _vagrant_.  The user _vagrant_ is the user logged in by default on this _vagrantbox_.

You may need to know the following credentials for some admin activities in this _vagrantbox_ :

      user : vagrant
      password : vagrant

##### Construct And Test A Minimal App Which Confirms Working _Rails_ Scaffolding

Ensure you are still in the "vagrant ssh" session in your terminal program.

Enter the following commands.  These commands build and _WEBrick_ serve a web page from an example _Rails_ app named "myapp" :

> $ cd /vagrant/workspace && rails new myapp && cd myapp && rails s -b 0.0.0.0

Terminal output messages show the progress of the command above, which builds the scaffolding for a new Rails app named "myapp", and then executes the Rails _WEBrick_ server.

        exist
        create  README.rdoc
        create  Rakefile
                  .
                  .
                  .
        * bin/rake: spring inserted
        * bin/rails: spring inserted
                  .
                  .
                  .
        => Booting WEBrick
        => Rails 4.2.6 application starting...
                  .
                  .
                  .
        [2015-04-17 23:08:48] INFO  WEBrick::HTTPServer#start: pid=7526 port=3000

The Rails built-in _WEBrick_ test server is now running.

Use a web browser on your _host_ to examine the resulting example web page at URL :

        http://localhost:3030

The example web page shows :

        Welcome aboard
        You’re riding Ruby on Rails!

You may now terminate execution of the _Rails_ _WEBrick_ test server, by entering _Ctrl-C_ in the _guest-vbox_ terminal.

This ends verification of a successful build.  You may now continue to experiment with "myapp", or you may remove it if you have no other use for it.  If you wish to remove it, you may enter the following command.

> $ cd && rm -rf /vagrant/workspace/myapp

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

Note that the _guest-vbox_ _Vagrantfile_ and _.sh_ provisioning _Bash_ files, among others, are listed.

        -rw-rw-r--  1 vagrant vagrant   210 Mar  8 22:06 buildconfig
        -rwxr-xr-x  1 vagrant vagrant   572 Apr 17 22:21 enable_repos.sh
        -rwxr-xr-x  1 vagrant vagrant   143 Apr 17 20:19 install.sh
        -rw-rw-r--  1 vagrant vagrant 11350 Apr 17 18:37 LICENSE
        -rwxr-xr-x  1 vagrant vagrant   187 Apr 17 22:28 prepare.sh
        -rw-rw-r--  1 vagrant vagrant 26751 Apr 17 23:12 README.md
        -rwxr-xr-x  1 vagrant vagrant  1013 Apr 17 20:20 ruby2.2.sh
        -rwxr-xr-x  1 vagrant vagrant  1692 Apr 17 19:50 ruby-finalize.sh
        -rwxr-xr-x  1 vagrant vagrant  6027 Mar  8 22:06 ruby-switch
        -rwxr-xr-x  1 vagrant vagrant   265 Apr 17 19:49 utilities.sh
        -rw-rw-r--  1 vagrant vagrant  3050 Apr 17 20:22 Vagrantfile
        drwxrws---  1 vagrant vagrant  4096 Apr 17 23:08 workspace

These are the same files you placed into ".../vagrant-ruby-rails/" after you created it, when beginning installation of this product.

You can manage or edit those files either from "within" the _guest-vbox_, (in _guest-vbox_ "/vagrant/"), or from "outside" the _guest-vbox_, (in _host_ ".../vagrant-ruby-rails/").

It is important to clearly understand that the files which _appear_ in _guest-vbox_ "/vagrant/" can have _create-read-write-delete_ operations done on them from that _guest-vbox_ directory, but, those files are not _stored_ in the _guest-vbox_ file system.  Those files reside on the _host_ file system.

That implementation detail means that files which you place in the _guest-vbox_ "/vagrant" subdirectory tree are _not_ deleted by a "vagrant destroy" command.  This is because those files can be _referenced_ in _guest-vbox_ "/vagrant", but they are _stored_ on the _host_, in ".../vagrant-ruby-rails".

Conversely, any files _stored_ on the _guest-vbox_ file system, in any other subdirectory hierarchy, _are deleted_ along with the _guest-vbox_, by a "vagrant destroy" command.

#### Guest VBox ".../workspace/" Subdirectory

Recall that earlier you created a subdirectory in ".../vagrant-ruby-rails/" named "workspace/".  You created it while in a terminal session on the _host_ computer, on its file system.  Later, while in a "vagrant ssh" session, you created a _Rails_ app in _guest-vbox_ "/vagrant/workspace", and served its web pages from the _WEBrick_ server.

That is an example of how a subdirectory heirarchy in the _host_ ".../vagrant-ruby-rails/" subdirectory can be used from "within" the _guest-vbox_ file system.

Here is a ".../workspace/"-related tip for using _Git_ : At some point you may wish to commit your _guest-vbox_ _Vagrantfile_ and _.sh_ provisioning files to a _Git_ repository.  However, you probably do _not_ want the files in "workspace/", or equivalent subdirectories of ".../vagrant-ruby-rails/", to be co-mingled with commits of your _guest-vbox_ configuration/provisioning files.  You can prevent that by adding the name "workspace" into your ".../vagrant-ruby-rails/.gitignore" file.  The same is true of the hidden ".../vagrant-ruby-rails/.vagrant" subdirectory.  See the _.gitignore_ file which you placed into ".../vagrant-ruby-rails/" during installation.

## Other Notes

##### Port Mapping

The _Rails_ _WEBrick_ server port default number is 3000.  The _vagrant-ruby-rails_ _Vagrantfile_ maps _guest-vbox_ port number 3000 to _host_ port number 3030.  The choice of port number 3030 is arbitrary.  If you wish to change this port mapping to a _host_ number port which better suits your needs, you can do so by editing the _Vagrantfile_.  For more information, see the _Vagrant_ documentation about the _config.vm.network_ directive.

##### Memory (RAM) Usage

Based on your application needs you may wish to reduce or increase the amount of memory allocated to your _guest-vbox_.  If that is the case, after installation of this _guest-vbox_, you can use the _Vagrantfile_ directive _vb.memory_ to change the amount of allocated memory.  For more information, see the _Vagrant_ documentation.

##### Storage Usage

_VirtualBox_ will dynamically increase the size of the _guest-vbox_ _Ubuntu Server_ virtual disk drive as you add new files into its file system.  The maximum virtual disk drive size of this _guest-vbox_ _Ubuntu Server_ is 40GB.  This limit was set by the original developer of the _Ubuntu Server 14.04_ _VirtualBox_ image; it cannot be changed by the user.

##### Provisioning

Provisioning is a process during which all of the components needed for the _vagrant-ruby-rails_ _guest-vbox_ are downloaded, built, and placed into the _vagrant-ruby-rails_ _guest-vbox_.  By default, _Vagrant_ executes this time-consumng provisioning of the _guest-vbox_ only the first time "vagrant up" is executed.  Subsequent "vagrant up" commands will fetch the previously provisioned image from _host_ local storage, rather than redundantly provisioning the _guest-vbox_ every time "vagrant up" is executed.

The provisioning files are _Bash_ scripts.  By understanding how the _Vagrantfile_ and the _.sh_ provisioning files work together, and by editing the contents of those files, you can easily change the default versions of the components installed, or add/remove components, as desired.

Note that if you change your provisioning files, your installed _guest-vbox_ image will need to be modified, (re-provisioned), to implement those changes.  Depending on the changes specified in the provisioning scripts, you may be able to simply modify your existing installed _guest-vbox_ image, by executing the "vagrant provision" command.  In other cases your _guest-vbox_ must be "vagrant destroyed", and a "full rebuild" done.

Please see the _Vagrant_ documentation for more information about provisioning _Vagrant Boxes_.

##### Installing _Vagrant_

The _vagrant-ruby-rails_ _guest-vbox_ is built and managed by _Vagrant_.  The specific version of _Vagrant_ used on the _vagrant-ruby-rails_ project development computer is _Vagrant_ 1.8.1 (DEB-64bit).  You may have success with earlier versions of _Vagrant_, but the _vagrant-ruby-rails_ project has been built/tested using only 1.8.1.

_Vagrant_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _Vagrant_ installation instructions, please visit the _Vagrant_ web site : http://docs.vagrantup.com/v2/installation/index.html

##### Installing _VirtualBox_

_vagrant-ruby-rails_ uses _VirtualBox_ as the provider.  The specific version of _VirtualBox_ used as the provider on the _vagrant-ruby-rails_ project development computer is _VirtualBox_ 5.0.20 r106931 (AMD64).  You will probably have success with slightly earlier versions of _VirtualBox_, or the most recent stable version, but the _vagrant-ruby-rails_ project has not tested those.

_VirtualBox_ installation is typically not difficult for those persons familiar with installation of software on their operating system.

For _VirtualBox_ installation instructions, please visit the _VirtualBox_ web site : https://www.virtualbox.org/

##### Using _Ubuntu/Trusty32_

The _Vagrantfile_ specifies that the _VirtualBox_ image to be loaded during provisioning is _ubuntu/trusty64_, which is a 64-bit CPU image.  It is not strictly required, you may use a 32-bit Ubuntu Linux image if necessary.  If that is the case, revise the _Vagrantfile_, to specify _ubuntu/trusty32_ instead of _ubuntu/trusty64_, e.g., find and change:

        config.vm.box = "ubuntu/trusty64"

to:

        config.vm.box = "ubuntu/trusty32".

If you previously provisioned a _guest-vbox_, then after revising the _Vagrantfile_, execute "vagrant destroy", to remove the existing 64-bit _guest-vbox_ image.  Then execute "vagrant up", which downloads the 32-bit _VirtualBox_ image from the Hashicorp Ubuntu repository, and is used to build the _guest-vbox_.

##### Misc Troubleshooting Tips

###### "Vagrant SSH" Times Out

If "vagrant ssh" times out while attempting to shell into the _guest-vbox_, one cause may be that the _host_ CPU is not capable of executing the _ubuntu/trusty64_ _guest-vbox_ image.  See "Using _Ubuntu/Trusty32_", above.

###### Remote SSH Times Out

When using _ssh_ from a remote terminal to shell into the _guest-vbox_, if it times out instead of presenting a _guest-vbox_ prompt, investigate the _host_ firewall settings and ensure it does not block the _guest-vbox_ _ssh_ port.  The default _ssh_ port number of the _guest-vbox_ is 2222.

##### If _The Build_ Fails

First, ensure you save the terminal output messages of the "vagrant up" provisioning build for future reference.  This is usually easily done by backscrolling the terminal, highlighting the terminal text, and then doing copy-paste into a file, and saving it.

Only you have access to the necessary configuration information about your _host_, so the only practical advice which can be offered here is :

###### Divide And Conquer

Identify the "milestone" at which the provisioning error occurred.  Inspect the _.sh_ provisioning files.  Find the milestone locations in the script file at which the terminal messages indicate an eror.  Narrow down which milestone succeeded, and which did not.  Once you find the most likely script commands, investigate as to why that particular command may have failed.

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
###### _Node.js_        : https://nodejs.org/

### Product Pedigree

The software components installed by the provisioning scripts are noted here.  Their versions may be updated in the future.  Their initial commit versions are :

##### _Ubuntu Server_ 14.04 "ubuntu/trusty64"

_Ubuntu Server_ "ubuntu/trusty64" is an "official" image pulled by Vagrant from https://atlas.hashicorp.com/boxes/search.

##### _Ruby_ 2.2.4

_Ruby_ is installed using apt-get and BrightBox's Ruby NG PPA at https://launchpad.net/~brightbox/+archive/ubuntu/ruby-ng.

##### _Git_ 1.9.1

_Git_ is installed using apt-get.

##### _Node.js_ 0.10.37

_Node.js_ is installed using apt-get and Chris Lea's Node.js PPA, https://launchpad.net/~chris-lea/+archive/ubuntu/node.js.

### Caveats And Known Issues

##### "works on my machine"

This product, at this time, is in the _alpha_ stage of development.  Extensive testing has not been done on its components, only its gross operation has been confirmed .  _Host_ hardware and _host_ OS environment testing has been limited to the single generic _AMD/Ubuntu Linux/Windows_ box used for development.

Your feedback is appreciated, especially with regard to success or problems using this product on _OS X_.

### Licensing And Disclaimer

_USE THIS PRODUCT AT YOUR OWN RISK. The author and other contributors are not responsible or liable for adverse consequences caused by use of this product, even if used as designed, or as described or implied, herein or elsewhere._

Please read the _Apache License, Version 2.0_ included with this README file for important licensing information and disclaimers.




###### Copyright 2016 Rex Addiscentis, all rights reserved.
###### http://stopbeingpetty.com        http://addiscent.com
