# Build and config for my workspace and supporting tool, packages, and deveolpment enviroment in macos and linux(ubuntu)

# something to declare...

# install my_env
## Requirements
GCC 4.7.0 or newer
Linux 2.6.32 or newer
Glibc 2.13 or newer
64-bit x86_64 CPU

- For Ubuntu:
apt install build-essential

- For ArchLinux:
pacman -S base-devel


## Installation

sh -c "\$(curl -fsSL https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/my_env_boot.sh)"

or

sh -c "\$(wget https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/my_env_boot.sh)"

otherwise,

save and run the my_env_boot.sh script downlaod from without curl or wget:
https://raw.githubusercontent.com/izhujiang/my_env/master/scripts/my_env_boot.sh

## Trouble shooting:

### Can't set zsh as default shell

To set zsh as your default shell, execute the following.
grep -q "$(which zsh)" /etc/shells || sudo -s 'echo $(which zsh) >> /etc/shells' && chsh -s \$(which zsh)

### Other issues:

--- issue 1:
Problem:
permission denied: /usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/sitecustomize.py
Solution:
chmod 644 /usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/sitecustomize.py

-- issue 2:
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
