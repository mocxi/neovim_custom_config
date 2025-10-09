local vim = vim

local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- On-demand loading: loaded when the specified command is executed
Plug('preservim/nerdtree')
-- Theme
Plug('norcalli/nvim-colorizer.lua')
Plug('NLKNguyen/papercolor-theme')
-- Any valid git URL is allowed
Plug('https://github.com/junegunn/vim-easy-align.git')

-- Using a non-default branch
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

-- F#
-- require: `dotnet tool install -g fsautocomplete`
if vim.fn.has('win32') == 1 then
    Plug(
        'autozimu/LanguageClient-neovim',
        {['branch']='next',['do']= 'powershell -ExecutionPolicy Unrestricted .\\install.ps1'}
    )
else
    Plug(
        'autozimu/LanguageClient-neovim',
        {['branch']='next',['do']='bash install.sh'}
    )
end

Plug('ionide/Ionide-vim')

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp', {['branch']= 'main' })

Plug('hrsh7th/cmp-buffer', {['branch']= 'main' })
Plug('hrsh7th/cmp-path', { ['branch']= 'main' })
Plug('hrsh7th/cmp-cmdline', { ['branch']= 'main' })
Plug('hrsh7th/nvim-cmp', { ['branch']= 'main' })
Plug('hrsh7th/cmp-vsnip', { ['branch']= 'main' })
Plug('hrsh7th/vim-vsnip')

-- Post-update hook: run a shell command after installing or updating the plugin
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })

Plug('rhysd/git-messenger.vim')
Plug('tpope/vim-fugitive')
Plug('junegunn/fzf.vim')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')


-- TWIG format
Plug('beyondwords/vim-twig')
Plug('neoclide/coc-css')
Plug('azabiong/vim-highlighter')

vim.call('plug#end')

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
require("my_vimrc")
require'colorizer'.setup()
require'plug-config.coc'
require'plug-config.fzf_config'
require'plug-config.airline'
-- vim.cmd('source '..vim.fn.stdpath('config')..'/plugin/WindowSwap.vim')
vim.cmd('source '..vim.fn.stdpath('config')..'/plug-config/fzf.vim')
vim.cmd('source '..vim.fn.stdpath('config')..'/plug-config/fzf_preview.vim')
vim.cmd('source '..vim.fn.stdpath('config')..'/plug-config/ionide.vim')
