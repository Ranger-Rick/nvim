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

vim.g.dotnet_errors_only = true
vim.g.dotnet_show_project_file = false
vim.o.spelllang = 'en_us'

vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>l', '<C-w>l')

function NMap(shortcut, func, desc)
    vim.keymap.set('n', shortcut, func, { desc = desc} )
end

NMap('<leader>ch', function() vim.cmd(':noh') end, '[C]lear [H]ighlight')
NMap('<leader>ee', function() vim.cmd(":Ex") end, 'Activate NetRw file explorer')
NMap('<leader>w', function() vim.cmd(":w") end, '[W]rite')
NMap('<leader>q', function() vim.cmd(":q") end, '[Q]uit')
NMap('<leader>FQ', function() vim.cmd(":q!") end, '[F]orce [Q]uit')
NMap('<leader>tn', function() vim.cmd(":tabn") end, '[T]ab [N]ext')
NMap('<leader>tp', function() vim.cmd(":tabp") end, '[Tab [P]revious')
NMap('<leader>cn', function() vim.cmd(":cnext") end, 'QuickFix [N]ext')
NMap('<leader>cp', function() vim.cmd(":cprev") end, 'QuickFix [P]rev')
NMap('<leader>co', function() vim.cmd(":copen") end, 'QuickFix [O]pen')
NMap('<leader>ck', function() vim.cmd(":cclose") end, 'QuickFix [C]lose')
