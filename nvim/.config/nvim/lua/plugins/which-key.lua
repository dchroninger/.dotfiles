return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.defaults["<leader>p"] = { name = "+pomo" }
    end,
  },
}
