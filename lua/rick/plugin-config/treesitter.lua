local function GetParsers()
   return {
      'bash',
      'c_sharp',
      'css',
      'dockerfile',
      'editorconfig',
      'go',
      'html',
      'java',
      'javascript',
      'json',
      'lua',
      'markdown',
      'sql',
      'terraform',
      'typescript',
      'vue',
      'xml',
      'yaml',
  }
end

local function GetFileTypes()
    return {
        'Dockerfile',
        'cs',
        'css',
        'editorconfig',
        'go',
        'html',
        'java',
        'javascript',
        'json',
        'lua',
        'md',
        'sql',
        'tf',
        'typescipt',
        'vue',
        'xml',
        'yaml',
    }
end

local treesitter = require('nvim-treesitter')
treesitter.install(GetParsers())

vim.treesitter.language.register('xml', { 'xaml' })
vim.treesitter.language.register('yaml', { 'yml' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = GetFileTypes(),
  callback = function()
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[0][0].foldmethod = 'expr'
      vim.wo.foldlevel = 99
      vim.treesitter.start()
      vim.notify("Treesitter Started", vim.log.levels.INFO, { title = 'config' })
  end,
})
