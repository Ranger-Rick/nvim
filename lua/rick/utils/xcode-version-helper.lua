function ReplaceVersion(replaceKey, replaceValue)
    vim.cmd(':%s/\\v(' .. replaceKey .. '\\s\\=\\s)(.*);/\\1' .. replaceValue .. ';')
end

function AskForVersion(replaceKey)
    vim.ui.input(
        { prompt = replaceKey .. ': ' },
        function (replaceValue)
            ReplaceVersion(replaceKey, replaceValue)
        end
    )
end

function BundleAutoCommand(opts, replaceKey)
    if opts.args ~= '' then
        ReplaceVersion(replaceKey, opts.args)
        return
    end

    AskForVersion(replaceKey)
end

vim.api.nvim_create_user_command('BundleVersion', function (opts)
    BundleAutoCommand(opts, 'CURRENT_PROJECT_VERSION')
end, {
    desc = 'Update the BundleVersion',
    nargs = '?'
})

vim.api.nvim_create_user_command('BundleVersionShort', function (opts)
    BundleAutoCommand(opts, 'MARKETING_VERSION')
end, {
    desc = 'Update the BundleVersionShort',
    nargs = '?'
})
