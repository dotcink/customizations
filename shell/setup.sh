#!/bin/sh
# vim: ft=sh

BASE_DIR=$(dirname $0)
SHRC_PATH=customizations/shell/rc
SHRC=$HOME/$SHRC_PATH

source $SHRC

# Simplify the process by `source` the repo's rc files directly in base rc's,
# instead of cloning a file to $HOME and `source` the cloned
function add_source_shrc() {
  include_rc_to_local $1 "source $SHRC" "^source .*$SHRC_PATH$" ''
}

add_source_shrc ~/.zshrc

$BASE_DIR/zsh/setup.sh

add_source_shrc ~/.zshrc
