# vagrant-ruby-git
#### A Vagrant Box containing Ubuntu Server 14.04, Ruby 2.2.1, Gems 4.2.1, RVM 1.26.11, and Git 1.9.1.

This is a Vagrant Box, (https://www.vagrantup.com), intended for quick installation of a very basic Ruby development environment.  Due to its nature, it may be quickly installed, assuming pre-existing Vagrant/VirtualBox requirements have been met, and even more quickly intentionally disposed of if desired.  Because it can rebuilt quickly, if needed again, it is handy for transient/experimental work, which may require sacrificing the development environment while working, or simply as a way to quickly recover from unanticipated corruption of the development environment.

This guest vbox is constructed using Vagrant, and contains, Ruby/Gems, RVM, and a few FOSS tools.  The virtual machine provider is VirtualBox.  Git is included as a convenience for quickly placing Ruby, etc, source into repositories, or for placing any modified guest vbox configuration/provisioning files into a repository of your own, so you may save your guest vbox configuration changes for later rebuilding.
  
### Requirements For Installation

You must have at least 1GB of available (free) memory on your computer.  Before beginning installation, you must already have the following installed and properly configured :
  
1. _Vagrant_

  "vagrant-ruby-git" is developed using Vagrant 1.7.2, (the most recent from https://www.vagrantup.com/downloads.html).  You may have success with earlier versions of Vagrant, but I have built/tested using only 1.7.2.  The machine used for development of this project is a generic AMD/Linux box running Ubuntu Desktop 14.04 LTS.  You are venturing into unexplored territory with this project if you build it on OS X or Windows.

2. _VirtualBox_

  "vagrant-ruby-git" is tested using VirtualBox 4.3.10 as the provider, (a very slightly down-level version of the latest from https://www.virtualbox.org/wiki/Downloads).  You will probably have success with slightly earlier versions of VirtualBox, and the most recent stable version, but I have not tested those.

### Installation

##### Prepare For The Build

1. Create a "home" directory for the guest vbox in a convenient subdirectory location.  Name it whatever you wish, but, herein, I will refer to it as "vagrant-ruby" :
    
        mkdir vagrant-ruby

2. Download a zip file containing the files from the github repository page, https://github.com/ckthomaston/vagrant-ruby-git.

  Keeping the same file and subdirectory hierarchy as in the repository, extract those files into the "vagrant-ruby" subdirectory you just created above.

3. Now, make the guest vbox "home" directory your current working directory :

        cd vagrant-ruby

4. Enter the following command :
  
        mkdir workspace
      
    A "vagrant-ruby/workspace/" subdirectory is created.
      
##### Do The Build

5. Enter the following command :
  
        vagrant up
      
    The build starts.

Now wait...

A very long list of text is output during the build process, beginning with :
  
        "==> Bringing machine 'default' up with 'virtualbox' provider..."
     
Depending on the speed of your computer and the speed of your Internet connection, the build will take eight to fifteen minutes or more, as the Ubuntu Server "base" image is downloaded, Ruby and the Gem sources are downloaded and compiled, and RVM and Git are downloaded and installed.

During that process, most of the informational text displayed is green in color, but, there will also be a _lot_ of red-color text output.  Seeing all that "blood" is somewhat alarming, but it is normal.  Also, the output of gpg and curl is _red_ and the formatting is very broken.  However, expected ugliness notwithstanding, keep an eye peeled for clues that the build may possibly have failed somehow because of a difference between the build environments of my computer and yours.

Typically, if the build fails, it often will stop with an obvious error message, but possibly not.  After the build finishes, you should scroll back through the terminal output and scrutinize it, because sometimes the build forges onward after an error.  On the other hand, beware of being falsely alarmed.  There are a number of _red_ messages which are not errors, they are informational only.  As an example, the _red_ text output,

        "==> default: stdin: is not a tty"
    
can be safely ignored.
  
After the build completes successfully, the last build line of screen output reads :
  
        "==> default: Setting up git (1:1.9.1-1ubuntu0.1) ..."
  
##### Verify The Build

When the command prompt is subsequently displayed, enter the following command :
  
        vagrant ssh
    
After a few seconds, you will see an Ubuntu shell welcome screen, and a command prompt which reads :
    
        vagrant@vagrant-ubuntu-trusty-64:~$
        
Enter the following commands, and note the associated results :
    
        ruby --version
        
    Produces : ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]
            
        gem --version
      
    Produces : 2.4.6
        
        rvm --version
        
    Produces : rvm 1.26.11 (latest) by Wayne E. Seguin...
        
        git --version
        
    Produces : git version 1.9.1
        
### Using "vagrant-ruby-git"

Not much can be said here about how to use Ruby, the Gems, RVM, Git, and the other usual suspects, such as the tools which come with Ubuntu.  Those subjects are better covered elsewhere.  But a few points unique to this particular project warrant some elaboration.
  
Note that, above, you "went inside" the guest vbox using "vagrant ssh", to verify the success of the build and the versions of its components.  If you are not still there in your terminal, let's go back in there again, and do some exploring.  Starting from within the "vagrant-ruby" directory, in your regular host terminal shell, enter the command :
    
        vagrant ssh
    
This will open a terminal shell into the guest vbox.  Then, enter :

        ls -l /
    
In the resulting listing, notice the usual _Ubuntu Server 14.04_ root directory hierarchy, inside the guest vbox file system.

        vagrant@vagrant-ubuntu-trusty-64:~$ ls -l /
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
        drwxrws---  1 vagrant vagrant  4096 Apr  8 11:03 workspace


However, also notice there are two subdirectories not typically found in an _Ubuntu_ root directory hierarchy.  One is named "/vagrant", the other is "/workspace".  They are discussed below.

#### "/vagrant" And "/workspace"

The guest vbox "/vagrant" subdirectory is sync'd by Vagrant to a directory you created on the host, the one named (herein) "vagrant-ruby".  The guest vbox "/vagrant" subdirectory and the host "vagrant-ruby" directory, for practical purposes, can be considered as being the same directory; they are effectively "mapped into one-another".  Prove it to yourself by entering :

        ls -l /vagrant
    
Note that the guest vbox's Vagrantfile and .sh provisioning BASH files, among others, are listed.

        drwxrws--- 2 user group 4.0K Apr  7 22:21 workspace
        -rw-rw-r-- 1 user group 1.1K Apr  7 22:58 LICENSE
        -rw-rw-r-- 1 user group  12K Apr  8 15:55 README.md
        -rw-rw---- 1 user group  110 Apr  7 21:17 ruby221-inst.sh
        -rw-rw---- 1 user group  375 Apr  7 22:01 rvm-inst.sh
        -rw-rw---- 1 user group 3.2K Apr  7 22:18 Vagrantfile

You may therefore manage or edit those files from either "within" the guest vbox, in the "/vagrant" subdirectory, or from "outside" the guest vbox, in the "vagrant-ruby" subdirectory. You may also use that directory, or any of its subdirectories, to share files between the host file system, and the guest vbox file system.
  
If desired, you can customize the configuration/operation of your guest vbox by modifying the Vagrantfile and .sh provisioning files, (you will need to rebuild the vagrant guest vbox image, see the Vagrant documentation).

After doing that, if you wish to place those modified vagrant box configuration files into a git source repository of your own, the guest vbox's "/vagrant" directory is probably the best place to install a local git repository, ("git init"), for that purpose.  By the way, this is one of the advantages of having git already installed, (git was installed during the guest vbox build); git is ready to go, it can be executed from the "vagrant ssh" terminal immediately after the build.  Enter your git config info, such as your name and email address, (and remote repository URL, if desired), and git is ready for your use.
  
The other subdirectory atypical to the guest vbox _Ubuntu_ root is "/workspace".  This subdirectory is also sync'd to the host; it is"mapped into" the other host subdirectory named "/workspace", which you created immediately before building the guest vbox.  This subdirectory is probably a good location for placing your Ruby et al project files, as they may be edited or managed either from "within", or "outside of", the guest vbox, as is your preference.  As with the "/vagrant" directory, a git repository may be placed in one or more subdirectories of "/workspace" as needed.

If this "/workspace" subdirectory is used for your Ruby or other project files, they won't be co-mingled with your guest vbox configuration files in "/vagrant".  Among other advantages, this simplifies the segregation of guest box configuration changes and Ruby project version control.
  
### Product Pedigree

The software components installed by the provisioning scripts are noted below.  Their versions may be updated in the future, but their initial commit versions are :

##### Ubuntu Server 14.04 "base"
  
The Ubuntu Server is an "official base" image from https://atlas.hashicorp.com/boxes/search.
        
##### Ruby 2.2.1, Gems 2.4.6
  
Ruby and Gems are downloaded and compiled by RVM, using make sources from https://github.com/postmodern/ruby-install.
        
##### RVM 1.26.11, (Ruby Version Manager).
  
RVM is installed using https://rvm.io/.
        
##### Git 1.9.1
  
Git is installed using the official Canonical Ubuntu package repositories, "sudo apt-get install git".  

### Caveats

##### "works on my machine"
This product, at this time, is _alpha_.  Extensive testing has not been done on its components.  Only its gross operation has been confirmed, in a limited operational environment.  Hardware and host OS environment testing has been limited to the single generic AMD/Ubuntu Linux box used for development.

##### The Provisioning Scripts
The provisioning BASH scripts build a working Vagrant box by downloading essential components/sources from the Internet.  The provisioning BASH scripts work, but, at this time they have _no_ error detection/handling.  If, as examples, a flaky Internet connection, or a lack of disk space, causes errors during the build, the provisioning scripts will _not_ handle these errors gracefully.

### Licensing And Disclaimers

_Use this product at your own risk. The author and any contributors are not responsible for adverse consequences caused by use of this product, even if it is used as designed/intended._

Please read the _MIT License_ included with this README file for important licensing information and disclaimers.



  
###### Copyright 2015 CK Thomaston, all rights reserved.
###### DalorWeb LLC, http://dalorweb.com

