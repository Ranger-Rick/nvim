local function GetParsers()
   return {
      'lua',
      'c_sharp',
      'vue',
      'typescript',
      'javascript',
      'css',
      'html',
      'markdown',
      'editorconfig',
      'bash',
      'sql',
      'go',
      'xml',
      'yaml',
      'dockerfile',
      'java',
  }
end

local function GetFileTypes()
    return {
        'lua',
        'cs',
        'vue',
        'ts',
        'js',
        'css',
        'html',
        'md',
        'editorconfig',
        'sql',
        'go',
        'xml',
        'yaml',
        'Dockerfile',
        'java'
    }
end

-- Treesitter just magically works in nvim 0.12? 
--local treesitter = require('nvim-treesitter')
--treesitter.setup()
--treesitter.install(GetParsers())

vim.treesitter.language.register('xml', { 'xaml' })
vim.treesitter.language.register('yaml', { 'yml' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = GetFileTypes(),
  callback = function()
      vim.treesitter.start()
        vim.notify(
            "Treesitter Started",
            vim.log.levels.INFO,
            { title = 'config' })
  end,
})
