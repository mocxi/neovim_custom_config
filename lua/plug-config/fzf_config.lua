-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
vim.env.FZF_DEFAULT_COMMAND="rg --files --hidden"
-- vim.env.FZF_DEFAULT_OPTS="--layout=reverse --info=inline --ansi --preview-window 'right:60%' --preview \"bat --color=always --style=header,grid --line-range :300 {}\""
vim.env.FZF_DEFAULT_OPTS="--layout=reverse --info=inline --height 100%"
    .." --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'"
    .." --color '--color=bg+:#D9D9D9,bg:#E1E1E1,border:#C8C8C8,spinner:#719899,hl:#719872,fg:#616161,header:#719872,info:#727100,pointer:#E12672,marker:#E17899,fg+:#616161,preview-bg:#2789c2'"
    -- .." --color '--color=preview-bg:#293739'"
    -- .." --color '--color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'"
vim.g.fzf_tags_command = 'ctags -R'

vim.api.nvim_create_user_command(
    'Rgtest',
    function(opts)
        print(string.upper(opts.fargs[1]))
    end,
    { nargs = 1 }
)

