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
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},

		notes_subdir = "notes",
		new_notes_location = "notes_subdir",

		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},

		---@param title string|?
		---@return string
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "_" .. suffix
		end,

		follow_url_func = function(url)
			vim.fn.jobstart({ "open", url })
		end,

		open_app_foreground = false,
		finder = "telescope.nvim",
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
		vim.keymap.set("n", "<leader>oT", "<cmd>ObsidianTemplate<CR>")
		vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianNewFromTemplate<CR>")
	end,
}
