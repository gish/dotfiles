#! /bin/bash
brew update
brew install\
  tmux\
  git\
  neovim\
  diff-so-fancy\
  reattach-to-user-namespace\
  nvm

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
## autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
## syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
## color theme
git clone https://github.com/dracula/zsh.git /tmp/dracula &&\
  mv /tmp/dracula/dracula.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes

# nvm
mkdir ~/.nvm
