neovim_custom_config
-----------------
This is personal custom config for neovim
Including:
- fzf
- coc
- ...

Installation
-----------------
# Config

update path to plugged dir in `./init.vim`
```
call plug#begin('~/.config/nvim/autoload/plugged')
```

# Install tool

## Windows
You may need both at host and WSL
- Install ripgrep (choco install ripgrep)
- Install fzf (choco install fzf)
- Install bat (choco install bat)

Clone the repository to your nvim config directory
```
C:\Users\<user_name>\AppData\Local\nvim
```

Run `:PlugInstall`

## Linux
- Install ripgrep
- Install fzf

Clone the repository to your nvim config directory
```
\home\<user_name>\.config\nvim
```
Run `:PlugInstall`

# Addition settup
## coc
```
:CocInstall @yaegassy/coc-intelephense
:CocInstall coc-pyright
:CocInstall coc-fsharp
```

## python
```
pip install jedi
pip install -U jedi-language-server
```

## php
install vdebug
install plugin from python: https://github.com/neovim/pynvim

```
pip3 install pynvim
```

Reference
---------
https://github.com/BurntSushi/ripgrep#installation
https://github.com/junegunn/fzf
https://github.com/junegunn/vim-plug
