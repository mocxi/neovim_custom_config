" let $VIMRC_ROOT_DIR='C:\Users\user.name\AppData\Local\nvim'
" let $VIMRC_ROOT_DIR='/usr/root/.config/nvim'
let $VIMRC_ROOT_DIR='C:\Users\user.name\AppData\Local\nvim'

let $DS= has('win32') ? '\' : '/'

" call plug#begin($VIMRC_ROOT_DIR.'/autoload/plugged')
let $VIMRC_PLUG_PATH = $VIMRC_ROOT_DIR.$DS.'plugged'
let $VIMRC_PLUG_CONFIG_PATH = $VIMRC_ROOT_DIR.$DS.'plug-config'.$DS
let $VIMRC_PLUG_CONFIG_LUA_PATH = $VIMRC_ROOT_DIR.$DS.'plug-config'.$DS.'lua'.$DS
let $VIMRC_PLUGIN_PATH = $VIMRC_ROOT_DIR.$DS.'plugin'.$DS


call plug#begin($VIMRC_PLUG_PATH)
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
    Plug 'preservim/nerdtree'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'rhysd/git-messenger.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'yuki-yano/fzf-preview.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " fsharp
    Plug 'deoplete-plugins/deoplete-lsp'
    Plug 'juvenn/mustache.vim'
    Plug 'ionide/Ionide-vim', {
        \ 'do':  'powershell -ExecutionPolicy Unrestricted .\install.ps1',
        \}
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    Plug 'beyondwords/vim-twig'
    " Plug 'vim-vdebug/vdebug'
    Plug 'neoclide/coc-css'
    Plug 'azabiong/vim-highlighter'
call plug#end()

" let $GIT_TERMINAL_PROMPT=0


if has('win32')
    set termguicolors
endif

lua require'colorizer'.setup()

let $VIMRC_PLUG_COC_CONFIG_SCRIPT = $VIMRC_PLUG_CONFIG_LUA_PATH.'coc.lua'
luafile $VIMRC_PLUG_COC_CONFIG_SCRIPT
let $VIMRC_PLUG_AIRLINE = $VIMRC_PLUG_CONFIG_PATH.'airline.vim'
source $VIMRC_PLUG_AIRLINE

" Huy.LH define
let $MY_VIMRC = $VIMRC_ROOT_DIR.$DS.'my_vimrc.vim'
source $MY_VIMRC
let $MY_VIMRC_LUA = $VIMRC_ROOT_DIR.$DS.'my_vimrc.lua'
luafile $MY_VIMRC_LUA

let $VIMRC_PLUG_FZF_CONFIG_SCRIPT = $VIMRC_PLUG_CONFIG_LUA_PATH.'fzf_config.lua'
luafile $VIMRC_PLUG_FZF_CONFIG_SCRIPT
let $VIMRC_PLUG_FZF__SCRIPT = $VIMRC_PLUG_CONFIG_PATH.'fzf.vim'
source $VIMRC_PLUG_FZF__SCRIPT

" plugin
let $PLUGIN_LOCALVIMRC = $VIMRC_PLUGIN_PATH.'localvimrc.vim'
source $PLUGIN_LOCALVIMRC
let $PLUGIN_WINDOWSWAP = $VIMRC_PLUGIN_PATH.'WindowSwap.vim'
source $PLUGIN_WINDOWSWAP
