dotfiles
========

# Installing tmux
1. Install [TPM][1] to support plugins:
```bash
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. Install [tmux-MacOSX-pasteboard][2] to support for pbcopy and pbpaste
``` bash
$ brew install reattach-to-user-namespace
```

# Adding config files
```bash
ln -s ${PWD}/zshrc ~/.zshrc
ln -s ${PWD}/tmux.conf ~/.tmux.conf
ln -s ${PWD}/vimrc ~/.vimrc
```

[1]: https://github.com/tmux-plugins/tpm
[2]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
