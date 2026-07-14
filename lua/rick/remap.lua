--General Remap
---------------

vim.g.mapleader = " "

vim.o.signcolumn = 'yes'

vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.scrolloff = 8
vim.o.expandtab = true
vim.o.cmdheight = 0

vim.o.hlsearch = true
vim.o.incsearch = true

--vim.o.spell = true
vim.o.spelllang = 'en_us'

vim.g.dotnet_errors_only = true
vim.g.dotnet_show_project_file = false

-- Enable diagnostic messages
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true
})

function NMap(shortcut, func, desc)
    vim.keymap.set('n', shortcut, func, { desc = desc} )
end

-- Copilot (disabled by default)
--vim.cmd(':Copilot disable')
NMap('<leader>cd', function() vim.cmd(':Copilot disable') end, 'Copilot Disable')
NMap('<leader>ce', function() vim.cmd(':Copilot enable') end, 'Copilot Enable')
NMap('<leader>cm', function() vim.cmd(':Copilot panel') end, 'Copilot Panel')

--dotnet helpers
require('rick.utils.dotnet-new')
require('rick.utils.dotnet-restore')
NMap('<leader>dn', DotnetTemplate, 'Dotnet New template')
NMap('<leader>dr', DotnetRestoreLegacyMonoRepo, 'Dotnet Restore')

--Format Json
NMap('<leader>fj', function() vim.cmd(":%!jq '.'") end, 'Format Json')

NMap('<leader>ch', function() vim.cmd(':noh') end, 'Clear Highlight')

--Use vim.ui.select to populate spelling suggestions
require('rick.utils.spell')

--Files
NMap('<leader>e', function() vim.cmd(":Ex") end, 'Activate NetRw file explorer')
vim.keymap.set('n', 'gnf', '<C-w>gf')

--Save
NMap('<leader>w', function() vim.cmd(":w") end, 'Write')

--Quit
NMap('<leader>q', function() vim.cmd(":q") end, 'Quit')
NMap('<leader>fq', function() vim.cmd(":q!") end, 'Force Quit a single file')
NMap('<leader>FQ', function() vim.cmd(":qall!") end, 'Force Quit')

--Tabs
NMap('<leader>tn', function() vim.cmd(":tabn") end, 'Tab Next')
NMap('<leader>tp', function() vim.cmd(":tabp") end, '[Tab Previous')

--QuickFix
--C for QuickFix; K for Close :D
NMap('<leader>cn', function() vim.cmd(":cnext") end, 'QuickFix Next')
NMap('<leader>cp', function() vim.cmd(":cprev") end, 'QuickFix Prev')
NMap('<leader>co', function() vim.cmd(":copen") end, 'QuickFix Open')
NMap('<leader>ck', function() vim.cmd(":cclose") end, 'QuickFix Close')

--Window Navigation
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>l', '<C-w>l')

--Copy to System Keyboard
NMap('<leader>y', '\"+yy', 'Yank current line to system clipboard')
vim.keymap.set('v', '<leader>y','\"+y', { desc = 'Yank selection to system clipboard'} )

--Swap true/false values
NMap('<C-s>', function ()
    vim.cmd(":s/\\v(true|false)/\\=submatch(0) ==# 'true' ? 'false' : 'true'/")
    vim.cmd(':noh')
end, 'Swap true/false values')

-- Dadbod
vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_use_nvim_notify = 1
require("rick.utils.sql-scripts.select")
NMap('<leader>dl', SelectSqlScript, 'Database Query List')

-- Snacks Notifier
NMap('<leader>snh', Snacks.notifier.show_history, 'Snacks Show History')

-- Telescope
------------
local builtin = require('telescope.builtin')
require('rick.utils.telescope-utils')

vim.keymap.set('v', '<leader>gs', builtin.grep_string)

NMap('<leader>sf', builtin.find_files, 'Telescope Search Files')
NMap('<leader>sg', builtin.git_files, 'Telescope Search Git files')
NMap('<leader>sl', builtin.live_grep, 'Search Live Grep')
NMap('<leader>gh', builtin.git_bcommits, 'Git History')

NMap('<leader>tl', builtin.treesitter, 'Telescope Treesitter List Symbols')
NMap('<leader>tm', function ()
    builtin.treesitter(
        {
            prompt_title = 'Treesitter Functions / Methods',
            symbols = { 'function', 'method' }
        })
end, 'Telescope Treesitter Methods')

local monoPaths = {
    'redsail/redsail-mobile-docs',
    'redsail/redsail-mobile-api',
    'redsail/redsail-mobile-apps',
    'redsail/redsail-cash-rounding',
    'redsail/redsail-mobile-kb',
    'redsail/pms/pioneerrx/PioneerPharmacySystemDbSql',

}

local legacyPaths = {
    'legacy/PioneerRx.Mobile.Api',
    'legacy/PioneerRx.Mobile.Apps/Delivery',
    'legacy/PioneerRx.Mobile.Apps/DriveThru',
    'legacy/PioneerRx.Mobile.Apps/Inventory',
    'legacy/PioneerRx.Mobile.Apps/Library'
}

local rxlocalPaths = {
    'src/RxLocal.Patient/webapi',
    'src/RxLocal.Patient/vueapp',
    'src/RxLocal',
    'src/PipelineTemplates',
}

for i, path in ipairs(rxlocalPaths) do
    NMapTelescopeFiles(i .. 'l', path)
    NMapTelescopeLiveGrep(i .. 'sl', path)
    NMapExplore(i .. 'k', path)
    NMapBCommits('<leader>' .. i .. 'gh', path)
end

-- Mono Repo
for i, path in ipairs(monoPaths) do
    NMapTelescopeFiles('n' .. i .. 'l', path)
    NMapTelescopeLiveGrep('n' .. i .. 'sl', path)
    NMapExplore('n' .. i .. 'k', '/Users/rickbordelon/Documents/Projects/redsail-mobile-mono/' .. path)
    NMapBCommits('<leader>n' .. i .. 'gh', path)
end

-- Legacy Mono Repo
NMapTelescopeFiles('ml', 'legacy/PioneerRx.Mobile.Apps')
NMapTelescopeLiveGrep('msl', 'legacy/PioneerRx.Mobile.Apps')

for i, path in ipairs(legacyPaths) do
    NMapTelescopeFiles('m' .. i .. 'l', path)
    NMapTelescopeLiveGrep('m' .. i .. 'sl', path)
    NMapExplore('m' .. i .. 'k', '/Users/rickbordelon/Documents/Projects/redsail-mobile-mono/' .. path)

    local gitRoot = 'legacy/PioneerRx.Mobile.Apps'
    if path == 'legacy/PioneerRx.Mobile.Api' then
        gitRoot = path
    end

    local shortcut = '<leader>m' .. i .. 'gh'
    NMapBCommits(shortcut, gitRoot)
end
