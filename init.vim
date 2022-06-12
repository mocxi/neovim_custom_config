let g:configPath = '/root/.config/nvim'
" set $CONFIG_PATH=/root/.config/nvim

call plug#begin(g:configPath.'/autoload/plugged')
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
call plug#end()

" let $GIT_TERMINAL_PROMPT=0


set termguicolors
lua require'colorizer'.setup()

if has('win32')
    let ConfigFiles = ['\\plug-config\\coc.vim','\\plug-config\\airline.vim','\\my_vimrc.vim','\\plug-config\\fzf.vim']
else
    let ConfigFiles = ['/plug-config/coc.vim','/plug-config/airline.vim','/my_vimrc.vim','/plug-config/fzf.vim']
endif
for file in ConfigFiles
    exec "source ".g:configPath.file
endfor

