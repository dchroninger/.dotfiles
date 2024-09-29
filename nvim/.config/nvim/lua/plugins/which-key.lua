return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = {
        { "<leader>p", group = "pomo" },
      }
    end,
  },
}
