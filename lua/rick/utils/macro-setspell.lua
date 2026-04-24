vim.api.nvim_create_autocmd('FileType', {
    desc = 'Turn on Spelling for Markdown Files',
    pattern = 'markdown',
    callback = function ()
        vim.cmd(":setlocal spell")
    end
})
