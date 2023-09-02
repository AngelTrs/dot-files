alias ls='ls --color=auto -AFv'
alias lsd='ls -d */'
alias ll='ls -lh --group-directories-first'
alias llc='clear && ll'
alias lls='ll -S'
alias llt='ll -t'
alias tt='tree -a'
alias td='tree -dL 2'

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
alias du='du -hs *'
alias free='free -mh' # show sizes in MB

alias histgrep='history | grep'
alias journal='sudo journalctl -n 50 -u'
alias status='sudo systemctl status'

alias ea='vim ~/.bash_aliases; source $HOME/.bash_aliases && echo "aliases sourced  --ok."'
alias eal='vim ~/.bash_aliases_local; source $HOME/.bash_aliases_local && echo "aliases sourced  --ok."'
alias erc='vim ~/.bashrc; source $HOME/.bashrc && echo "bashrc sourced  --ok."'
alias essh='vim ~/.ssh/config'
alias evim='vim ~/.config/nvim/init.vim'

alias vim='nvim'
alias vimdiff='nvim -d'
alias svim='sudoedit'
alias v='nvim'
alias vf='vim $(fzf)'
alias view='vim -R'
alias t='tmux attach || tmux'

alias gs='git status'
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
alias myip='curl ipconfig.io'

# locations
alias ad='cd $DOCKER_APP_DATA'
alias dc='cd $NFILES/documents'
alias fl='cd $NFILES'
alias md='cd $NMEDIA'
alias dl='cd $NDOWNLOADS'
