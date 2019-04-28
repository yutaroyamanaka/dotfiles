/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install neovim 
brew install git

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.git-completion.bash ~/.git-completion.bash
ln -s ~/dotfiles/.git-prompt.sh ~/.git-prompt.sh
ln -s ~/dotfiles/.dein.toml ~/.cache/dein/.dein.toml
ln -s ~/dotfiles/.dein_lazy.toml ~/.cache/.dein_lazy.toml

mkdir -p ~/.vim/colors
git clone https://github.com/tomasr/molokai
mv molokai/colors/molokai.vim ~/.vim/colors/
