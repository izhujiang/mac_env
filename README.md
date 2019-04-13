# Build and config for my workspace and supporting tool, packages, and deveolpment enviroment in macos and linux(ubuntu)

# something to declare...

# install my_env

## for linux(ubuntu)

sh -c "\$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/my_env_boot.sh)"

or

sh -c "\$(wget https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/my_env_boot.sh)"

# requirement:

    git, install git with sudo apt install git if it is not available
    follow gen_sshkey document and add public ssh_key to github as prerequisite

## for linux
### Debian or Ubuntu
sudo apt-get install build-essential curl file git
### Fedora, CentOS, or Red Hat
sudo yum groupinstall 'Development Tools' && sudo yum install curl file git

https://docs.brew.sh/Homebrew-on-Linux
The Homebrew package manager may be used on Linux and Windows Subsystem for Linux (WSL). Homebrew was formerly referred to as Linuxbrew when running on Linux or WSL. It can be installed in your home directory, in which case it does not use sudo. Homebrew does not use any libraries provided by your host system, except glibc and gcc if they are new enough. Homebrew can install its own current versions of glibc and gcc for older distributions of Linux.

Features, dependencies and installation instructions are described below. Terminology (e.g. the difference between a Cellar, Tap, Cask and so forth) is explained in the documentation.

Features
Can install software to your home directory and so does not require sudo
Install software not packaged by your host distribution
Install up-to-date versions of software when your host distribution is old
Use the same package manager to manage your macOS, Linux, and Windows systems
