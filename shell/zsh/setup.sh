#!/bin/sh

BASE_DIR=$(dirname $0)

# install
sh -c "$(curl $CURL_PROXY_OPTION -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Solarized color theme
git submodule update --init --progress $BASE_DIR/../../theme/solarized
# Then, Apply in 'Preferences', as README.md

# Install Powerline fonts to support Agnoster theme
powerline_fonts_dir=$BASE_DIR/../../theme/powerline-fonts
git submodule update --init --progress $powerline_fonts_dir
$powerline_fonts_dir/install.sh
