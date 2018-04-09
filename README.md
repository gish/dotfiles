dotfiles
========

# Installing core components
1. Install Homebrew
```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. Install zsh, neovim, tmux
```bash
$ brew install zsh neovim tmux
```

# Installing tmux
1. Install [TPM][1] to support plugins:
```bash
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
2. Install plugins: `prefix` + <kbd>I</kbd>.

3. Install [tmux-MacOSX-pasteboard][2] to support for pbcopy and pbpaste
``` bash
$ brew install reattach-to-user-namespace
```

# Installing vim
1. Install Vundle
```bash
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
$ nvim +PluginInstall +qall
```

# Adding config files
```bash
ln -s ${PWD}/zshrc ~/.zshrc
ln -s ${PWD}/tmux.conf ~/.tmux.conf
ln -s ${PWD}/vimrc ~/.vimrc
ln -s ${PWD}/vimrc ~/.config/nvim/init.vim
```

[1]: https://github.com/tmux-plugins/tpm
[2]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
