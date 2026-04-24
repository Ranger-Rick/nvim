local defaultTheme = 'gruvbox-material'
--local defaultTheme = 'tokyonight'

function Colors(color)
    color = color or defaultTheme
	vim.cmd.colorscheme(color)
    LineNumberColors()
end

function EnableBlur()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function DisableBlur(color)
    Colors(color);
end

function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end

Colors()
