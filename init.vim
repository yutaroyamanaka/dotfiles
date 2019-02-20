set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python_host_prog = expand('~/.pyenv/versions/anaconda-4.0.0/bin/python2')
let g:python3_host_prog = expand('~/.pyenv/versions/anaconda3-5.2.0/bin/python3')
source ~/.vimrc
