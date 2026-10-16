vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = {"*.yaml", "*.yml", ".env*", "*.pem", "*/secrets/*", "*/woa_configs/*"},
    callback = function()
        vim.b.copilot_enabled = false
    end
})


--[[
-- If you want to prevent Copilot from triggering on specific languages or configurations (like yaml, markdown, or env), you can control it globally using the g:copilot_filetypes dictionary.
vim.g.copilot_filetypes = {
    xml = false,
    markdown = false,
    yaml = false
}
-- Alternatively, to disable Copilot for everything except specific languages:
vim.g.copilot_filetypes = {
  ["*"] = false,
  python = true,
  javascript = true,
  typescript = true,
}
]]
-- 1. Turn it off by default across all filetypes when Neovim boots up
vim.g.copilot_filetypes = { ["*"] = false }

-- 2. Clean, bulletproof toggle function
vim.keymap.set('n', '<F3>', function()
    -- Ask the copilot vimscript engine if it is actively running right now
    local is_enabled = vim.fn['copilot#Enabled']() == 1

    if is_enabled then
        -- If running, disable it completely
        vim.g.copilot_filetypes = { ["*"] = false }
        vim.cmd('Copilot disable')
        print("Copilot AI: Disabled")
    else
        -- If dead, re-grant file permissions and boot it back up
        vim.g.copilot_filetypes = {
            xml = false,
            markdown = false,
            yaml = false
        }
        vim.cmd('Copilot enable')
        print("Copilot AI: Enabled")
    end
end, { desc = 'Toggle Copilot AI safely' })