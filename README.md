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

Clone the repository to your nvim config directory:
- Linux: `\home\user.name\.config\nvim`
- Windows: `C:\Users\user.name\AppData\Local\nvim`

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
(vdebug is not functional so skip it)
install vdebug
install plugin from python: https://github.com/neovim/pynvim

```
pip3 install pynvim
```

## Fsharp

require dotnet: https://dotnet.microsoft.com/en-us/download

install autocomplete:
```
dotnet tool install -g fsautocomplete
```

Reference
---------
https://github.com/BurntSushi/ripgrep#installation
https://github.com/junegunn/fzf
https://github.com/junegunn/vim-plug
https://github.com/ionide/Ionide-vim
https://github.com/autozimu/LanguageClient-neovim
