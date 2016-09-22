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

export WKHTMLTOPDF_PATH="/Users/esse/.rvm/gems/ruby-2.2.0/bin/wkhtmltopdf"

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

alias gti=git

#recently changed branches, thanks @tjeden
alias gitc="git branch --sort=-committerdate | head"

# Extra many types of compressed packages
# Credit: http://nparikh.org/notes/zshrc.txt
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)  tar -jxvf "$1"                        ;;
      *.tar.gz)   tar -zxvf "$1"                        ;;
      *.bz2)      bunzip2 "$1"                          ;;
      *.dmg)      hdiutil mount "$1"                    ;;
      *.gz)       gunzip "$1"                           ;;
      *.tar)      tar -xvf "$1"                         ;;
      *.tbz2)     tar -jxvf "$1"                        ;;
      *.tgz)      tar -zxvf "$1"                        ;;
      *.zip)      unzip "$1"                            ;;
      *.ZIP)      unzip "$1"                            ;;
      *.pax)      cat "$1" | pax -r                     ;;
      *.pax.Z)    uncompress "$1" --stdout | pax -r     ;;
      *.Z)        uncompress "$1"                       ;;
      *) echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
     echo "'$1' is not a valid file to extract"
  fi
}

fix_test_db() {
  cat README.md | grep psql | tail -n 1 | bash
}

open_last_migration() {
  mate db/migrate/`ls db/migrate/ | tail -n 1`
}

cpwd() {
  pwd | pbcopy
}

alias be="bundle exec"
alias r="rake"

export PYTHONSTARTUP=~/.pythonrc

source ~/.dotfiles/secrets/.env

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

#credit: http://stackoverflow.com/questions/24455377/git-diff-with-line-numbers-git-log-with-line-numbers
gitd() {
  if [ "$1" == "" ];then
    git diff --color=always | \
      gawk '{bare=$0;gsub("\033[[][0-9]*m","",bare)};\
        match(bare,"^@@ -([0-9]+),[0-9]+ [+]([0-9]+),[0-9]+ @@",a){left=a[1];right=a[2];next};\
        bare ~ /^(---|\+\+\+|[^-+ ])/{print;next};\
        {line=gensub("^(\033[[][0-9]*m)?(.)","\\2\\1",1,$0)};\
        bare~/^-/{print "-"left++ ":" line;next};\
        bare~/^[+]/{print "+"right++ ":" line;next};\
        {print "("left++","right++"):"line;next}'

  else
    git diff --color=always "$1" | \
      gawk '{bare=$0;gsub("\033[[][0-9]*m","",bare)};\
        match(bare,"^@@ -([0-9]+),[0-9]+ [+]([0-9]+),[0-9]+ @@",a){left=a[1];right=a[2];next};\
        bare ~ /^(---|\+\+\+|[^-+ ])/{print;next};\
        {line=gensub("^(\033[[][0-9]*m)?(.)","\\2\\1",1,$0)};\
        bare~/^-/{print "-"left++ ":" line;next};\
        bare~/^[+]/{print "+"right++ ":" line;next};\
        {print "("left++","right++"):"line;next}'
  fi
}
