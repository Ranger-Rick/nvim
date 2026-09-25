function ReplaceLocalhost(opts)
    local ip = opts.args

    if ip == '' then
        local ipvalue = vim.fn.system("ipconfig getifaddr en11")
        ip = ipvalue:gsub("%s+$", "")
    end

    vim.cmd(':%s/localhost/' .. ip .. '/g')
end

vim.api.nvim_create_user_command('Localhost', function (opts)
    ReplaceLocalhost(opts)
end, {
    desc = 'Replace localhost with your computer\'s IP address',
    nargs = '?'
})
