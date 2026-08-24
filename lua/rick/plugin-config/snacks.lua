local function selectDashboard()
    local dashboard = 'custom'
    local path = 'rick.plugin-config.dashboards.'

    local fullDashboardPath = path .. dashboard .. '-dashboard'
    local ok, output = pcall(require, fullDashboardPath)
    if not ok then
        output = require('rick.plugin-config.dashboards.default-dashboard')
    end

    if vim.o.columns > 120 then
        return output
    end

    local compactOk, compact = pcall(require, fullDashboardPath .. '-compact')
    if not compactOk then
        return output
    end

    output = compact

    return output;
end


local opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    --
    --bigfile = { enabled = true },
    dashboard = selectDashboard(),
    --explorer = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    --input = { enabled = true },
    --picker = { enabled = true },
    notifier = {
        enabled = true,
        timeout = 5000
    },
    --quickfile = { enabled = true },
    --scope = { enabled = true },
    scroll = { enabled = true },
    --statuscolumn = { enabled = true },
    --words = { enabled = true },
}

require('snacks').setup(opts)
