## Installation

Clone the repository:

    git clone --recursive git@github.com:macollins/dotfiles.git

Create syminks:

    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/gvimrc ~/.gvimrc
    ln -s ~/dotfiles/zshrc ~/.zshrc
    ln -s ~/dotfiles/agignore ~/.agignore

Vim will default to using the Menlo font unless one of the alternatives fonts
is installed:

  1. [Source Code Pro](https://github.com/adobe-fonts/source-code-pro)
  2. [Inconsolata](http://levien.com/type/myfonts/inconsolata.html)


Updating submodules:

  git submodule update --remote --merge
