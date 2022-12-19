local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- TODO: look into mappings for function and shift+function keys

-- QOL mapping to type commands without needing shift
map('n', ';', ':')
map('n', ':', ';')

-- faster save and quits
map('n', '<leader>w', ':w<cr>')
map('n', '<leader>q', ':q<cr>')

-- reselect text after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- easier navigation
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

-- easier undos
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '[', '[<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

map('n', 'Y', '$y') -- Y to behave like other capitals
map('x', '<leader>p', '"_dP') -- pasting without overwriting contents of the register

-- telescope
map('n', "<leader>ff", function() require('telescope.builtin').find_files() end, { silent = true })
map("n", "<leader>FF", function() require('telescope.builtin').current_buffer_fuzzy_find() end)
map("n", "<leader>fg", function() require('telescope.builtin').live_grep() end)
map("n", "<leader>fG", function() require('telescope.builtin').grep_string() end)
map("n", "<leader>fb", function() require('telescope.builtin').buffers() end)
map("n", "<leader>fh", function() require('telescope.builtin').help_tags() end)
map("n", "<leader>fH", function() require('telescope.builtin').highlights() end)
map("n", "<leader>fr", function() require('telescope.builtin').lsp_references() end)
map("n", "<leader>fs", function() require('telescope.builtin').lsp_document_symbols() end)
map("n", "<leader>ft", function() require('telescope.builtin').treesitter() end)
map("n", "<leader>fk", function() require('telescope.builtin').keymaps() end)
map("n", "<leader>gb", function() require('telescope.builtin').git_branches() end)
map("n", "<leader>gc", function() require('telescope.builtin').git_commits() end)
map("n", "<leader>bc", function() require('telescope.builtin').git_bcommits() end)
map("n", "<leader>rr", function() require('telescope.builtin').registers() end)
map("n", "<leader>dd", function() require('telescope.builtin').diagnostics() end)
map("n", "<leader>gw", function() require('telescope').extensions.git_worktree.git_worktrees() end)
map("n", "<leader>gW", function() require('telescope').extensions.git_worktree.create_git_worktree() end)

-- winshift
map("n", "<leader><leader>s", "<Cmd>WinShift<CR>")
map("n", "<C-S-h>", "<Cmd>WinShift left<CR>")
map("n", "<C-S-j>", "<Cmd>WinShift down<CR>")
map("n", "<C-S-k>", "<Cmd>WinShift up<CR>")
map("n", "<C-S-l>", "<Cmd>WinShift right<CR>")

-- lazygit
local toggletermTerm = require('toggleterm.terminal').Terminal
local lazygit  = toggletermTerm:new({
	cmd = "lazygit",
	hidden = true,
	direction = 'tab',
})
map("n", "<leader>gg", function() lazygit:toggle() end)


-- nvim tree
map('n', '<leader>t', function() require("nvim-tree").toggle() end)

-- cellular-automaton
map("n", "<leader>fml", function() require("cellular-automaton").start_animation("make_it_rain") end)

-- todo-comments
map('n', '<leader>dt', ':TodoTelescope<CR>')

-- aerial
map('n', '<leader><leader>o', '<Cmd>AerialToggle!<CR>', { silent = true })
map('v', '<leader><leader>o', '<Cmd>AerialToggle!<CR>', { silent = true })

-- barbar
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true })
map('n', '<Tab>', '<Cmd>BufferNext<CR>', { silent = true })
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { silent = true })
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { silent = true })
map('n', '<A-p>', '<Cmd>BufferPin<CR>', { silent = true })
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { silent = true })
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { silent = true })
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { silent = true })
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { silent = true })
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { silent = true })
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { silent = true })
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { silent = true })
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { silent = true })
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { silent = true })
map('n', '<A-0>', '<Cmd>BufferGoto 10<CR>', { silent = true })
map('v', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true })
map('v', '<Tab>', '<Cmd>BufferNext<CR>', { silent = true })
map('v', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { silent = true })
map('v', '<A->>', '<Cmd>BufferMoveNext<CR>', { silent = true })
map('v', '<A-p>', '<Cmd>BufferPin<CR>', { silent = true })
map('v', '<A-1>', '<Cmd>BufferGoto 1<CR>', { silent = true })
map('v', '<A-2>', '<Cmd>BufferGoto 2<CR>', { silent = true })
map('v', '<A-3>', '<Cmd>BufferGoto 3<CR>', { silent = true })
map('v', '<A-4>', '<Cmd>BufferGoto 4<CR>', { silent = true })
map('v', '<A-5>', '<Cmd>BufferGoto 5<CR>', { silent = true })
map('v', '<A-6>', '<Cmd>BufferGoto 6<CR>', { silent = true })
map('v', '<A-7>', '<Cmd>BufferGoto 7<CR>', { silent = true })
map('v', '<A-8>', '<Cmd>BufferGoto 8<CR>', { silent = true })
map('v', '<A-9>', '<Cmd>BufferGoto 9<CR>', { silent = true })
map('v', '<A-0>', '<Cmd>BufferGoto 10<CR>', { silent = true })
-- barbar browser like bindings
map('n', '<C-w>', '<Nop>', { silent = true }) -- unbind default
map('n', '<C-w>', '<Cmd>BufferClose<CR>', { silent = true })
map('n', '<C-S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true })
map('n', '<C-Tab>', '<Cmd>BufferNext<CR>', { silent = true })
map('v', '<C-w>', '<Nop>', { silent = true }) -- unbind default
map('v', '<C-w>', '<Cmd>BufferClose<CR>', { silent = true })
map('v', '<C-S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true })
map('v', '<C-Tab>', '<Cmd>BufferNext<CR>', { silent = true })
