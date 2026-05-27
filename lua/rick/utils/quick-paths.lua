function QuickPaths()
    local paths = {
        { key = 'Nuget', value = '~/.nuget/NuGet/NuGet.Config' },
        { key = 'Tmux', value = '~/.tmux.conf' },
        { key = 'Bash', value = '~/.zshrc' },
        { key = 'Opencode', value = '~/.config/opencode/opencode.json' },
    }

    vim.ui.select(paths, {
        prompt = 'Select a path',
        format_item = function (path)
            return path.key;
        end
    }, function (selected)
        vim.cmd(':tabe ' .. selected.value)
    end)
end
