a replacement for old traditional date command
 Build and config for my workspace and supporting tool, packages, and deveolpment enviroment in macos and linux(ubuntu)

## install my_env
### Prerequisites
+ A Unix-like operating system: macOS, Linux, BSD, WSL
Note that this will not work if Zsh is not in your authorized shells list (/etc/shells) or if you don't have permission to use chsh. If that's the case you'll need to use a different procedure.
  * Log out and login back again to use your new default shell.
+ clock set correctly
  * set ntp<br>
  `timedatectl set-ntp true`<br>
  * check datetime status<br>
  `timedatectl status`<br>
  The timedatectl command is a new utility for RHEL/CentOS 7 and Fedora 21+ based distributions, a replacement for old traditional date command. similar commands on other systems.
+ build-essential package
  * For Ubuntu:
      sudo apt update
      sudo apt install build-essential openssh-server
      sudo systemctl status ssh
  * For ArchLinux:
        pacman -S base-devel
+ git,curl,file
+ Zsh(v4.3.9+), optional.
  * check and confirm zsh: zsh --version
  * check the following instructions here: [Installing ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
  * Make it your default shell: chsh -s $(which zsh)<br>

### Installation
run:<br>
  `curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/my_env_boot.sh | sh | tee log`<br>
or<br>
  `wget https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/my_env_boot.sh | sh | tee log `<br>
otherwise,<br>
save and run the my_env_boot.sh script:<br>
  `wget:
https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/my_env_boot.sh`

### Trouble shooting:
#### Can't set zsh as default shell
only zsh in /etc/shells can be set as default shell.<br>
chsh command changes shell in /etc/passwd. to make default shell take affect, logout and re-login.

#### Other issues:
- issue 1:
Problem:
permission denied: /usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/sitecustomize.py
Solution:
chmod 644 /usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/sitecustomize.py

- issue 2:
Problem:
[oh-my-zsh] Insecure completion-dependent directories detected:
lrwxr-xr-x 1 apple admin 68 Apr 2 03:13 /usr/local/share/zsh/site-functions/\_pipenv -> ../../../Cellar/pipenv/2018.11.26_2/share/zsh/site-functions/\_pipenv

[oh-my-zsh] For safety, we will not load completions from these directories until
[oh-my-zsh] you fix their permissions and ownership and restart zsh.
[oh-my-zsh] See the above list for directories with group or other writability.

Solution:
To fix your permissions you can do so by disabling
the write permission of "group" and "others" and making sure that the
owner of these directories is either root or your current user.
The following command may help:
compaudit | xargs chmod g-w,o-w

If the above didn't help or you want to skip the verification of
insecure directories you can set the variable ZSH_DISABLE_COMPFIX to
"true" before oh-my-zsh is sourced in your .zshrc file.
