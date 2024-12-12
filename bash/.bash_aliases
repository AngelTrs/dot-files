alias ls='ls --color=auto -AFv'
alias lsd='ls -d */'
alias ll='ls -lh --group-directories-first'
alias llc='clear && ll'
alias lls='ll -S'
alias llt='ll -t'

alias grep='grep --color=auto -i'
alias egrep='egrep --color=auto -i'
alias fgrep='fgrep --color=auto -i'

alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -ir'

alias mkdir='mkdir -pv'
alias mktmp='cd $(mktemp -d)'
function mkcd {
    mkdir -p $1
    cd $1
}

function bak {
    cp $1 $1.bak
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias :q='exit'
alias please='sudo $(echo $(fc -ln -1))'

alias histgrep='history | grep'
alias journal='sudo journalctl -n 50 -u'
alias status='sudo systemctl status'

alias df='df -h'
alias du='du -hs *'
alias free='free -mh'

# edit configs
alias ea='vim $HOME/.bash_aliases; source $HOME/.bash_aliases && echo "bash_aliases sourced  --ok."'
alias eal='vim $HOME/.bash_aliases_local; source $HOME/.bash_aliases_local && echo "bash_aliases_local sourced  --ok."'
alias erc='vim ~/.bashrc; source $HOME/.bashrc && echo "bashrc sourced  --ok."'
alias essh='vim ~/.ssh/config'
alias evim='vim ~/.config/nvim/init.vim'

alias vim='nvim'
alias vimdiff='nvim -d'
alias vimfzf='vim $(fzf)'
alias view='vim -R'

# exa replacement for ls
alias ll='exa --long --all --group-directories-first'
alias llt='ll --sort newest'
alias lls='ll --sort size'

alias tt='tree -a'
alias td='tree -dL 2'

alias cat='batcat'

alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

alias rcp='rsync -avhW --no-compress --progress'

alias tmux='tmux -f ~/.config/tmux/tmux.conf'
alias t='tmux new -A'
alias tn='tmux new'
alias tl='tmux ls'
alias ta='tmux attach -t'

alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gplo='git pull origin'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit'
alias gd='git diff'

alias stow='stow --no-folding'

alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcl='docker-compose logs -f --tail 25'
alias dcr='docker-compose restart'
function dcupd {
    docker-compose pull
    docker-compose up -d --remove-orphans
    yes | docker image prune
}

alias myip='curl ipconfig.io'
