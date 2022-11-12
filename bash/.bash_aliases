alias ls='ls -l --color=auto'
alias lsd='ls -d */'
alias ll='ls -AlFh --group-directories-first'
alias llc='clear && ls -AlFh --group-directories-first'
alias lls='ls -AlFhS'
alias llt='ls -AlFht'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -ir'

alias mkdir='mkdir -pv'
alias mktmp='cd $(mktemp -d)'
function mkcd {
    mkdir -p $1
    cd $1
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias please='sudo $(history -p !!)'
alias :q='exit'

alias df='df -h'     # human-readable sizes
alias free='free -mh' # show sizes in MB

alias histg='history | grep'
alias journal='sudo journalctl -n 50 -u'
alias status='sudo systemctl status'

alias ea='vim ~/.bash_aliases; source $HOME/.bash_aliases && echo "aliases sourced  --ok."'
alias eal='vim ~/.bash_aliases_local; source $HOME/.bash_aliases_local && echo "aliases sourced  --ok."'
alias erc='vim ~/.bashrc; source $HOME/.bashrc && echo "bashrc sourced  --ok."'
alias es='vim ~/.ssh/config'
alias ev='vim ~/.config/nvim/init.vim'

alias ad='cd $NFILES/AppData'
alias dc='cd $NFILES/documents'
alias md='cd $NMEDIA'
alias dl='cd $NMEDIA/downloads'

alias vim='nvim'
alias vf='vim $(fzf)'
alias t='tmux attach || tmux'

alias gs='git status'
alias gac='git add -A && git commit -m'
alias gp='git push'
alias gl='git pull'

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
alias mip='curl ipconfig.io'
