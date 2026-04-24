local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
    s("err", {
        t("if err != nil {"),
        t({"", "\t"}),
        i(1, "panic(err)"),
        t({"", ""}),
        t("}")
    })
})
