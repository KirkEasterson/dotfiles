local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, buffer = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

autocmd({ "FileType" }, {
	desc = "Enable wrapping and easy-undo for text, markdown, and tex files",
	pattern = { "markdown", "tex", "text" },
	callback = function()
		vim.opt_local.wrap = true

		-- easier undos
		map("i", ",", ",<c-g>u")
		map("i", ".", ".<c-g>u")
		map("i", "[", "[<c-g>u")
		map("i", "!", "!<c-g>u")
		map("i", "?", "?<c-g>u")
	end,
})

autocmd({ "BufWritePre" }, {
	desc = "Remove trailing-space",
	pattern = { "*" },
	callback = function()
		if vim.bo.filetype == "markdown" then
			return -- trailing space in md is a newline
		end
		if not not vim.g.started_by_firenvim then
			return -- it will save on keypress, so this autocmd is annoying
		end
		vim.cmd([[%s/\s\+$//e]])
	end,
})

autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = augroup("highlight_yank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 700,
		})
	end,
})

-- TODO: make this less hacky
autocmd("BufwritePost", {
	desc = "Build notes",
	pattern = "*note-*.md",
	callback = function()
		os.execute("~/scripts/build_notes.sh " .. vim.fn.expand("%%"))
	end,
})

autocmd("FileType", {
	desc = "Set indenting to js/ts files",
	pattern = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"markdown",
	},
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.tabstop = 2
	end,
})

autocmd("TermOpen", {
	desc = "Start terminal in insert mode",
	callback = function()
		local wininfo = vim.api.nvim_buf_get_name(0)
		if wininfo == nil or wininfo == "" then
			return
		end

		-- ignore putput panels
		local ignore = {
			"Neotest Output Panel",
		}
		for _, v in pairs(ignore) do
			if string.find(wininfo, v) then
				return
			end
		end

		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.cmd("startinsert!")
	end,
})

autocmd("FileType", {
	desc = "Start git commits in insert mode",
	pattern = { "gitcommit", "gitrebase" },
	command = "startinsert | 1",
})

-- sync neovim with system clipboard
autocmd({ "BufReadPost", "BufNewFile" }, {
	desc = "Sync system clipboard with neovim",
	once = true,
	callback = function()
		require("kirk.utils.uname")
		if IS_LINUX or IS_WSL then
			if vim.fn.executable("xclip") == 1 then
				vim.g.clipboard = {
					copy = {
						["+"] = "xclip -selection clipboard",
						["*"] = "xclip -selection clipboard",
					},
					paste = {
						["+"] = "xclip -selection clipboard -o",
						["*"] = "xclip -selection clipboard -o",
					},
				}
			elseif vim.fn.executable("xsel") == 1 then
				vim.g.clipboard = {
					copy = {
						["+"] = "xsel --clipboard --input",
						["*"] = "xsel --clipboard --input",
					},
					paste = {
						["+"] = "xsel --clipboard --output",
						["*"] = "xsel --clipboard --output",
					},
				}
			end
		elseif IS_MAC then
			vim.g.clipboard = {
				copy = {
					["+"] = "pbcopy",
					["*"] = "pbcopy",
				},
				paste = {
					["+"] = "pbpaste",
					["*"] = "pbpaste",
				},
			}
		elseif IS_WINDOWS then
			vim.g.clipboard = {
				copy = {
					["+"] = "win32yank.exe -i --crlf",
					["*"] = "win32yank.exe -i --crlf",
				},
				paste = {
					["+"] = "win32yank.exe -o --lf",
					["*"] = "win32yank.exe -o --lf",
				},
			}
		end

		vim.opt.clipboard = "unnamedplus"
	end,
})
