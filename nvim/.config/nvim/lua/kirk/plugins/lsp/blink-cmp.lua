return {
  "saghen/blink.cmp",
  enabled = false,
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  opts = {
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    nerd_font_variant = "normal",
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    trigger = {
      signature_help = {
        enabled = true,
      },
    },
  },
}
