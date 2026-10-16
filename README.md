neovim_custom_config
-----------------
Personal Neovim config (Lua + vim-plug). Works on Windows and Linux/macOS.

Including:
- Plugin manager: vim-plug
- LSP / completion: coc.nvim (TS/JS, Python, PHP, CSS, JSON)
- F#: Ionide-vim + nvim-lspconfig + nvim-cmp
- Fuzzy finding: fzf, fzf.vim, fzf_preview (ripgrep + bat)
- AI: CodeCompanion (Ollama / OpenAI / Gemini), minuet-ai (Ollama FIM), GitHub Copilot
- UI: PaperColor (light), vim-airline, NERDTree, nvim-colorizer
- Git: vim-fugitive, git-messenger

Installation
-----------------
# 1. Install tools

Required: `git`, `node`, `ripgrep`, `bat`, `curl`, Python, sqlite3.
Optional: `dotnet` (F# only).

On first start, Neovim warns once if anything is missing. Run `:CheckDeps` to check again.

## Windows
You may need these both on the host and in WSL.
```
choco install git nodejs ripgrep fzf bat python sqlite
```
Then point `g:sqlite_clib_path` in `init.lua` to your `sqlite3.dll`
(default: `C:\Users\<user_name>\AppData\Local\sqlite\sqlite3.dll`).

## Linux
Debian/Ubuntu example:
```
sudo apt install git nodejs ripgrep bat curl python3 libsqlite3-dev
```
- On Debian/Ubuntu `bat` is installed as `batcat`; link it: `ln -s /usr/bin/batcat ~/.local/bin/bat`
- fzf is installed automatically by the plugin into `~/.fzf`

# 2. Clone the config
Clone the repository to your nvim config directory:
- Windows: `C:\Users\<user_name>\AppData\Local\nvim`
- Linux / macOS: `~/.config/nvim`

# 3. Install plugins
Open Neovim and run `:PlugInstall`

Additional setup
-----------------
## coc
```
:CocInstall @yaegassy/coc-intelephense
:CocInstall coc-jedi
```

## Python
```
pip install -U jedi jedi-language-server
```

## F#
Requires dotnet: https://dotnet.microsoft.com/en-us/download
```
dotnet tool install -g fsautocomplete
```

## AI
Set API keys as environment variables (only for the providers you use):
- `OPENAI_API_KEY`: CodeCompanion OpenAI adapter
- `GEMINI_API_KEY`: CodeCompanion Gemini adapter

Ollama endpoints (LAN IPs) are set in `lua/plug-config/codecompanion.lua` and `lua/plug-config/minuet.lua`.

Toggle keys:
| Key  | Action |
|------|--------|
| `F3` | Toggle GitHub Copilot (off by default; run `:Copilot setup` once) |
| `F4` | Toggle minuet AI autocomplete (off by default) |
| `F5` | Toggle CodeCompanion |

Copilot is always disabled for `*.yaml`, `*.yml`, `.env*`, `*.pem`, `*/secrets/*`, `*/woa_configs/*`.

Layout
-----------------
```
init.lua                 plugin list + loader
coc-settings.json        coc language settings
autoload/plug.vim        vim-plug
lua/my_vimrc.lua         options, base keymaps
lua/deps_check.lua       missing-dependency warning, :CheckDeps
lua/plug-config/*.lua    plugin configs (coc, fzf, airline, AI)
plug-config/*.vim        fzf, fzf_preview, ionide (Vimscript)
```

Reference
---------
https://github.com/junegunn/vim-plug
https://github.com/neoclide/coc.nvim
https://github.com/BurntSushi/ripgrep#installation
https://github.com/junegunn/fzf
https://github.com/ionide/Ionide-vim
https://github.com/olimorris/codecompanion.nvim
https://github.com/milanglacier/minuet-ai.nvim
https://github.com/github/copilot.vim
https://github.com/kkharji/sqlite.lua
