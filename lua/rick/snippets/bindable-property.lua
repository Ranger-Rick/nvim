local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep

ls.add_snippets("cs", {
    s("bind", {
        t("public static readonly BindableProperty "),
        i(1, "PropertyName"),
        t("Property = BindableProperty.Create("),

        t({"", "\t"}),
        t("nameof("),
        rep(1),
        t("),"),

        t({"", "\t"}),
        t("typeof("),
        i(2, "Type"),
        t("),"),

        t({"", "\t"}),
        t("typeof("),
        f(function()
            return vim.fn.expand("%:t:r")
        end),
        t("));"),

        t({"", "", ""}),

        t("public "),
        rep(2),
        t(" "),
        rep(1),

        t({"", "{", "\t"}),
        t("get => ("),
        rep(2),
        t(")GetValue("),
        rep(1),
        t("Property);"),

        t({"", "\t"}),
        t("set => SetValue("),
        rep(1),
        t("Property, value);"),

        t({"", "}"})
    })
})
