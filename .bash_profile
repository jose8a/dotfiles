# This file (.bash_profile) sources .bashrc
#
# According to the bash man page, .bash_profile is executed for login shells, while .bashrc is
# executed for interactive non-login shells.  An exception to the terminal window guidelines is
# Mac OS Xâs Terminal.app, which runs a login shell by default for each new terminal window,
# calling .bash_profile instead of .bashrc.
#
# Therefore using .bashrc as main shell-config file but sourcing it from .bash_profile allows for
# greatest flexibility in using one .bashrc for Mac & Linux environments
#
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

export PATH="$PATH:/Applications/DevDesktop/drush"

########################################################
# BASH STARTUP SEQUENCE CONFIG
########################################################
source ~/.profile

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

########################################################
# RBENV
########################################################
# export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add
# the following to your ~/.bash_profile:
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Note: this ^^ may interfere with building old versions of
# Ruby (e.g <2.4) that use OpenSSL <1.1.



########################################################
# GIT - GITIGNORE
########################################################
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}


########################################################
# GIT-BRANCH COMMANDLINE-BLING
########################################################
parse_git_branch() {  ### Adding git branch to prompt
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w\n\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $> "


########################################################
# HOMEBREW
########################################################
# 2019.0311: `brew doctor` output:
# Add Homebrew's sbin to the PATH as there are Homebrew formulae depending on it, due to adding executables there
export PATH="/usr/local/sbin:$PATH"


########################################################
# ANACONDA
########################################################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


########################################################
# FNM - Fast Node Manager
########################################################
# fnm
eval "$(fnm env --multi)"


########################################################
# GOOGLE CLOUD CONFIG
########################################################
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jose8a/jbdg-gcloud/google-cloud-sdk/path.bash.inc' ]; then . '/Users/jose8a/jbdg-gcloud/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jose8a/jbdg-gcloud/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/jose8a/jbdg-gcloud/google-cloud-sdk/completion.bash.inc'; fi
