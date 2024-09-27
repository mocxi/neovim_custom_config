-- vim.env.FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
vim.env.FZF_DEFAULT_COMMAND="rg --files --hidden"
-- vim.env.FZF_DEFAULT_OPTS="--layout=reverse --info=inline --ansi --preview-window 'right:60%' --preview \"bat --color=always --style=header,grid --line-range :300 {}\""
vim.env.FZF_DEFAULT_OPTS="--layout=reverse --info=inline"
    .." --preview-window 'right:60%'"
    .." --color '--color=preview-bg:#1a577a'"
    -- .." --color '--color=preview-bg:#293739'"
    -- .." --color '--color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'"
vim.g.fzf_tags_command = 'ctags -R'

