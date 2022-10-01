#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim openssl readline sqlite3 xz zlib neofetch git peco asdf

# zshrc
ln -s ${PWD}/.zshrc ${HOME}/.zshrc

# dein 
mkdir -p ~/.cache/dein/
ln -s ${PWD}/.dein.toml ${HOME}/.cache/dein/.dein.toml
ln -s ${PWD}/.dein_lazy.toml ${HOME}/.cache/dein/.dein_lazy.toml

# neovim
mkdir -p ~/.config/nvim
ln -s ${PWD}/init.vim ${HOME}/.config/nvim/init.vim

# vim color scheme
mkdir -p ~/.vim/colors
git clone https://github.com/tomasr/molokai
mv molokai/colors/molokai.vim ~/.vim/colors/

# git config
ln -s ${PWD}/.gitconfig ${HOME}/.gitconfig

# gitignore 
ln -s ${PWD}/gitignore ${HOME}/.config/gitignore
