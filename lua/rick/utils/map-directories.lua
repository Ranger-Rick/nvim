require('rick.utils.telescope-utils')

function MapDirs(dirs)
    for i, path in ipairs(dirs) do
        NMapTelescopeFiles(i .. 'l', path)
        NMapTelescopeLiveGrep(i .. 'sl', path)
        NMapExplore(i .. 'k', path)
        NMapBCommits('<leader>' .. i .. 'gh', path)
    end
end
