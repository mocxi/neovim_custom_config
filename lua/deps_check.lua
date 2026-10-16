-- Warn (once) about external tools this config needs but that are missing.
-- The warning is shown again only if the set of missing tools changes.
-- Run :CheckDeps to see the full report at any time.
local M = {}

local is_win = vim.fn.has('win32') == 1

local deps = {
  { cmd = 'git',     why = 'vim-plug, fugitive, git-messenger' },
  { cmd = 'node',    why = 'coc.nvim, copilot.vim' },
  { cmd = 'rg',      why = ':Rg / fzf grep' },
  { cmd = 'bat',     why = 'fzf file preview' },
  { cmd = 'curl',    why = 'minuet / codecompanion' },
  { cmd = is_win and 'python' or 'python3', why = '<leader>fj (format JSON)' },
  { cmd = 'dotnet',  why = 'F# (Ionide / fsautocomplete)', optional = true },
}

local function sqlite_ok()
  local ok, ffi = pcall(require, 'ffi')
  if not ok then return true end -- can't check, don't nag
  local path = vim.g.sqlite_clib_path or 'sqlite3'
  return (pcall(ffi.load, path))
end

function M.missing()
  local list = {}
  for _, d in ipairs(deps) do
    if vim.fn.executable(d.cmd) == 0 then
      table.insert(list, { name = d.cmd, why = d.why, optional = d.optional })
    end
  end
  if not sqlite_ok() then
    table.insert(list, {
      name = 'sqlite3 library',
      why = is_win and 'set g:sqlite_clib_path to sqlite3.dll'
                    or 'install libsqlite3-dev / sqlite-devel',
    })
  end
  return list
end

local function report(list)
  local lines = { 'Missing dependencies:' }
  for _, d in ipairs(list) do
    table.insert(lines, string.format('  - %s%s: %s', d.name,
      d.optional and ' (optional)' or '', d.why))
  end
  vim.notify(table.concat(lines, '\n'), vim.log.levels.WARN, { title = 'nvim config' })
end

local marker = vim.fn.stdpath('state') .. '/deps_warned'

function M.run()
  local list = M.missing()
  local names = {}
  for _, d in ipairs(list) do table.insert(names, d.name) end
  local key = table.concat(names, ',')

  local f = io.open(marker, 'r')
  local last = f and f:read('*a') or nil
  if f then f:close() end
  if key == last then return end -- already warned about exactly this set

  if #list > 0 then report(list) end
  vim.fn.mkdir(vim.fn.stdpath('state'), 'p')
  f = io.open(marker, 'w')
  if f then f:write(key); f:close() end
end

vim.api.nvim_create_user_command('CheckDeps', function()
  local list = M.missing()
  if #list == 0 then
    vim.notify('All dependencies found.', vim.log.levels.INFO)
  else
    report(list)
  end
end, {})

vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function() vim.schedule(M.run) end,
})

return M
