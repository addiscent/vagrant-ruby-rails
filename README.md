# vagrant-ruby-git
A Vagrant Box containing Ubuntu Server 14.04, Ruby 2.2.1, Gems 4.2.1, RVM 1.26.11, and Git 1.9.1.

  This is a Vagrant VirtualBox, (https://www.vagrantup.com), intended for quick installation of a very basic Ruby development environment, which, due to its nature, may be disposed of and rebuilt relatively quickly, as needed.  The guest vbox is constructed using Vagrant, Ruby/Gems, and a few FOSS tools.  The VM is VirtualBox.
  
Requirements for Installation

  You must have at least 1GB of available (free) memory on your computer.  Before beginning installation, you must already have the following installed and properly configured:
  
  1. Vagrant: "vagrant-ruby-git" is developed using Vagrant 1.7.2, (the most recent from https://www.vagrantup.com/downloads.html).  You may have success with earlier versions of Vagrant, but I have built/tested using only 1.7.2.  The machine used for development is a generic AMD/Linux box running Ubuntu Desktop 14.04 LTS.  You are venturing into unexplored territory with this project if you build it on OS X or Windows.

  2. VirtualBox: "vagrant-ruby-git" is tested using VirtualBox 4.3.10 as the provider, (a very slightly down-level version of the latest from https://www.virtualbox.org/wiki/Downloads).  You may have success with earlier versions of VirtualBox, but I have not tested those.

Installation

  1.  Create a "home" directory for the guest vbox in a convenient subdirectory location.  Name it whatever you wish, but, herein, let's call it "vagrant-ruby".

  2.  In order to build the guest vbox, you need three files from the "vagrant-ruby-git" github repository: the "Vagrantfile", and the two ".sh" files, "ruby221-inst.sh" and "rvm-inst.sh".  The two .sh files do provisioning of the guest vbox during its build, and the Vagrantfile invokes the .sh files when necessary.  Download all three of them from the github repository, and place them into the "vagrant-ruby" subdirectory.  You don't need the ".gitignore" file from the repository, but you may wish to use it if you decide to put this vagrant box under git version control using a repository of your own.  It is not necessary to download the ".vagrant" subdirectory contents from the github repository; Vagrant will build those files as/when needed.

  3.  Now, make the guest vbox "home" directory your current working directory, ("cd vagrant-ruby").

  4.  Enter the following commands:
  
        mkdir workspace
      
      A "vagrant-ruby/workspace/" subdirectory is created.
      
        vagrant up
      
      The build starts.

  Now wait... and wait... There will be a very long list of text output during the build process, beginning with:
  
    "==> Bringing machine 'default' up with 'virtualbox' provider..."
     
  Depending on the speed of your computer and the speed of your Internet connection, the build will take eight to fifteen minutes or more, as the Ubuntu Server "base" is downloaded, Ruby and the Gem sources are downloaded/compiled, and RVM and Git are downloaded and installed.  During that process, most of the informational text displayed is green in color, but, there will also be a LOT of red-color text output.  It is somewhat alarming, but it is normal.  Also, the output of gpg and curl is RED and the formatting is very broken.  However, expected ugliness notwithstanding, keep an eye peeled for clues that the build may possibly have failed somehow because of a difference between the build environments of my computer and yours.  Typically, if the build fails, it often will stop with an obvious error message, but possibly not; you may have to scroll back in the terminal output and scrutinize it, because sometimes the build forges onward even after an error.
  
  On the other hand, beware of being falsely alarmed.  There are a number of RED messages which are not errors, they are informational only.  However, because they are RED you may be prone to believe they are errors.  But, they are not.  As an example, the RED text output, "==> default: stdin: is not a tty", can be ignored.
  
  When successful, after the build, the last line of screen output reads:
  
    "==> default: Setting up git (1:1.9.1-1ubuntu0.1) ..."
  
  When the command prompt is subsequently displayed, enter the following command:
  
        vagrant ssh
    
    After a few seconds, you should see an Ubuntu shell welcome screen, and a command prompt which reads:
    
        vagrant@vagrant-ubuntu-trusty-64:~$
        
    Enter the following commands, and note the associated results:
    
        ruby --version
        
      Produces : ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]
                
        gem --version
      
      Produces : 2.4.6
            
        rvm --version
        
      Produces : rvm 1.26.11 (latest) by Wayne E. Seguin...
            
        git --version
        
      Produces : git version 1.9.1
            
Using "vagrant-ruby-git"

  Not much can be said here about Ruby, the Gems, RVM, Git, and the other usual suspects.  Those subjects are better covered elsewhere.  But a few points unique to this particular project warrant some elaboration.
  
  Note that above, you were "inside" the guest vbox, verifying the success of the build.  Go back in there again, and let's do some exploring; in your host terminal, starting from within the "vagrant-ruby" directory, enter the command "vagrant ssh", which will open a terminal shell into the guest vbox.  Then, enter "ls -l /".  In the resulting listing, notice the usual Ubuntu root directory hierarchy, (in the guest vbox), but with two unusual subdirectories, one named "/vagrant", the other discussed below.  "/vagrant" is one of two subdirectories in the guest vbox which are special.  The guest vbox "/vagrant" subdirectory is sync'd to a directory you created on the host, the one named "vagrant-ruby".  The guest vbox "/vagrant" subdirectory and the host "vagrant-ruby" directory, for practical purposes, can be considered as the same directory.  Prove it to yourself by entering "ls -l /vagrant"; the Vagrantfile and .sh files, among others, will be listed.  So you may use that directory, or any of its subdirectories, to share files between the host file system, and the guest vbox file system.
  
  If necessary, you can modify the configuration/operation of your guest vbox by modifying the Vagrantfile and .sh files.  If you wish to place those modified files into a git source repository on your computer, the guest vbox's "/vagrant" directory is probably the most convenient place to do a "git init".  That's because that directory is where the guest vbox's configuration files "live".  This is one of the advantages of having git already installed, (which happened during the guest vbox build); git is ready to go, it can be executed from the "vagrant ssh" terminal, immediately after the build.
  
  The other special subdirectory in the guest vbox root is "/workspace".  This subdirectory is also sync'd to the host, it is the other subdirectory you created immediately before building the guest vbox.  This subdirectory is probably a good place to consider putting your Ruby project files, as they may be edited either from within, or "outside of", the guest vbox.  As with the "/vagrant" directory, a git repository, (or more than one), can be placed in as many subdirectories of "/workspace" as needed.
  
Product Pedigree

  The versions noted below may be updated in the future:

    1. Ubuntu Server 14.04 "base"
    2. Ruby 2.2.1
    3. Gems 4.2.1
    4. RVM 1.26.11, (Ruby Version Manager).
    5. Git 1.9.1
  
  The Ubuntu Server is an "official base" image from https://atlas.hashicorp.com/boxes/search.

  Ruby and Gems are compiled by RVM, using make sources from https://github.com/postmodern/ruby-install.

  RVM is installed using https://rvm.io/.

  Git is installed using the official Canonical Ubuntu package repositories, ("sudo apt-get install git").
  
Caveats

  This project "works on my machine".  However, this project is alpha.  Extensive testing has not been done on it.  Testing has only been done on the single Ubuntu Linux box used for development.  The BASH provisioning scripts build a working Vagrant box by downloading several essential components/sources from the Internet.  The provisioning BASH scripts work of course, but, at this time they have no error detection/handling.  If a flakey Internet connection, or a lack of disk space causes errors during the build, the provisioning scripts will NOT handle these errors gracefully.
  

