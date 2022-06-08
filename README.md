# Greyson's OSX dotfiles!

**Disclaimer:** Please do not hastily replace your dotfiles with these without
understanding what each one entails and the settings they change. Use at your
own risk!

### Flow
* [nvim](https://github.com/neovim/neovim)
  * [`vim-plug`](https://github.com/junegunn/vim-plug)
* [tmux](https://github.com/tmux/tmux)

### Installation
Before installing, consider making a backup of your existing dotfiles. Clone
this repository to wherever you'd like. It's recommended to make symbolic links
where the source file is in a `dotfiles/` directory and the destination file
is where the file should be in your system.
```
ln <source> <destination>
$ ln dotfiles/vim/.vimrc ~/.vimrc
$ ln dotfiles/tmux/.tmux.conf ~/.tmux.conf
```
