#! /bin/bash
brew update
brew install\
  tmux\
  git\
  neovim\
  diff-so-fancy\
  reattach-to-user-namespace

# tmux
## TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s "`pwd`/tmux.conf" ~/.tmux

# git
## Setup git diff tool
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# vim
## Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall
ln -s "`pwd`/nvim" ~/.vimrc

# zsh
ln -s "`pwd`/zshrc" ~/.zshrc
