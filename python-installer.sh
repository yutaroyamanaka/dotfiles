#!/bin/sh
VERSION=$1

# python install
pyenv install ${VERSION}
pyenv global ${VERSION}
echo "export PYENV_PYTHON3_VERSION=${VERSION}" >> ~/.zprofile
