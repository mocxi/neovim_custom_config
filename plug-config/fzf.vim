" FZF
" This is the default extra key bindings
map <C-f> :Files<CR>
map <C-p> :ProjectFiles<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>G :RG<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


" huylh switch to fzf_config.lua
" let g:fzf_tags_command = 'ctags -R'
" Border color
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
" let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--preview', 'cat --color=always {1} --highlight-line {2}']}), <bang>0)

function! s:find_git_root()
    if has('win32')
        " return system('git rev-parse --show-toplevel 2> nul')[:-2]
        return system('git rev-parse --show-toplevel 2> nul')[:-2]
    else
        return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    endif
  endfunction

  command! ProjectFiles execute 'Files' s:find_git_root()


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options':
              \ ['--phony', '--query', a:query, '--bind',
              \ 'change:reload:'.reload_command,
              \ '--preview', 'bat --color=always {1} --highlight-line {2}'
              \ ]
          \ }
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

function! RipgrepFzfPath(fullscreen, path)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let strrr = shellescape("")
  let initial_command = printf(command_fmt, strrr)
  let reload_command = printf(command_fmt, '{q}')

  if !isdirectory(a:path)
      echo printf("The path %s is not valid", shellescape(a:path))
      return 1
  endif

  let spec = {'dir': a:path, 'options': ['--phony', '--query','', '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(), a:fullscreen)
endfunction


command! -bang -nargs=1 -bang -complete=dir Rgp call RipgrepFzfPath(<bang>0, <q-args>)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" end fzf

