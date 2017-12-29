Heading
==============

## tpm
Tmux Plugin Manager
###Installing plugins
Add new plugin to ~/.tmux.conf with set -g @plugin '...'
Press prefix + I (capital I, as in Install) to fetch the plugin.
You're good to go! The plugin was cloned to ~/.tmux/plugins/ dir and sourced.

###Uninstalling plugins
Remove (or comment out) plugin from the list.
Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.
All the plugins are installed to ~/.tmux/plugins/ so alternatively you can find plugin directory there and remove it.

###Key bindings
prefix + I
Installs new plugins from GitHub or any other git repository
###Refreshes TMUX environment
prefix + U
updates plugin(s)
prefix + alt + u
remove/uninstall plugins not on the plugin list
###More plugins
For more plugins, A [check here](https://github.com/tmux-plugins).
