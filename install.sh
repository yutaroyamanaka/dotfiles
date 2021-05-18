#!/bin/bash

case "${OSTYPE}" in
  darwin*)
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install neovim openssl readline sqlite3 xz zlib # pyenv prerequisite
    brew install git
    ;;
  linux*)
    sudo apt update
    sudo apt install --no-install-recommends -y \
    make \
    build-essential \
    software-properties-common \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    liblzma-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    wget \
    llvm \
    curl \
    git \
    neovim
    ;;
esac

read -p "Activate symbolic link of .zshrc? (y/n) :" YN
if [ "${YN}" = "y" ]; then 
    ln -s .zshrc ~/.zshrc

    read -p "install pyenv? (y/n)" PYENV_INSTALL
    if [ "${PYENV_INSTALL}" == "y"]; then
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
        echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
        echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    fi
fi

read -p "Activate symbolic link of dein file? (y/n) :" YN
if [ "${YN}" = "y" ]; then
  mkdir -p ~/.cache/dein/
  ln -s .dein.toml ~/.cache/dein/.dein.toml
  ln -s .dein_lazy.toml ~/.cache/dein/.dein_lazy.toml
fi

read -p "Activate neovim? (y/n) :" YN
if [ "${YN}" = "y" ]; then 
  mkdir -p ~/.config/nvim
  ln -s init.vim ~/.config/nvim/init.vim
fi

read -p "Activate vim color theme? (y/n) :" YN
if [ "${YN}" = "y" ]; then 
  mkdir -p ~/.vim/colors
  git clone https://github.com/tomasr/molokai
  mv molokai/colors/molokai.vim ~/.vim/colors/
fi

read -p "Set .gitconfig? (y/n) :" YN
if [ "${YN}" = "y" ]; then
  ln -s .gitconfig ~/.gitconfig
fi
