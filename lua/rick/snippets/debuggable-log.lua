local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.add_snippets("cs", {
    -- Log a specific value for [D]ebugging
    s({
        trig = "dlog",
        name = "Debug Log",
        desc = "Add a Debug log"
    }, {
        t("Log.Logger.Information(\"The value of "),
        rep(1),
        t(" is: {DebuggablePropertyValue}\", "),
        i(1, "Property"),
        t(");")
    }),

    -- Add a log as a [H]ealth Check
    s({
        trig = "hlog",
        name = "Health Log",
        desc = "Add a Health Check Log"
    }, {
        t("Log.Logger.Information(\"Health Check Log: "),
        i(1, "LogIdentifier"),
        t("\");")
    })
})
