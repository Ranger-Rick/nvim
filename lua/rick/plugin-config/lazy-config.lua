local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out, 'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	spec = {
        { 'sainnhe/gruvbox-material',                version = '11d779b', lazy = false, priority = 1000, },

        { 'onsails/lspkind.nvim',                    version = 'c7274c4' },
        { 'hrsh7th/cmp-nvim-lsp',                    version = 'cbc7b02' },
        { 'hrsh7th/cmp-path',                        version = 'c642487' },
        { 'hrsh7th/cmp-buffer',                      version = 'b74fab3' },
        { 'saadparwaiz1/cmp_luasnip',                version = '98d9cb5' },
        { 'hrsh7th/nvim-cmp',                        version = 'a1d5048', lazy = false, priority = 100, },

        { 'tpope/vim-dadbod',                        version = '6d1d41d' },
        { 'kristijanhusak/vim-dadbod-completion',    version = 'a8dac0b' },
        { 'kristijanhusak/vim-dadbod-ui',            version = '07e92e2' },

        { 'folke/snacks.nvim',                       version = 'v2.31.0', priority = 1000, lazy = false, },

        { 'williamboman/mason.nvim',                 version = 'v2.2.1' },
        { 'neovim/nvim-lspconfig',                   version = 'v2.8.0' },

        { 'rafamadriz/friendly-snippets',            version = '6cd7280' },
        { 'L3MON4D3/LuaSnip',                        version = 'v2.4.0' },

        { 'sphamba/smear-cursor.nvim',               version = 'c85bdbb' },

        { 'seblyng/roslyn.nvim',                     version = '946e559' },

        { 'github/copilot.vim',                      version = 'v1.59.0' },

        { 'nvim-lua/plenary.nvim',                   version = '74b06c6' },
        { 'nvim-telescope/telescope-ui-select.nvim', version = '6e51d7d' },
        { 'nvim-telescope/telescope.nvim',           version = 'v0.2.1', },

        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
            --commit = 'fcd51bbe9245aa9b79a3930ed9ac42e16e1cf33f',
            commit = '0f5b204603234a523fafa8f6b860fd36f80a23f6',
        },
	},
})
