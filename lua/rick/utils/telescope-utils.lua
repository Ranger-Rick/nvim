local builtin = require('telescope.builtin')

-- Find Git Files
function TelescopeGitFilesInDirectory(directory)
    builtin.git_files({
        git_command = {'git', 'ls-files', directory},
        prompt_title = 'Git Files in ' .. directory,
        results_title = 'Results in ' .. directory,
    })
end

-- Find Files
function TelescopeFindFilesInDirectory(directory)
    builtin.find_files({
        search_dirs = { directory },
        prompt_title = 'Find Files in ' .. directory,
        results_title = 'Results in ' .. directory,
    })
end

-- Live Grep
function TelescopeLiveGrepInDirectory(directory)
    builtin.live_grep({
        search_dirs = { directory },
        prompt_title = 'Live Grep in ' .. directory,
        results_title = 'Results in ' .. directory,
    })
end

function NMapTelescopeGit(shortcut, dir)
    vim.keymap.set('n', '<leader>' .. shortcut,
    function()
        TelescopeGitFilesInDirectory(dir)
    end,
    { desc = 'Search Git Files in the ' .. dir .. ' directory' })
end

function NMapTelescopeFiles(shortcut, dir)
    vim.keymap.set('n', '<leader>' .. shortcut,
    function()
        TelescopeFindFilesInDirectory(dir)
    end,
    { desc = 'Search Files in the ' .. dir .. ' directory' })
end

function NMapTelescopeLiveGrep(shortcut, dir)
    vim.keymap.set('n', '<leader>' .. shortcut,
    function()
        TelescopeLiveGrepInDirectory(dir)
    end,
    { desc = 'Live Grep in the ' .. dir .. ' directory' })
end

function NMapExplore(shortcut, dir)
    vim.keymap.set('n', '<leader>' .. shortcut,
    function ()
        vim.cmd(':Ex ' .. dir)
    end,
    { desc = 'Explore files in ' .. dir })
end

function NMapBCommits(shortcut, path)
    local title = '[G]it [H]istory in the ' .. path .. ' directory'

    NMap(
        shortcut,
        function ()
            builtin.git_bcommits({
                cwd = path,
                prompt_title = title
            })
        end,
        title
    )
end

