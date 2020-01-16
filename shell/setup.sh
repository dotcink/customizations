# vim: ft=sh

BASE_DIR=$(dirname $0)
SHRC_PROXY=$HOME/.shrc_proxy

# auto clone shrc_proxy if not exist
if [[ -f $SHRC_PROXY ]]; then
  echo "$SHRC_PROXY already exist"
else
  ln -v $HOME/customizations/shell/rc_proxy $SHRC_PROXY
fi
. $SHRC_PROXY

$BASE_DIR/zsh/setup.sh
