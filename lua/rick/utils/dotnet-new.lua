local function CreateDotnetTemplate(template, name, location)
    local command = "dotnet new " .. template .. " -n " .. name .. " -o " .. location
    vim.cmd("! " .. command)
    local file = location .. name .. ".cs"
    vim.cmd("e " .. file)
end

function DotnetTemplate()
    vim.ui.select(
        { "class", "interface" },
        { prompt = "Select a template to create:" },
        function (type)
            if not type then
                print("You must select a template")
                return;
            end

            vim.ui.input(
                { prompt = "Enter the " .. type .. " name: " },
                function (name)
                    if not name then
                        print("You must specify a name")
                        return
                    end

                    vim.ui.input(
                        { prompt = "Enter a directory: ", completion = "dir", default = vim.fn.getcwd() .. "/" },
                        function (dir)
                            if not dir then
                                print("You must specify a directory")
                                return
                            end
                            CreateDotnetTemplate(type, name, dir)
                        end
                    )
                end
            )
        end
    )
end
