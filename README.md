# Greyson's OSX dotfiles!

**Disclaimer:** Please do not hastily replace your dotfiles with these without
understanding what each one entails and the settings they change. Use at your
own risk!

### Flow
* [nvim](https://github.com/neovim/neovim)
  * [`vim-plug`](https://github.com/junegunn/vim-plug)
  * [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim)
  * [`built-in LSP`](https://neovim.io/doc/user/lsp.html)
  * [`floaterm`](https://github.com/voldikss/vim-floaterm)
* [tmux](https://github.com/tmux/tmux)
* [iTerm2](https://iterm2.com/)

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
