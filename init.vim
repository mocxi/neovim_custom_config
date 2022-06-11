" call plug#begin('C:\Users\huy.lehuu\AppData\Local\nvim\plugged')
call plug#begin('C:\Users\huy.lehuu\AppData\Local\nvim\plugged')
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
    Plug 'vim-vdebug/vdebug'
call plug#end()

" let $GIT_TERMINAL_PROMPT=0


if has('win32')
    set termguicolors
endif

lua require'colorizer'.setup()

source C:\Users\huy.lehuu\AppData\Local\nvim\plug-config\coc.vim
source C:\Users\huy.lehuu\AppData\Local\nvim\plug-config\airline.vim

" Huy.LH define
source C:\Users\huy.lehuu\AppData\Local\nvim\my_vimrc.vim
" set shell="C:\Program Files\Git\git-bash.exe"

source C:\Users\huy.lehuu\AppData\Local\nvim\plug-config\fzf.vim

" plugin
source C:\Users\huy.lehuu\AppData\Local\nvim\plugin\localvimrc.vim
