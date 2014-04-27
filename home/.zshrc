export PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init - --no-rehash)"

# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# Env
#
source /etc/profile

#
# LANG
#
export LANG=ja_JP.UTF-8
#export LANG=ja_JP.eucJP
#export LANG=ja_JP.SJIS


## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
  0)
    PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
  *)
    PROMPT="%{${fg[magenta]}%}%/%%%{${reset_color}%} "
    PROMPT2="%{${fg[magenta]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[magenta]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
      PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

