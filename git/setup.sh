#!/bin/sh
# vim: ft=sh

BASE_DIR=$(dirname $0)
RC_PATH=customizations/git/config

source $BASE_DIR/../common/shrc

include_rc_to_local ~/.gitconfig "[include]\n\tpath = ~/$RC_PATH" "path *=.*$RC_PATH" 1
