alias ls='ls --color=auto'
alias ll='ls -alFh --color=auto --group-directories-first'
alias lls='ls -alFhS --color=auto'
alias llsh='lls | head -n 11'
alias llst='lls | tail -n 12'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias mkdir='mkdir -pv'
alias mktmp='cd $(mktemp -d)'

alias ..='cd ..'
alias ...='cd ../..'
alias please='sudo $(history -p !!)'

alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

alias histg='history | grep'
alias journal='sudo journalctl -n 50 -u'

alias sc='cd ~/shortcuts'

# app specific
alias vim='nvim'

alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcl='docker-compose logs -f --tail 25'
alias dcr='docker-compose restart'
function dcupd {
    docker-compose pull
    docker-compose up -d --remove-orphans
    yes | docker image prune
}

alias yt='yt-dlp -c'
alias ytf='yt-dlp -c -f'
alias ytfl='yt-dlp -F'

alias weather='curl wttr.in/jfk'

# functions
function mcd {
    mkdir -p $1
    cd $1
}
