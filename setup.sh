#!/bin/bash

INSTALL_DIR="${HOME}"/.install
if [ -d "${INSTALL_DIR}" ]; then
    echo "Warning, install directory already exists and files may be overwritten"
    read -p "Do you want to continue [y/N]? " -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting setup"
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    fi
    echo "Proceeding with install"
else
    mkdir -p "${INSTALL_DIR}"
fi

# Install homebrew if not installed
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew"; \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# Installs awesome Vimrc
# https://github.com/amix/vimrc
echo "Installing The Ultimate vimrc"
git clone --depth=1 https://github.com/amix/vimrc.git "${INSTALL_DIR}"/vim_runtime
sh "${INSTALL_DIR}"/vim_runtime/install_awesome_vimrc.sh

# Install oh-my-zsh
# https://ohmyz.sh/
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy dot files to home directory
echo "Copying dot files to home directory"
cp .gitconfig "${HOME}"
cp .ideavimrc "${HOME}"
cp .zprofile "${HOME}"
cp .zshrc "${HOME}"
