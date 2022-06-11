neovim_custom_config
-----------------
This is personal custom config for neovim
Including:
- fzf
- coc
- ...

Installation
-----------------
# Install tool


## Windows
- Install ripgrep (choco install ripgrep)
- Install fzf (choco install fzf)

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
