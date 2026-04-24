local function LspRemap(shortcut, buf, func, desc)
    local opts = {
        buffer = buf,
        desc = desc
    }
    vim.keymap.set('n', shortcut, func, opts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client then
        vim.notify(
            "LSP Attached: " .. client.name,
            vim.log.levels.INFO,
            { title = 'config' })
    else
        vim.notify(
            "LSP Attached",
            vim.log.levels.INFO,
            { title = 'config' })
    end

    if client and client.name == "roslyn" then
        SetupDocumentationCommentShortcut(event)
    end

    LspRemap('K', event.buf, vim.lsp.buf.hover, 'Lsp Hover')

    LspRemap('gd', event.buf, vim.lsp.buf.definition, 'Lsp Go to Definition')
    LspRemap('gnd', event.buf, function()
        vim.cmd(':tab split')
        vim.lsp.buf.definition()
    end, 'Lsp Go to Definition in New Tab')

    LspRemap('gi', event.buf, vim.lsp.buf.implementation, 'Lsp Go to Implementation')
    LspRemap('gni', event.buf, function()
        vim.cmd(':tab split')
        vim.lsp.buf.implementation()
    end, 'Lsp Go to Implementation in New Tab')


    local builtin = require('telescope.builtin')
    LspRemap('gr', event.buf, builtin.lsp_references, 'Lsp Get References')
    LspRemap('<F2>', event.buf, vim.lsp.buf.rename, 'Lsp Rename')
    LspRemap('<leader>cl', event.buf, vim.lsp.codelens.refresh, 'Lsp Refresh Code Lens')
    LspRemap('<leader>ckl', event.buf, vim.lsp.codelens.clear, 'Lsp Clear Code Lens')

    LspRemap('gD', event.buf, vim.lsp.buf.declaration, 'Lsp Go to Declaration')
    LspRemap('go', event.buf, vim.lsp.buf.type_definition, 'Lsp Type Definition')
    LspRemap('gs', event.buf, vim.lsp.buf.signature_help, 'Lsp Signature Help')
    LspRemap('<leader>si', event.buf, function() vim.cmd(':LspInfo') end, 'Show Lsp Info')
    LspRemap('<leader>so', event.buf, function() vim.cmd(':LspLog') end, 'Show Lsp Log')

    LspRemap('<leader>ih', event.buf, function ()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, 'Lsp Toggle Inlay Hints')

    LspRemap('<leader>C', event.buf, function ()
        local message = vim.inspect(vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 }))
        --vim.notify(message)
        vim.api.nvim_echo({{ message, "ModeMsg" }}, true, {})
    end, 'Lsp Display Error Code')

    LspRemap('<leader>.', event.buf, function()
        vim.lsp.buf.code_action()
    end, 'Lsp Code Action')
  end
})
