-- MY VIMRC

-- functions
function removeEndlineSpaces ()
    local ok, error = pcall(function() vim.cmd([[%s/\v[ ]+$//g]]) end)
    if not ok then
        print('no endline spaces found!')
    else
        print('done')
    end
end

function setStab (num)
    vim.cmd('set shiftwidth='..num)
    vim.cmd('set tabstop='..num)
end

-- mapping
vim.keymap.set('n', '<C-v>', '"+p', {remap=true, desc="Set Ctrl + V for OS paste"});
vim.keymap.set('v', '<C-c>', '"+y', {desc="Set Ctrl + C for OS copy"});
vim.keymap.set(
        'v',
        '//',
        "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>",
        {desc="Set Ctrl + C for OS copy"}
);
vim.keymap.set('n', '<Leader>rms', removeEndlineSpaces)
vim.keymap.set(
        'n',
        '<Leader>st2',
        function()
                setStab(2)
        end
)
vim.keymap.set('n', '<Leader>st4', function() setStab(4) end)

vim.keymap.set(
    'n',
    '<leader>ff',
    function()
        vim.cmd('NERDTreeFind')
    end
)

vim.keymap.set(
    'n',
    '<leader>fj',
    function()
        vim.cmd(':%!python -m json.tool --no-ensure-ascii')
    end
)

-- config
-- this will affect color schemes
vim.cmd('colorscheme PaperColor');
local term = vim.api.nvim_eval('&term')
local termFound = string.find(term, 'screen') ~= nil  or string.find(term, 'screen') ~= nil
if vim.fn.has('win32') == 1 then
    vim.cmd('set shell=cmd')
else
    vim.cmd('set shell=bash')
end
if vim.fn.has('gui_running') == 0 and termFound then
  vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
  vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
end
vim.opt.termguicolors = true

vim.cmd('set number')
vim.cmd('set relativenumber')
vim.cmd('set list')
vim.cmd('set expandtab')
vim.cmd('set ignorecase')
vim.cmd('set smartcase')
vim.cmd('set incsearch')
vim.cmd('set scrolloff=6')
vim.cmd('set lbr')
vim.cmd('set lw=500')
vim.cmd('set background=light')
vim.cmd('set ai')
vim.cmd('set wrap')
vim.cmd('set listchars=eol:$,nbsp: ,tab:> ,trail:~,extends:>,precedes:<')

setStab(4)

-- for airline
vim.cmd('set noshowmode')
