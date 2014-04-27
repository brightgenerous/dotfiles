##
# ~/.zshrc
#

## Environment variable configuration
#
# Env
#
source /etc/profile

#
# LANG
#
export LANG=ja_JP.UTF-8

# prompt
autoload -U colors
colors
case ${UID} in
  0)
    PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%}# "
    RPROMPT='[%d]'
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      RPROMPT="${RPROMPT}%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]')%{${reset_color}%}"
    ;;
  *)
    PROMPT="%{${fg[magenta]}%}[%n@%m]%{${reset_color}%}%% "
    RPROMPT='[%d]'
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      RPROMPT="${RPROMPT}%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]')%{${reset_color}%}"
    ;;
esac

# completion
##autoload -U compinit
##compinit
##setopt correct
##zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
##setopt hist_ignore_dups
##setopt share_history
##setopt auto_pushd
##setopt pushd_ignore_dups

# alias
#alias ls='ls --color=auto'
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'
alias -g W='| wc'
alias -g X='| xargs'
##alias tsp='tmux new-session \; split-window -h -d'
##alias tvsp='tmux new-session \; split-window -d'


PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init - --no-rehash)"

