#!/bin/bash

# python 3.7.0 install
pyenv install 3.7.0
# set 3.7.0
pyenv global 3.7.0
echo 'export PYENV_PYTHON3_VERSION=3.7.0' >> ~/.bash_profile

# neovim install
pip3 install neovim
# set neovim default
echo 'alias vim=nvim' >> ~/.bash_profile
