-- Utilities

-- remove line with space
function removeEndlineSpaces ()
    local ok, error = pcall(function() vim.cmd([[%s/\v[ ]+$//g]]) end)
    if not ok then
        print('no endline spaces found!')
    else
        print('done')
    end
end

vim.keymap.set('n', '<Leader>rms', removeEndlineSpaces)
