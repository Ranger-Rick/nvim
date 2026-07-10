local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Add my local nuget source to config files
-- <add key="Rick" value="/Users/rickbordelon/.nuget/"/>
ls.add_snippets("xml", {
    s({
        trig = "nuget",
        name = "Nuget Source",
        desc = "Add a NuGet Source pointed to local machine"
    }, {
        t("<add key=\"Rick\" value=\"/Users/rickbordelon/.nuget/\"/>")
    })
})

