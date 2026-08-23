--- See https://wiki.hypr.land/Configuring/Keywords/

--- Set programs that you use
local fileManager = "dolphin"
local menu = "rofi -show combi -modes combi -combi-modes 'window,drun,run'"

--- ensures all open kitty terminals are unified under a single tmp file for remote sharing
local terminal = "kitty --single-instance --listen-on unix:/tmp/mykitty"

--- let World of Warcraft display fullscreen!
hl.windowrule({
	name = "fullscreen-wow",
	match = {
		class = "^$",
		title = "World of Warcraft",
		fullscreen = true,
		immediate = true,
	},
})
