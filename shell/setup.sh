#!/bin/sh
# vim: ft=sh

BASE_DIR=$(dirname $0)
SHRC_PATH=customizations/shell/rc
SHRC=$HOME/$SHRC_PATH

source $SHRC

# Simplify the process by `source` the repo's rc files directly in base rc's,
# instead of cloning a file to $HOME and `source` the cloned
function add_source_shrc() {
  base_rc=$1
  # not create if non exist, because the file mostly is not created by user
  # add `source` command if not added once
  if [ -w "$base_rc" ] && [ "$(grep -c "^source .*$SHRC_PATH$" "$base_rc")" = 0 ]; then
    echo "\nsource $SHRC" >> $base_rc
  else
    if [[ ! -w "$base_rc" ]]; then
      echo "Base rc '$base_rc' to add source is NOT existent or writable."
    fi
  fi
}

add_source_shrc ~/.zshrc

$BASE_DIR/zsh/setup.sh

add_source_shrc ~/.zshrc
