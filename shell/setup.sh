BASE_DIR=$(dirname $0)

PROXY_CONFIG=$HOME/.proxy_config
# create if non-exist
[[ ! -f $PROXY_CONFIG ]] && touch $PROXY_CONFIG
ln $HOME/customizations/shell/bashrc_proxy.sh $HOME/.bashrc_proxy

$BASE_DIR/zsh/setup.sh
