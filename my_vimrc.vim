" Setup copy/paste from windows with ctrl+v
nmap <C-v> "*p
vnoremap <C-c> "*y

if has('win32')
    set shell=cmd
endif
set number
set relativenumber
set list
set expandtab
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

set ignorecase
set smartcase
set incsearch

set scrolloff=6

" Be smart when using tabs ;)
" set smarttab
"
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

function Stab2()
    set shiftwidth=2
    set tabstop=2
    echo "set tab to 2"
endfunction

function ScolorColumn()
    set colorcolumn=100
    highlight ColorColumn ctermbg=0 guibg=grey
    echo "set colorcolumn=100 "
endfunction

" Linebreak on 500 characters
set lbr
set tw=500


" set t_Co=256   " This is may or may not needed.
set background=light
colorscheme PaperColor
" let g:airline_theme='papercolor'


set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set listchars=eol:$,nbsp: ,tab:> ,trail:~,extends:>,precedes:<

map <leader>ff :NERDTreeFind<CR>
map <leader>fj :%!python -m json.tool --no-ensure-ascii<CR>
