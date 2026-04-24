function SelectSqlScript()
    local scripts_dir = vim.fn.stdpath("config") .. "/lua/rick/utils/sql-scripts"
    print(scripts_dir)

    local scripts = vim.fn.glob(scripts_dir .. "/**/*.sql", true, true)
    if vim.tbl_isempty(scripts) then
        vim.notify("No SQL scripts found in " .. scripts_dir, vim.log.levels.WARN)
        return
    end

    vim.ui.select(scripts, {
        prompt = "Select a SQL script:",
        format_item = function(path)
            return vim.fn.fnamemodify(path, ":t")
        end,
    }, function(selected)
        if not selected then
            return;
        end

        local lines = vim.fn.readfile(selected)
        if #lines == 0 then
            return
        end

        vim.api.nvim_put(lines, "l", true, true)
    end)
end
