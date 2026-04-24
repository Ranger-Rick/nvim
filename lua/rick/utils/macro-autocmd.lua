vim.api.nvim_create_autocmd({ 'RecordingEnter', 'CmdlineEnter' }, {
    desc = 'Set Command Height to 1 so recording is visible',
    callback = function ()
        vim.opt.cmdheight = 1
    end
})

vim.api.nvim_create_autocmd({ 'RecordingLeave', 'CmdlineLeave' }, {
    desc = 'Set Command Height to 0 to reset',
    callback = function ()
        vim.opt.cmdheight = 0
    end
})
