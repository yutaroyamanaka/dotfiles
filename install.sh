case "${OSTYPE}" in
  darwin*)
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install neovim 
    brew install git
    ;;
  linux*)
    sudo apt update
    sudo apt install software-properties-common
    sudo apt install neovim
    ;;
esac

read -p "Activate symbolic link of .vimrc? (y/n) :" YN
if [ "${YN}" = "y" ]; then 
    ln -s ~/dotfiles/.vimrc ~/.vimrc
fi

read -p "Activate symbolic link of .bashrc? (y/n) :" YN
if [ "${YN}" = "y" ]; then 
    ln -s ~/dotfiles/.bashrc ~/.bashrc
fi

ln -s ~/dotfiles/.git-completion.bash ~/.git-completion.bash
ln -s ~/dotfiles/.git-prompt.sh ~/.git-prompt.sh

mkdir -p ~/.cache/dein/
ln -s ~/dotfiles/.dein.toml ~/.cache/dein/.dein.toml
ln -s ~/dotfiles/.dein_lazy.toml ~/.cache/dein/.dein_lazy.toml

read -p "Activate neovim? (y/n) :" YN
if [ "${YN}" = "y" ]; then 
    mkdir -p ~/.config/nvim
    ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
fi

mkdir -p ~/.vim/colors
git clone https://github.com/tomasr/molokai
mv molokai/colors/molokai.vim ~/.vim/colors/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
