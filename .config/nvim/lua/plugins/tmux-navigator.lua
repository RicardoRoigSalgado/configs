return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  init = function()
    vim.g.tmux_navigator_save_on_switch = 1
    vim.g.tmux_navigator_disable_when_zoomed = 1
    vim.g.tmux_navigator_preserve_zoom = 1
  end,
  keys = {
    { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Navigate left" },
    { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Navigate down" },
    { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Navigate up" },
    { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Navigate right" },
    { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Navigate previous" },
  },
}
