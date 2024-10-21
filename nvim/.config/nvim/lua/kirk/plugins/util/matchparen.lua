return {
  "monkoose/matchparen.nvim",
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  cmd = {
    "MatchParenDisable",
    "MatchParenEnable",
  },
  opts = {
    debounce_time = 10,
  },
  init = function()
    vim.g.loaded_matchparen = 1
  end,
}
