#!/bin/sh
# vim: ft=sh

set -x

BASE_DIR=$(dirname $0)
RC_PATH=customizations/rime/rimerc

source $BASE_DIR/../common/shrc

include_rc_to_local ~/.zshrc "source ~/$RC_PATH" "^source .*$RC_PATH" 1


## support emoji for wubi86_jidian
RIME_DIR=~/Library/Rime

if [ ! -e $RIME_DIR/opencc/emoji.json ]; then
  pushd /tmp

  axel -an8 https://github.com/rime/rime-emoji/archive/refs/heads/master.zip || exit
  unzip rime-emoji-master.zip || exit

  # move opencc
  if [ -e "$RIME_DIR/opencc" ]; then
    mv -v rime-emoji-master/opencc/* $RIME_DIR/opencc/
  else
    mv -v rime-emoji-master/opencc $RIME_DIR/
  fi

  touch $RIME_DIR/wubi86_jidian.custom.yaml
  if [ "$(grep -c rime-emoji $RIME_DIR/wubi86_jidian.custom.yaml)" == 0 ]; then
    echo "\n\n## rime-emoji" >> $RIME_DIR/wubi86_jidian.custom.yaml
    cat rime-emoji-master/emoji_suggestion.yaml >> $RIME_DIR/wubi86_jidian.custom.yaml
  fi

  rm -vr rime-emoji-master.zip rime-emoji-master
  popd
fi

echo "All success."
