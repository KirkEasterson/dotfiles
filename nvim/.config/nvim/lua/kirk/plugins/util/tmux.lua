return {
  "aserowy/tmux.nvim",
  keys = {
    { "<C-h>" },
    { "<C-j>" },
    { "<C-k>" },
    { "<C-l>" },
    { "<M-h>" },
    { "<M-j>" },
    { "<M-k>" },
    { "<M-l>" },
    {
      "<C-h>",
      function()
        require("tmux").move_left()
      end,
      desc = "Move left",
      mode = "t",
    },
    {
      "<C-j>",
      function()
        require("tmux").move_bottom()
      end,
      desc = "Move down",
      mode = "t",
    },
    {
      "<C-k>",
      function()
        require("tmux").move_top()
      end,
      desc = "Move up",
      mode = "t",
    },
    {
      "<C-l>",
      function()
        require("tmux").move_right()
      end,
      desc = "Move right",
      mode = "t",
    },
    {
      "<M-h>",
      function()
        require("tmux").resize_left()
      end,
      desc = "Resize left",
      mode = "t",
    },
    {
      "<M-j>",
      function()
        require("tmux").resize_bottom()
      end,
      desc = "Resize down",
      mode = "t",
    },
    {
      "<M-k>",
      function()
        require("tmux").resize_top()
      end,
      desc = "Resize up",
      mode = "t",
    },
    {
      "<M-l>",
      function()
        require("tmux").resize_right()
      end,
      desc = "Resize right",
      mode = "t",
    },
  },
  opts = {
    copy_sync = {
      enable = true,
      redirect_to_clipboard = true,
    },
    resize = {
      enable_default_keybindings = true,
      resize_step_x = 8,
      resize_step_y = 4,
    },
  },
}
