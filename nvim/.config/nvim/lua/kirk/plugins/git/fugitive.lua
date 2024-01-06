return {
  "tpope/vim-fugitive",
  cond = not vim.g.started_by_firenvim,
  enabled = false,
  cmd = {
    "G",
    "GBrowse",
    "GDelete",
    "GMove",
    "GRemove",
    "GRename",
    "Gclog",
    "Gdiffsplit",
    "Gedit",
    "Ggrep",
    "Ghdiffsplit",
    "Git",
    "Gread",
    "Gsplit",
    "Gvdiffsplit",
    "Gwrite",
  },
  keys = {
    {
      "<leader>gg",
      vim.cmd.Git,
      desc = "Show git-fugitive UI",
    },
  },
}
