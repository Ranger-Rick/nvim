local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

local function DatadogMeta(level)
    return {
        trig = 'd' .. level,
        name = 'Datadog ' .. level,
        desc = 'Add an ' .. level .. ' Datadog log',
    }
end

local function DatadogLog(level)
    return s(DatadogMeta(level), {
        t('logger.' .. level .. '(\''),
        i(1, 'Message'),
        t('\', { action: ACTIONS.'),
        i(2, 'ACTION'),
        t(', logger: \''),
        i(3, 'logger'),
        t('\' });')
    })
end

local function DatadogError()
    local level = 'error'
    return s(DatadogMeta(level), {
        t('logger.' .. level .. '(\''),
        i(1, 'Error'),
        t('\', { action: ACTIONS.'),
        i(2, 'ACTION'),
        t(', logger: \''),
        i(3, 'logger'),
        t('\', }, '),
        i(4, 'err'),
        t(' instanceof Error ? '),
        rep(4),
        t(' : undefined);')
    })
end

local function VueLog()
    local snips = {
        DatadogLog('info'),
        DatadogLog('debug'),
        DatadogLog('warn'),
        DatadogError()
    }
    return snips
end

ls.add_snippets('vue', VueLog())
ls.add_snippets('javascript', VueLog())
ls.add_snippets('typescript', VueLog())
