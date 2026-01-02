-- colors/grayzone.lua
-- Minimal grayscale colorscheme with red-only errors

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "grayzone"

local set = vim.api.nvim_set_hl

local colors = {
	dark = {
		bg   = 0,
		fg   = 15,
		dim  = 7,
		hi   = 8,
		red  = 1,
	},
	light = {
		bg   = 15,
		fg   = 0,
		dim  = 8,
		hi   = 7,
		red  = 1,
	}
}

local function set_theme()
	local c = colors[vim.o.background]

	----------------------------------------------------------------
	-- Core UI
	----------------------------------------------------------------

	set(0, "Normal",       { ctermfg = c.fg, ctermbg = c.bg })
	set(0, "NormalNC",     { ctermfg = c.fg, ctermbg = c.bg })
	set(0, "NormalFloat",  { ctermfg = c.fg, ctermbg = c.bg })

	set(0, "CursorLine",   { ctermbg = c.bg })
	set(0, "CursorColumn", { ctermbg = c.bg })
	set(0, "ColorColumn",  { ctermbg = c.bg })

	set(0, "Visual",       { reverse = true })
	set(0, "Search",       { reverse = true })
	set(0, "IncSearch",    { reverse = true })

	set(0, "LineNr",       { ctermfg = c.fg })
	set(0, "CursorLineNr", { ctermfg = c.fg, bold = true })

	set(0, "VertSplit",    { ctermfg = c.border })
	set(0, "WinSeparator", { ctermfg = c.border })

	set(0, "StatusLine",   { ctermfg = c.fg, ctermbg = c.bg })
	set(0, "StatusLineNC", { ctermfg = c.fg, ctermbg = c.bg })

	set(0, "Pmenu",        { ctermfg = c.fg, ctermbg = c.bg })
	set(0, "PmenuSel",     { ctermfg = c.bg, bg = c.fg })
	set(0, "PmenuSbar",    { ctermbg = c.bg })
	set(0, "PmenuThumb",   { ctermbg = c.fg })

	set(0, "FloatBorder",  { ctermfg = c.border })


	----------------------------------------------------------------
	-- Text / syntax (grayscale contrast, not color)
	----------------------------------------------------------------

	set(0, "Comment", 	{ ctermfg = c.hi, italic = true })
	set(0, "Constant",     { ctermfg = c.fg })
	set(0, "String",       { ctermfg = c.dim })
	set(0, "Character",    { ctermfg = c.fg })
	set(0, "Number",       { ctermfg = c.fg })
	set(0, "Boolean",      { ctermfg = c.fg })

	set(0, "Identifier",   { ctermfg = c.fg })
	set(0, "Function",     { ctermfg = c.fg, bold = true })

	set(0, "Statement",    { ctermfg = c.fg, italic = true })
	set(0, "Keyword", { italic = true })
	set(0, "Conditional",  { ctermfg = c.fg, italic = true })
	set(0, "Repeat",       { ctermfg = c.fg, italic = true })

	set(0, "Type",         { bold = true, italic = true })
	set(0, "Typedef",      { ctermfg = c.fg })
	set(0, "Structure",    { bold = true, italic = true })

	set(0, "Special",      { ctermfg = c.dim })
	set(0, "PreProc",      { ctermfg = c.fg })

	set(0, "Todo", { bold = true, underline = true })


	----------------------------------------------------------------
	-- Treesitter (grayscale hierarchy)
	----------------------------------------------------------------

	set(0, "@comment",   { link = "Comment" })
	set(0, "@keyword",   { link = "Keyword" })
	set(0, "@function",  { link = "Function" })
	set(0, "@string",    { link = "String" })
	set(0, "@type",      { link = "Type" })

	set(0, "@number",       { ctermfg = c.fg })
	set(0, "@boolean",      { ctermfg = c.fg })

	set(0, "@keyword.return", { ctermfg = c.fg, bold = true, italic = true })
	set(0, "@conditional",  { ctermfg = c.fg, bold = true })
	set(0, "@repeat",       { ctermfg = c.fg, bold = true })

	set(0, "@function.call",    { link = "Function" })
	set(0, "@function.builtin", { link = "Function" })
	set(0, "@function.method",  { link = "Function" })

	set(0, "@type.builtin", { ctermfg = c.fg, italic = true })

	set(0, "@variable",     { ctermfg = c.fg })
	set(0, "@variable.builtin", { ctermfg = c.fg, italic = true, underline = true })

	set(0, "@parameter",    { ctermfg = c.fg })
	set(0, "@property",     { ctermfg = c.fg })


	----------------------------------------------------------------
	-- Diagnostics (RED ONLY for errors)
	----------------------------------------------------------------
	set(0, "DiagnosticError", { ctermfg = c.red, bold = true })
	set(0, "DiagnosticWarn",  { ctermfg = c.fg })
	set(0, "DiagnosticInfo",  { ctermfg = c.fg })
	set(0, "DiagnosticHint",  { ctermfg = c.fg })

	set(0, "DiagnosticVirtualTextError", { ctermfg = c.red })
	set(0, "DiagnosticVirtualTextWarn",  { ctermfg = c.fg })
	set(0, "DiagnosticVirtualTextInfo",  { ctermfg = c.fg })
	set(0, "DiagnosticVirtualTextHint",  { ctermfg = c.fg })

	set(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red })
	set(0, "DiagnosticUnderlineWarn",  { underline = true })
	set(0, "DiagnosticUnderlineInfo",  { underline = true })
	set(0, "DiagnosticUnderlineHint",  { underline = true })

	----------------------------------------------------------------
	-- Diff / Git (grayscale only)
	----------------------------------------------------------------
	set(0, "DiffAdd",    { ctermbg = c.bg })
	set(0, "DiffChange", { ctermbg = c.bg })
	set(0, "DiffDelete", { ctermfg = c.fg, ctermbg = c.bg })
	set(0, "DiffText",   { ctermbg = c.bg, bold = true })

	----------------------------------------------------------------
	-- Messages / errors
	----------------------------------------------------------------
	set(0, "ErrorMsg",   { ctermfg = c.red, bold = true })
	set(0, "WarningMsg", { ctermfg = c.fg })
end

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		set_theme()
	end,
})

set_theme()
