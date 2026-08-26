-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("fnott")

	hl.exec_cmd("notion-app", { workspace = "1 silent" })

	hl.exec_cmd("firefox https://www.gmail.com https://news.ycombinator.com", { workspace = "2 silent" })

	hl.exec_cmd(Terminal, { workspace = "3 silent" })

	hl.exec_cmd("discord", { workspace = "8 silent" })
	hl.exec_cmd("signal-desktop", { workspace = "8 silent" })
	hl.exec_cmd("slack", { workspace = "8 silent" })

	hl.exec_cmd("pavucontrol", { workspace = "9 silent" })
	hl.exec_cmd("blueman-manager", { workspace = "9 silent" })

	hl.exec_cmd("strawberry", { workspace = "10 silent" })
	hl.exec_cmd("nicotine", { workspace = "10 silent" })
	hl.exec_cmd("kitty -d $SLSK", { workspace = "10 silent" })
	hl.exec_cmd(
		"firefox https://www.rateyourmusic.com https://www.discogs.com \z
			 https://www.last.fm/user/hawkhobo https://bandcamp.com \z
			 https://www.mixesdb.com/w/Main_Page https://musicbrainz.org/",
		{ workspace = "10 silent" }
	)
end)
