return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/kb/**.md",
	},

	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},

	opts = {
		workspaces = {
			{ name = "kb", path = vim.fn.expand("~") .. "/kb" },
		},

		daily_notes = {
			folder = "notes/daily",
			template = "daily",
			alias_format = "%A %B %d, %Y",
		},

		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},

		notes_subdir = "notes",
		new_notes_location = "notes_subdir",

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

		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "markdown", "markdown_inline" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
		})

		vim.keymap.set("n", "gf", function()
			if require("obsidian").util.cursor_on_markdown_link() then
				return "<cmd>ObsidianFollowLink<CR>"
			else
				return "gf"
			end
		end, { noremap = false, expr = true })

		vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>")
		vim.keymap.set("n", "<leader>od", "<cmd>ObsidianToday<CR>")
		vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<CR>")
		vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>")
		vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<CR>")
		vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>")
		vim.keymap.set("n", "<leader>oT", "<cmd>ObsidianNewFromTemplate<CR>")
	end,

	note_frontmatter_func = function(note)
		local out = { aliases = note.aliases, tags = note.tags }
		if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
			for k, v in pairs(note.metadata) do
				out[k] = v
			end
		end
		return out
	end,

	folow_url_func = function(url)
		vim.fn.jobstart({ "open", url })
	end,

	--  TODO: Add function to create meeting note
	--  TODO: Add function to create class note

	open_app_foreground = false,
	finder = "telescope.nvim",
}
