local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

ls.add_snippets("cs", {
    s({
        trig = "seq",
        name = "Add Seq",
        desc = "Add local Seq logging to a Serilog configuration"
    }, {
        t(".AddSeq(\"http://"),

        f(function()
            local ip = vim.fn.system("ipconfig getifaddr en0")
            return ip:gsub("%s+$", "")  -- Trim trailing newline
        end),

        t(":5341\", useCertificateValidation: false)")
    })
})
