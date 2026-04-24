require("luasnip.loaders.from_vscode").lazy_load()

local ls = require("luasnip")

vim.keymap.set({'n', 's'}, '<C-n>', function()
    if ls.jumpable(1) then
        ls.jump(1)
    end
end)

vim.keymap.set({'n', 's'}, '<C-p>', function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end)
