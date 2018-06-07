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

source ~/.profile

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

### Adding git branch to prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# added by Anaconda3 5.0.1 installer
export PATH="/Users/jose8a/anaconda3/bin:$PATH"
