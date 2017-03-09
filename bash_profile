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
export WINEPREFIX=/Users/esse/.wine64
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export WKHTMLTOPDF_PATH="/Users/esse/.rvm/gems/ruby-2.2.0/bin/wkhtmltopdf"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

ponysay -q
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

alias spi="spotify shortinfo"
alias spp="spotify play/pause"
alias sppl="spotify play"
alias sppa="spotify pause"

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

gifify() {
  if [[ -n "$1" ]]; then
  if [[ $2 == '--good' ]]; then
    ffmpeg -i "$1" -r 10 -vcodec png out-static-%05d.png
    time convert -verbose +dither -layers Optimize -resize 900x900\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > "$1.gif"
    rm out-static*.png
  else
    ffmpeg -i "$1" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$1.gif"
  fi
  else
  echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

# turn that video into webm.
# brew reinstall ffmpeg --with-libvpx
webmify(){
  ffmpeg -i "$1" -vcodec libvpx -acodec libvorbis -isync -copyts -aq 80 -threads 3 -qmax 30 -y "$2" "$1.webm"
}

# who is using the laptop's iSight camera?
camerausedby() {
  echo "Checking to see who is using the iSight camera… 📷"
  usedby=$(lsof | grep -w "AppleCamera\|USBVDC\|iSight" | awk '{printf $2"\n"}' | xargs ps)
  echo -e "Recent camera uses:\n$usedby"
}

# preview csv files. source: http://stackoverflow.com/questions/1875305/command-line-csv-viewer
function csvpreview(){
      sed 's/,,/, ,/g;s/,,/, ,/g' "$@" | column -s, -t | less -#2 -N -S
}

function localip(){
  function _localip(){ echo "📶  "$(ipconfig getifaddr "$1"); }
  export -f _localip
  local purple="\x1B\[35m" reset="\x1B\[m"
  networksetup -listallhardwareports | \
    sed -r "s/Hardware Port: (.*)/${purple}\1${reset}/g" | \
    sed -r "s/Device: (en.*)$/_localip \1/e" | \
    sed -r "s/Ethernet Address:/📘 /g" | \
    sed -r "s/(VLAN Configurations)|==*//g"
}

# whois a domain or a URL
function whois() {
  local domain=$(echo "$1" | awk -F/ '{print $3}') # get domain from URL
  if [ -z $domain ] ; then
    domain=$1
  fi
  echo "Getting whois record for: $domain …"

  # avoid recursion
          # this is the best whois server
                          # strip extra fluff
  /usr/bin/whois -h whois.internic.net $domain | sed '/NOTICE:/q'
}

# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/" &
  # statik is good because it won't expose hidden folders/files by default.
  # npm install -g statik
  statik --port "$port" .
}

# List all files, long format, colorized, permissions in octal
function la(){
   ls -l  "$@" | awk '
    {
      k=0;
      for (i=0;i<=8;i++)
        k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));
      if (k)
        printf("%0o ",k);
      printf(" %9s  %3s %2s %5s  %6s  %s %s %s\n", $3, $6, $7, $8, $5, $9,$10, $11);
    }'
}

# cd into whatever is the forefront Finder window.
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# git commit browser. needs fzf
log() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
      --bind "ctrl-m:execute:
                echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R'"
}

# find shorthand
function f() {
  find . -name "$1" 2>&1 | grep -v 'Permission denied'
}
#stuff taken from: https://github.com/paulirish/dotfiles/blob/master/.functions

export DYLD_LIBRARY_PATH=/users/esse/go/src/github.com/cloudson/gitql/libgit2/install/lib

export JAVA_HOME=$(/usr/libexec/java_home)

. /Users/esse/torch/install/bin/torch-activate

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
