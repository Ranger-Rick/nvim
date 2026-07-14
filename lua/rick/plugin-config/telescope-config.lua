local function SelectVerticalRight(prompt_bufnr)
    local actions = require("telescope.actions")
    actions.select_vertical(prompt_bufnr)
    vim.cmd("wincmd L")
end

require("telescope").setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown()
        }
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
    defaults = {
        path_display = { 'truncate' },
        mappings = {
            i = {
                ["<C-h>"] = "select_vertical",
                ["<C-l>"] = SelectVerticalRight,
                ["<C-k>"] = "select_tab"
            }
        }
    }
})
require('telescope').load_extension("ui-select")
