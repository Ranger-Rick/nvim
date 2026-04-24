vim.g.mapleader = " "

--require('rick.plugin-config.lazy-config')
require('rick.plugin-config.pack')
require('rick.plugin-config.mason-config')

-- Plugin Config
require('rick.plugin-config.nvimcmp')
require('rick.plugin-config.snacks')
require('rick.plugin-config.lua-snip')
require('rick.plugin-config.smear')
require('rick.plugin-config.treesitter')
require('rick.plugin-config.lspconfig-config')
require('rick.plugin-config.telescope-config')

-- Remaps
require('rick.remap')
require('rick.lsp-remap')

-- Utilities Config
require('rick.utils.colors')
require('rick.utils.vsautoinsert')
require('rick.utils.macro-autocmd')
require('rick.utils.macro-setspell')

require('rick.snippets.snippets')
