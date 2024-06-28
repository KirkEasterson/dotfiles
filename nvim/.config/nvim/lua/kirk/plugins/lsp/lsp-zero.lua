-- TODO:: remove <C-w>d and <C-w><C-d> mapping for diagnostics under cursor
return {
  "VonHeikemen/lsp-zero.nvim",
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- "jose-elias-alvarez/null-ls.nvim",
    -- "jay-babu/mason-null-ls.nvim",

    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "LspInstall",
    "LspUninstall",
    "LspZeroFormat",
    "LspZeroSetupServers",
    "LspZeroWorkspaceAdd",
    "LspZeroWorkspaceList",
    "LspZeroWorkspaceRemove",
  },
  keys = {
    -- -- https://github.com/VonHeikemen/lsp-zero.nvim#keybindings
    -- { "K",    desc = "Hover info" },
    -- { "gd",   desc = "Definition" },
    -- { "gD",   desc = "Decleration" },
    -- { "gi",   desc = "List implementations" },
    -- { "go",   desc = "Type definition" },
    -- { "gr",   desc = "List references" },
    -- { "gs",   desc = "Display signature" },
    -- { "<F2>", desc = "Rename" },
    -- { "<F3>", desc = "Format" },
    -- { "<F4>", desc = "Code actions" },
    -- { "gl",   desc = "Show diagnostics" },
    -- { "[d",   desc = "Previous diagnostic" },
    -- { "]d",   desc = "Next diagnostic" },
  },
  opts = {},
  config = function(_, opts)
    local lsp_zero = require("lsp-zero")

    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "ansiblels",
        "bashls",
        "clangd",
        "cmake",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "golangci_lint_ls",
        "gopls",
        "html",
        "jsonls",
        "lemminx", -- xml
        "lua_ls",
        "omnisharp",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "taplo", -- toml
        "terraformls",
        "tflint",
        "tsserver",
        "vimls",
        "yamlls",
        -- "asm_lsp", -- assembly
        -- "csharp_ls",
        -- "diagnosticls",
        -- "fsautocomplete",
        -- "hls", -- haskell
        -- "jdtls", -- java
        -- "kotlin_language_server",
        -- "ocamllsp",
        -- "rnix", -- nix
        -- "texlab",
        -- "zls", -- zig
      },
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls({
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                workspace = {
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                },
              },
            },
          }))
        end,
      },
    })

    local on_attach = function(client, bufnr)
      lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false,
      })

      -- -- for ufo folding
      -- client.server_capabilities.textDocument = {
      --   foldingRange = {
      --     dynamicRegistration = false,
      --     lineFoldingOnly = true,
      --   },
      -- }
    end

    lsp_zero.on_attach(on_attach)

    lsp_zero.configure("omnisharp", {
      -- handlers = {
      -- 	["textDocument/definition"] = require("omnisharp_extended").handler,
      -- },
      on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
        on_attach(client, bufnr)
      end,
      cmd = {
        "omnisharp",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid()),
      },
      enable_import_completion = true,
      organize_imports_on_format = true,
    })

    lsp_zero.configure("gopls", {
      settings = {
        gopls = {
          env = {
            GOFLAGS = "-tags=windows,linux,unittest,e2e",
          },
          -- buildFlags = { "-tags=windows,linux,unittest,e2e" },
        },
      },
    })

    lsp_zero.set_sign_icons({
      error = "󰅘",
      hint = "󰌶",
      info = "",
      warn = "",
    })

    -- semantic tokens should be less than treesitter
    vim.highlight.priorities.semantic_tokens = 95

    lsp_zero.setup()
  end,
}
