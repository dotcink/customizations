
IS_ZSH="$ZSH_VERSION"
IS_BASH="$BASH_VERSION"

########  ########
# shell
########  ########

# ignoreboth = ignorespace + ignoredups
export HISTCONTROL=ignoreboth:erasedups
# as more lines as possible
export HISTFILESIZE=999999
export HISTSIZE=999999
# append, instead of overwriting
if [[ $IS_BASH ]]; then
  shopt -s histappend
fi

# colorized
alias ls='ls -G'
alias ll='ls -l'

# proxy
. $HOME/.bashrc_proxy

########  ########
# vim
########  ########

export EDITOR=vim
# skip the use of .viminfo file(no record of vim operations)
alias vimN='vim -i NONE'

########  ########
# others
########  ########

alias px='ps ax | grep '
