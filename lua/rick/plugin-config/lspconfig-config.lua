vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
vim.lsp.enable('lua_ls')

require('rick.plugin-config.lsp-configs.vue-config')

vim.lsp.config("roslyn", {
    on_attach = function ()
        print("Attached Roslyn Server!")
    end,
    settings = {
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true
        }
    }
})
vim.lsp.enable('roslyn')

vim.lsp.config('lemminx', {
    filetypes = {
        "xml",
        "xaml",
        "svg"
    }
})
vim.lsp.enable('lemminx')

vim.lsp.config('jdtls', {
    settings = {
        java = {
        }
    }
})
vim.lsp.enable('jdtls')

vim.lsp.enable('bashls')
vim.lsp.enable('dockerls')
vim.lsp.enable('docker_compose_language_service')
vim.lsp.enable('pyright')
vim.lsp.enable('jsonls')
vim.lsp.enable('gopls')
vim.lsp.enable('eslint')
vim.lsp.enable('terraform-ls')
