vim.filetype.add({
    filename = {
        ['docker-compose.yml'] = 'yaml.docker-compose',
        ['docker-compose.yaml'] = 'yaml.docker-compose',
        ['docker-compose-qa.yaml'] = 'yaml.docker-compose',
        ['rpn.yaml'] = 'yaml.docker-compose',
        ['compose.yml'] = 'yaml.docker-compose',
        ['compose.yaml'] = 'yaml.docker-compose',
    }
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

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

vim.lsp.config('lemminx', {
    filetypes = {
        "xml",
        "xaml",
        "svg"
    }
})

vim.lsp.config('jdtls', {
    settings = {
        java = {
        }
    }
})

vim.lsp.config('terraformls', {
    filetypes = {
        'tf',
        'terraform',
        'terraform-vars'
    }
})


vim.lsp.enable('bashls')
vim.lsp.enable('docker_compose_language_service')
vim.lsp.enable('dockerls')
vim.lsp.enable('eslint')
vim.lsp.enable('gopls')
vim.lsp.enable('jdtls')
vim.lsp.enable('jsonls')
vim.lsp.enable('lemminx')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('roslyn')
vim.lsp.enable('terraformls')
