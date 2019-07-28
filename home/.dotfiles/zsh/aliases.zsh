#!/bin/sh
alias reload!='exec "$SHELL" -l'


# Use neovim instead of vim
alias vim='nvim'
alias vimdiff='vim -d'

alias tree='tree -C'
alias path='echo -e ${PATH//:/\\n}'

# Puppet aliases
alias puppet-lint='puppet-lint --log-format="%{path} - %{KIND}:%{check} - %{message} on line %{line}"'
alias izgood="puppet parser validate"
alias izpretty='puppet-lint'
alias ptup='pdk test unit --parallel'

# Vagrant aliases
alias v='vagrant'
alias vs='vagrant status'
alias vhl='vagrant hosts list'

# Tmux aliases
alias tma='tmux attach -d -t'

# Bundler aliases
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'

# Shortcuts
alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias h="history"

# Git and Github aliases
alias cdg='cd "$(git rev-parse --show-toplevel)"'
alias branch-rebase-production='git fetch && git rebase origin/production'
alias branch-rebase-master='git fetch && git rebase origin/master'
alias gclean='git clean -fd'
alias gpristine='git reset --hard && git clean -ffdx'
alias guberbase='git co master && git pull && git co - && git rebase master'

# k8s, docker, etc...
alias kl="kubectl"
# Get shell access to Docker for Mac's host
alias docker-host="docker run -it --rm --privileged --pid=host justincormack/nsenter1"
alias docker-rmi-dangling="docker rmi \$(docker images -f 'dangling=true' -q)"
alias docker-rmc-stopped="docker rm \$(docker ps -a -q)"
alias docker-stopall="docker stop \$(docker ps -a -q)"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -lAF ${colorflag}"

# List only directories
alias lsd="ls -l | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Enable aliases to be sudo'ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a && brew update && brew upgrade --all && brew cleanup && brew cask cleanup && gem update --system && gem update && vagrant plugin update'

# IP addresses
alias publicip="dig +short myip.opendns.com @resolver1.opendns.com 2>/dev/null"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Routes
alias defaultroute='netstat -rn | grep --color=never -E "(default|^0)"'

# Flush Directory Service cache
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder 2>/dev/null"

# Clean up LaunchServices to remove duplicates in the 'Open With' menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Recursively delete `.DS_Store` files
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple's System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# One of @janmoesen's ProTips
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done
