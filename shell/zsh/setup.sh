#!/bin/sh

BASE_DIR=$(dirname $0)

source $BASE_DIR/../../common/shrc

# install
sh -c "$(curl $CURL_PROXY_OPTION -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Solarized color theme
module_dir=$BASE_DIR/../../theme/solarized
git submodule update --init --progress $module_dir
# Then, Apply in 'Preferences', as README.md

# Install Powerline fonts to support Agnoster theme
powerline_fonts_dir=$BASE_DIR/../../theme/powerline-fonts
git submodule update --init --progress $powerline_fonts_dir
$powerline_fonts_dir/install.sh

# Install Powerlevel9k theme
powerlevel9k_link_to=~/.oh-my-zsh/custom/themes/powerlevel9k
powerlevel9k_theme_dir=$BASE_DIR/theme/powerlevel9k
git submodule update --init --progress $powerlevel9k_theme_dir
[ ! -e $powerlevel9k_link_to ] && ln -vs $(pwd)/$powerlevel9k_theme_dir $powerlevel9k_link_to

# Install syntax highlighting plugin
plugin_link=~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
plugin_dir=$BASE_DIR/plugins/syntax-highlighting
git submodule update --init --progress $plugin_dir
[ ! -e $plugin_link ] && ln -vs $(pwd)/$plugin_dir $plugin_link

# set DEFAULT_USER to hide "user@host" prompt prefix
include_rc_to_local ~/.zshrc "export DEFAULT_USER=$USER" '^export DEFAULT_USER=' ''
