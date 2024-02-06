return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    ft = "dart",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },

    config = function()
      require("plugins.flutter").setup({})
    end,
  },
}
