local opt = vim.opt
local g = vim.g

g.mapleader = " " -- prefix key
g.maplocalleader = " " -- secondary prefix key

g.timeout = true
g.ttimeout = true
g.timeoutlen = 100
g.ttimeoutlen = 100

-- disable builtin plugins
local disabled_plugins = {
  "2html_plugin",
  "bugreport",
  "compiler",
  "ftplugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  -- "matchbracket",
  -- "matchit",
  -- "matchparen",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "optwin",
  "rplugin",
  "rrhelper",
  "spellfile_plugin",
  "synmenu",
  "tar",
  "tarPlugin",
  "tutor",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}
for _, v in pairs(disabled_plugins) do
  g["loaded_" .. v] = true
end

-- enable builtin plugins
local enabled_plugins = {
  "matchbracket",
  "matchparen",
  "node_provider",
  "perl_provider",
}
for _, v in pairs(enabled_plugins) do
  g["loaded_" .. v] = false
end

-- neovide
if g.neovide then
  vim.o.guifont = "ComicCodeLigatures Nerd Font:h12"
  g.neovide_input_macos_alt_is_meta = true
  g.neovide_input_macos_alt_is_meta = true
  g.neovide_refresh_rate = 60
  g.neovide_refresh_rate_idle = 5
  g.neovide_remember_window_size = false
end

opt.wildignore:append({
  "*.aux",
  "*.bbl",
  "*.blg",
  "*.cls",
  "*.fdb",
  "*.fdb_latexmk",
  "*.fls",
  "*.glo",
  "*.ist",
  "*.log",
  "*.o",
  "*.out",
  "*.pyc",
  "*.toc",
  "*pycache*",
  "*~",
  "Cargo.Bazel.lock",
  "Cargo.lock",
  "__pycache__",
  "__site",
  "**/node_modules/**",
  "target",
  "venv",
})

opt.title = true

opt.spell = true
opt.spelllang = { "en_us" }
vim.cmd([[highlight SpellBad cterm=undercurl ctermfg=247 gui=undercurl guifg=NONE]])
vim.cmd([[highlight SpellCap cterm=undercurl ctermfg=247 gui=undercurl guifg=NONE]])
vim.cmd([[highlight SpellRare cterm=undercurl ctermfg=247 gui=undercurl guifg=NONE]])
vim.cmd([[highlight SpellLocal cterm=undercurl ctermfg=247 gui=undercurl guifg=NONE]])

opt.number = true -- show line numbers
opt.relativenumber = true -- show relative line numbers
opt.cursorline = true -- highlight the current line
opt.termguicolors = true -- allow custom highlighting
opt.incsearch = true -- highlight matches as you type
opt.hlsearch = false -- unhighlight matches after searching
opt.autoindent = true -- new lines inherit indenting
opt.wrap = false -- don't wrap lines
opt.linebreak = true -- if wrapping, wrap on complete words
opt.breakindent = true -- preserve indenting on wrapped lines
opt.lazyredraw = true -- redraw only when needed

opt.visualbell = false
opt.errorbells = true
opt.belloff = "esc"

opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

opt.syntax = "enable" -- show syntax highlighting
opt.showmatch = true -- highlight matching brackets
opt.scrolloff = 4 -- scroll when y away from vertical edge
-- opt.smoothscroll = true -- doesn't work for some reason
opt.sidescrolloff = 8 -- scroll when x away from horizontal edge
opt.signcolumn = "yes" -- column for linting
opt.colorcolumn = "80" -- show line for 80char soft-limit

opt.tabstop = 4 -- number of visual spaces per tab
opt.softtabstop = 4 -- number of spaces in tab when editing
opt.shiftwidth = 4 -- number of spaces when indenting with <> keys

opt.mouse = "a" -- enable mouse for scrolling and resizing
opt.mousehide = true
opt.mousemodel = "extend" -- don't show right click menu
opt.mousemoveevent = true
opt.mousescroll = "ver:3,hor:3"
-- opt.mousesshape = "vs:lrsizing"

opt.nrformats = "alpha,octal,hex,bin"

opt.wildmenu = true -- visual autocompletion for command menu
opt.wildmode = { "full", "list", "longest" }

opt.list = true -- enable rendering of listchars
opt.listchars:append({
  extends = "…",
  lead = " ",
  precedes = "…",
  tab = "  ", -- this must be two characters
  trail = "▒",

  -- use the below line to simulate indent-blankline
  --	it won't be visible on empty-lines though
  -- leadmultispace = "│ ",
  -- multispace     = "│ ",
  -- tab            = "│ ", -- this must be two characters
})
opt.fillchars:append({
  eob = " ",
  diff = "╱",

  -- folds
  fold = " ",
  foldclose = "󰅂",
  foldopen = "󰅀",
  foldsep = "",

  -- win separator
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
})

-- short messages
vim.opt.shortmess:append("IWsA")

opt.swapfile = false -- don't create swap files

opt.splitright = true --  splits open to the right
opt.splitbelow = true --  splits open below
opt.splitkeep = "topline" -- keep topline on split resizing

-- NOTE: this isn't backwards compatible. it still requires the user to press
-- enter for empty messages. don't restore this comment until that issue is fixed
-- opt.cmdheight = 0 -- hide the command line

opt.undofile = true -- persistent undos
opt.confirm = true -- show confirm dialog when closing unsaved files

opt.laststatus = 3 -- aesthetic win separators

opt.completeopt = { "menu", "menuone", "noselect" }

if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep"
  vim.opt.grepformat = "%f:%l:%c:%m"
end

-- TODO: is this even necessary
if vim.env.TERM == "xterm-kitty" then
  vim.cmd([[autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>1u") | endif]])
  vim.cmd([[autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[<1u") | endif]])
end

-- vim.cmd([[highlight FoldColumn guibg=darkgrey guifg=white]])
