local colors = require("colors")

sbar.exec(
	"killall nowplaying_update >/dev/null; $CONFIG_DIR/helpers/event_providers/nowplaying/bin/nowplaying_update nowplaying_update 1.0 &"
)

local fixed_width = 145
local max_chars = 20

-- Forward declarations
local nowplaying_label
local nowplaying_icon
local nowplaying_bracket

-- The text container
nowplaying_label = sbar.add("item", "widgets.nowplaying.label", {
	position = "right",
	icon = { drawing = false },
	width = fixed_width,
	label = {
		string = "No Music Playing",
		padding_left = 0,
		padding_right = 0,
		font = { family = "SF Pro Display", size = 14.0 },
		color = colors.white,
		max_chars = max_chars,
		marquee = false,
		align = "center",
		width = fixed_width,
	},
})

-- The icon container
nowplaying_icon = sbar.add("item", "widgets.nowplaying.icon", {
	position = "right",
	padding_right = -1,
	icon = {
		string = "􀑪", -- Music Note SF Symbol
		width = 0,
		align = "left",
		color = colors.grey,
		font = { style = "Regular", size = 14.0 },
	},
	label = { width = 25, align = "center" },
})

-- Group the icon and text container in a bracket
nowplaying_bracket = sbar.add("bracket", "widgets.nowplaying.bracket", {
	nowplaying_icon.name,
	nowplaying_label.name,
}, {
	background = { color = colors.bg1 },
	popup = { align = "center" },
	width = 225, -- icon (25) + text container (200)
})

-- Subscribe to the nowplaying_update event from the helper
nowplaying_bracket:subscribe("nowplaying_update", function(env)
	local title = env.nowplaying or "No Music Playing"
	local use_marquee = (#title > max_chars)
	nowplaying_label:set({
		label = { string = title, marquee = use_marquee, align = "center", width = fixed_width },
		width = fixed_width,
	})
end)
