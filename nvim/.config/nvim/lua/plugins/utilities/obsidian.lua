return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand("~") .. "/notes/**.md" },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },

  opts = {
    dir = "~/notes",
    daily_notes = {
      folder = "daily",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end,
  },

  config = function(_, opts)
    require("obsidian").setup(opts)
    vim.keymap.set("n", "gf", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<CMD>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end, { noremap = false, expr = true })
  end,

  note_frontmatter_func = function(note)
    -- This is equivalent to the default frontmatter function.
    local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,

  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },

  open_app_foreground = false,
  finder = "telescope.nvim",
}
