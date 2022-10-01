#/bin/bash
GO_VERSION=$1
PYTHON_VERSION=$2

# go install
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang $GO_VERSION
asdf global golang $GO_VERSION

# install python
asdf plugin-add python
asdf install python $PYTHON_VERSION
asdf global python $PYTHON_VERSION
