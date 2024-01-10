return {
  "nvim-telescope/telescope.nvim",
  cond = not vim.g.started_by_firenvim,
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "folke/trouble.nvim",
  },
  cmd = {
    "Telescope",
  },
  keys = {
    {
      "<leader>f",
      desc = "Telescope",
    },

    -- file helpers
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fF",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "Find in buffer",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live grep",
    },
    {
      "<leader>fG",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Grep string",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Search buffers",
    },

    -- lsp/treesitter helpers
    {
      "<leader>fr",
      function()
        require("telescope.builtin").lsp_references()
      end,
      desc = "LSP references",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "LSP document symbols",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Diagnostics",
    },

    -- git helpers
    {
      "<leader>gf",
      function()
        require("telescope.builtin").git_files()
      end,
      desc = "Search git files",
    },
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Search git branches",
    },
    {
      "<leader>gc",
      function()
        require("telescope.builtin").git_commits()
      end,
      desc = "Search git commits",
    },
    {
      "<leader>gr",
      function()
        require("telescope.builtin").git_bcommits()
      end,
      desc = "Search git file commits",
    },

    -- util helpers
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Search help tags",
    },
    {
      "<leader>fk",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "Search keymaps",
    },
    {
      "<leader>fp",
      function()
        require("telescope.builtin").spell_suggest()
      end,
      desc = "Spell suggest",
    },
    {
      "<leader>fe",
      function()
        require("telescope.builtin").registers()
      end,
      desc = "Search registers",
    },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      path_display = { "truncate" },
      layout_config = {
        prompt_position = "top",
        mirror = true,
      },
      cache_picker = {
        num_pickers = 3,
      },
      file_ignore_patterns = {
        "%.a",
        "%.aac",
        "%.cache",
        "%.class",
        -- "%.gif",
        "%.git/",
        "%.mkv",
        "%.mp3",
        "%.mp4",
        "%.o",
        "%.out",
        "%.pdf",
        "%.wav",
        "%.zip",
        "./node%_modules/*",
        "mocks/*",
        "packer_compiled.lua",
      },
      vimgrep_arguments = {
        "rg",

        -- color codes not yet interpreted
        "--color=never",

        -- the following are required for telescope
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",

        "--hidden", -- include hidden files
        "--max-depth=99", -- max num dirs to descend
        "--smart-case", -- use smart case
      },
      preview = {
        mime_hook = function(filepath, bufnr, opts)
          local is_image = function(filepath)
            local image_extensions = { "png", "jpg" } -- Supported image formats
            local split_path = vim.split(filepath:lower(), ".", { plain = true })
            local extension = split_path[#split_path]
            return vim.tbl_contains(image_extensions, extension)
          end
          if is_image(filepath) then
            local term = vim.api.nvim_open_term(bufnr, {})
            local function send_output(_, data, _)
              for _, d in ipairs(data) do
                vim.api.nvim_chan_send(term, d .. "\r\n")
              end
            end
            vim.fn.jobstart({
              "catimg",
              filepath, -- Terminal image viewer command
            }, {
              on_stdout = send_output,
              stdout_buffered = true,
              pty = true,
            })
          else
            require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
          end
        end,
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      oldfiles = {
        cwd_only = true,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  },
  config = function(_, opts)
    local trouble = require("trouble.providers.telescope")
    opts.defaults.mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    }

    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    -- telescope.load_extension("fzy_native")

    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "TelescopePreviewerLoaded",
      callback = function()
        vim.opt_local.number = true
      end,
      desc = "Enable line numbers in telescope results",
    })
  end,
}
