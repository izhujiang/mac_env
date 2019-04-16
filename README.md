# Build and config for my workspace and supporting tool, packages, and deveolpment enviroment in macos and linux(ubuntu)

# something to declare...

# install my_env

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
