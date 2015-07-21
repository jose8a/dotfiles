# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Custom Shell Variable definitions.
if [ -f ~/.envars ]; then
    source ~/.envars
fi

# Alias definitions.
if [ -f ~/.alias ]; then
    source ~/.alias
fi

# Prompt's color definitions.
if [ -f ~/.colors ]; then
    source ~/.colors
fi

# Dynamic dotfiles location stored here
if [ -f ~/.dotfiles_temp ]; then
    source ~/.dotfiles_temp
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

########################################################
# VI/VIM/Tmux Settings
########################################################
########
set -o vi

######## ##Exuberant CTAGS
# Add to path for Exuberant-ctags to be called on Mac OSX rather than default ctags
PATH=/usr/local/bin:$PATH

# Tmuxinator helper to set up
source ~/bin/tmuxinator.bash

########################################################
# WebDev Tool settings
########################################################
########## Postgres PATH -- Commandline Tools detection
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

########## Node PATH addition
# Add to path for Node to automatically pick npm-installed binaries
#!! This next PATH line might be a Linux-only path since the '/npm/bin' doesn't
# show up on my Mac filepath.
PATH=$PATH:/usr/local/share/npm/bin
#!! This NODE_PATH is added via Mac Homebrew install.  Might not work for Linux!!
export NODE_PATH="/usr/local/lib/node_modules"

####
export PATH="$PATH:/Applications/DevDesktop/drush"

########################################################
# Set the path for Pandoc to allow CLI pandoc executable
# and also the vim-pandoc plugin to work properly
########################################################
if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

########## Utils for xforming aa_repos to proper website
export PATH="$PATH:$PRJ/scripts/aa_learnutils"

########################################################
# Launch projects at PC startup
########################################################
if [ -n ${APPSUP}]
then
  #do nothing if this is not already startup
  export APPSUP=2
  echo $APPSUP
else
  #source ~/.startapps
  export APPSUP=1
  echo $APPSUP
fi

echo "Dev Projects should be Up and Running!"

########################################################
# RBENV
########################################################
eval "$(rbenv init -)"


