export RUBYMOTION_ANDROID_SDK=/Users/esse/.rubymotion-android/sdk
export RUBYMOTION_ANDROID_NDK=/Users/esse/.rubymotion-android/ndk
export DEVKITARM=/Users/esse/devkitPro/devkitARM
export DEVKITPRO=/Users/esse/devkitPro
#export PS1="\u:\w$ " #very simple prompt
export DYLD_LIBRARY_PATH=/usr/local/kde4/lib:
export GOPATH='/users/esse/go'
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim

export TERM=xterm

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export WKHTMLTOPDF_PATH="/Users/esse/.rvm/gems/ruby-2.2.0@koleo/bin/wkhtmltopdf"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

ponysay -q
source /Users/esse/.rvm/scripts/rvm
source ~/.profile

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
 
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
 
PS1="\u:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "

alias such=git
alias very=git
alias wow='git status'

source ~/.dotfiles/secrets/.env
