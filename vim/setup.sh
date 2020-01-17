#!/bin/sh
# vim: ft=sh

BASE_DIR=$(dirname $0)
RC_PATH=customizations/vim/vimrc

source $BASE_DIR/../common/shrc

include_rc_to_local ~/.vimrc "source ~/$RC_PATH" "^source .*$RC_PATH" 1
