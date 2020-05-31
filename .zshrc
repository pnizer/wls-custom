# Created by newuser for 5.4.2

autoload -U compinit; compinit
autoload -U promptinit; promptinit

prompt pure

export PATH=/home/linuxbrew/.linuxbrew/bin:/usr/local/bin:/home/nizer/.local/bin:$PATH

source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt APPEND_HISTORY
setopt share_history

export DOCKER_HOST=localhost:2375

#export PURE_PROMPT_SYMBOL=">"
#export PURE_PROMPT_VICMD_SYMBOL="<"
#export PURE_GIT_DOWN_ARROW="↓"
#export PURE_GIT_UP_ARROW="↑"

source ~/.zsh/plugins/zsh-term-title/term-title.plugin.zsh

unsetopt BEEP

source <(kubectl completion zsh)
source /home/nizer/.local/bin/aws_zsh_completer.sh
source ~/.zsh/completion/_docker
