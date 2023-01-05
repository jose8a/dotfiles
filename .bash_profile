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
# Display message when debugging startup scripts
########################################################
# set this variable to enable scripts to announce
#   themselves at startup
STARTUP_DEBUG=

if [[ ! -z "${STARTUP_DEBUG}" ]]; then
  echo "I am dot-bash_profile"
fi


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


########################################################
# FANCY COLORIZED BASH/CLI PROMPT
#
# see references for format, color-codes, etc
#   * https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
#   * https://wiki.bash-hackers.org/scripting/terminalcodes
#   * https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
#
########################################################
fancy_prompt() {
cursor="$> "

# if 256 colors aren't available on the system, toggle the
# commented line for 8-bit colors instead
# PSUSER='\[\033[36m\][\u]\[\033[00m\] '  #8bit colors
PSUSER='\[\033[38;5;140m\][\u]\[\033[00m\]'    #256-color version

# PSBRANCH="\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n "
PSBRANCH="\[\033[38;5;172m\]\$(parse_git_branch)\[\033[00m\]\n "

# PSPATH="\[\033[32m\]\w\[\033[00m\]\n"
PSPATH="\[\033[38;5;41m\]\w\[\033[00m\]\n"

# PSCURSOR=" \[\033[38;5;189m\]\$cursor\[\033[00m\]"
PSCURSOR=" \[\033[36;1m\]\$cursor\[\033[00m\]"

# add a blank line after the cli-cursor, but before any
# command output is shown
PS0="\n"

PS1="\
$PSUSER\
$PSBRANCH\
$PSPATH\
$PSCURSOR"

# PS2 does not work on mac osx for some reason
# PS2="$PSCURSOR"
}

fancy_prompt


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
# TMUXP path
########################################################
# 2020.0212: `pip install --user tmuxp` output:
# 'The script kaptan is installed in ~/.local/bin which is NOT on PATH'.
#   \--> Consider adding it to PATH.
# 'The script tmuxp is installed in ~/.local/bin which is NOT on PATH'
#   \--> Consider adding it to PATH.
export PATH="~/.local/bin:$PATH"
eval "$(_TMUXP_COMPLETE=source tmuxp)"


########################################################
# FNM - Fast Node Manager
########################################################
# fnm
eval "$(fnm env)"


########################################################
# GOOGLE CLOUD CONFIG
########################################################
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jose8a/google-cloud-sdk/path.bash.inc' ]; then . '/Users/jose8a/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jose8a/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/jose8a/google-cloud-sdk/completion.bash.inc'; fi

########################################################
#
# 2021.0726:
# To Suppress the following terminal warning now appearing
# at the creation of every new MacOS terminal shell:
#
# “The default interactive shell is now zsh”
#
########################################################
export BASH_SILENCE_DEPRECATION_WARNING=1

