#!/bin/sh

BASE_DIR=$(dirname $0)

source $BASE_DIR/../../common/shrc

# install
sh -c "$(curl $CURL_PROXY_OPTION -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Solarized color theme
git submodule update --init --progress $BASE_DIR/../../theme/solarized
# Then, Apply in 'Preferences', as README.md

# Install Powerline fonts to support Agnoster theme
powerline_fonts_dir=$BASE_DIR/../../theme/powerline-fonts
git submodule update --init --progress $powerline_fonts_dir
$powerline_fonts_dir/install.sh

# Install Powerlevel9k theme
powerlevel9k_link_to=~/.oh-my-zsh/custom/themes/powerlevel9k
powerlevel9k_theme_dir=$BASE_DIR/theme/powerlevel9k
git submodule update --init --progress $powerlevel9k_theme_dir
[ ! -f $powerlevel9k_link_to ] && ln -s ~/customizations/shell/zsh/theme/powerlevel9k $powerlevel9k_link_to

# set DEFAULT_USER to hide "user@host" prompt prefix
include_rc_to_local ~/.zshrc "export DEFAULT_USER=$USER" '^export DEFAULT_USER=' ''
