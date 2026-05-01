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

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false

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
NMap('<leader>cd', function() vim.cmd(':Copilot disable') end, '[C]opilot [D]isable')
NMap('<leader>ce', function() vim.cmd(':Copilot enable') end, '[C]opilot [E]nable')
NMap('<leader>cm', function() vim.cmd(':Copilot panel') end, '[C]opilot Panel')

--dotnet template helper
require('rick.utils.dotnet-new')
NMap('<leader>dn', DotnetTemplate, '[D]otnet [N]ew template')

--[F]ormat [J]son
NMap('<leader>fj', function() vim.cmd(":%!jq '.'") end, '[F]ormat [J]son')

NMap('<leader>ch', function() vim.cmd(':noh') end, '[C]lear [H]ighlight')

--Use vim.ui.select to populate spelling suggestions
require('rick.utils.spell')

--Relative Number
NMap('<leader>er', function() vim.cmd(":set rnu") end, '[E]nable [R]elative number')
NMap('<leader>dr', function() vim.cmd(":set nornu") end, '[D]isable [R]elative number')

--File Explorer
NMap('<leader>ee', function() vim.cmd(":Ex") end, 'Activate NetRw file explorer')

--Save
NMap('<leader>w', function() vim.cmd(":w") end, '[W]rite')

--Quit
NMap('<leader>q', function() vim.cmd(":q") end, '[Q]uit')
NMap('<leader>FQ', function() vim.cmd(":q!") end, '[F]orce [Q]uit')

--Tabs
NMap('<leader>tn', function() vim.cmd(":tabn") end, '[T]ab [N]ext')
NMap('<leader>tp', function() vim.cmd(":tabp") end, '[Tab [P]revious')

--QuickFix
--C for QuickFix; K for Close :D
NMap('<leader>cn', function() vim.cmd(":cnext") end, 'QuickFix [N]ext')
NMap('<leader>cp', function() vim.cmd(":cprev") end, 'QuickFix [P]rev')
NMap('<leader>co', function() vim.cmd(":copen") end, 'QuickFix [O]pen')
NMap('<leader>ck', function() vim.cmd(":cclose") end, 'QuickFix [C]lose')

--Window Navigation
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>l', '<C-w>l')

--Copy to System Keyboard
NMap('<leader>y', '\"+yy', 'Yank current line to system clipboard')
vim.keymap.set('v', '<leader>y','\"+y', { desc = 'Yank selection to system clipboard'} )

-- Dadbod
vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_use_nvim_notify = 1
require("rick.utils.sql-scripts.select")
NMap('<leader>dl', SelectSqlScript, '[D]atabase Query [L]ist')

-- Snacks Notifier
NMap('<leader>snh', Snacks.notifier.show_history, 'Snacks Show History')

-- Telescope
------------
local builtin = require('telescope.builtin')
require('rick.utils.telescope-utils')

vim.keymap.set('v', '<leader>gs', builtin.grep_string)

NMap('<leader>sf', builtin.find_files, 'Telescope [S]earch [F]iles')
NMap('<leader>sg', builtin.git_files, 'Telescope [S]earch [G]it files')
NMap('<leader>sl', builtin.live_grep, '[S]earch [L]ive Grep')
NMap('<leader>gh', builtin.git_bcommits, '[G]it [H]istory')

--NMap('<leader>tl', builtin.treesitter, '[T]elescope [T]reesitter [L]ist Symbols')
--NMap('<leader>tm', function ()
--    builtin.treesitter(
--        { symbols = { "function", "method" } })
--end, '[T]elescope [T]reesitter [M]ethods')

-- Mako Repo
NMapTelescopeGit('el', 'src/Services/KeyCloak/redsail-keycloak-extensions/src/main/java/com')

local monoPaths = {
    'redsail/redsail-mobile-docs',
    'redsail/redsail-mobile-api',
    'redsail/redsail-mobile-apps',
    'redsail/redsail-mobile-spikes',
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

-- Mono Repo
for i, path in ipairs(monoPaths) do
   NMapTelescopeFiles(i .. 'l', path)
   NMapTelescopeLiveGrep(i .. 'sl', path)
   NMapExplore(i .. 'k', '/Users/rickbordelon/Documents/Projects/redsail-mobile-mono/' .. path)
   NMapBCommits('<leader>' .. i .. 'gh', path)
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
