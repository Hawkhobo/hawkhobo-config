-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@120.01500",
	position = "0x0",
	scale = 1.5,
})

--- Samsung TV @ Living Room. Matched by description rather than connector,
--- since DP-1 can shuffle between boots and ports.
--- 1080p60 is the fastest 1080p mode this TV's EDID advertises; 144 is not in
--- the list at all, and the Yamaha receiver won't pass an out-of-spec mode.
hl.monitor({
	output = "desc:Samsung Electric Company SAMSUNG",
	mode = "1920x1080@60",
	position = "auto-right",
	scale = 1.5,
})
