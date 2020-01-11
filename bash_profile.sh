
########  ########
# shell
########  ########

# ignoreboth = ignorespace + ignoredups
export HISTCONTROL=ignoreboth:erasedups
# as more lines as possible
export HISTFILESIZE=999999
export HISTSIZE=999999
# append, instead of overwriting
shopt -s histappend

# colorized
alias ls='ls -G'
alias ll='ls -l'

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
