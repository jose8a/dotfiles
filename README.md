# DOTFILES

## Quick Setup
Clone this repo:

```
git clone https://github.com/jose8a/dotfiles.git
```

Run the setup.sh script
```bash
source ./setup.sh
````

This script just creates symlinks to all the dotfiles in the dotfiles folder.  If this folder ever changes it's filepath,
just rerun the setup.sh script and all will be good.


## Other Requirements

These configurations scripts assume the main project development tools include TMUX, VIM, and TMUXINATOR and the BASH shell.  Also, Rbenv is currently preferred to achieve per-project ruby versioning.

Homebrew is also the preferred package manager for these dotfiles on a MacOSX environment. 

* [Homebrew](http://brew.sh/)

  -- OR --

``` ruby
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


### Ruby Requirement`
Once Homebrew is up and running on your system, you may want to upgrade the system ruby.  
Use rbenv for this, so install RBENV to get things going (https://github.com/sstephenson/rbenv#rbenv-global):

brew install rbenv

Then install a stable and up-to-date ruby version to use globally:
https://github.com/sstephenson/rbenv#rbenv-global

rbenv install RUBY_VERSION

then set it as the global/system version (it can later be over-ridden on a per-project basis)

rbenv global RUBY_VERSION

### Other Dev Tools
Once again, Homebrew is your friend:

brew install vim
brew install tmux

The last one needed is Tmuxinator, but this is actually a ruby gem:

```ruby
gem install tmuxinator
```

