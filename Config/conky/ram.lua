conky.config = {
	-- Output
	out_to_x = false,
	out_to_wayland = true,       -- Required for native Wayland
	background = true,
	double_buffer = true,

	-- Window
	own_window = true,
	own_window_type = 'desktop',
	own_window_argb_visual = true,
	own_window_argb_value = 150,  -- Transparency (0-255)
	own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',

	-- Layout
	alignment = 'bottom_right',
	gap_x = 40,
	gap_y = 40,
	minimum_width = 250,
	minimum_height = 0,
	border_inner_margin = 10,

	-- Font & colors
	font = 'JetBrains Mono:size=12',
	default_color = '#c0caf5',
	draw_shades = false,
	draw_outline = false,
	draw_borders = true,

	color0 = '#9ece6a',		-- Green
	color1 = '#f7768e',		-- Red
	color2 = '#7aa2f7',		-- Blue
	color3 = '#e0af68',		-- Orange
	color4 = '#bb9af7',		-- Purple
	color5 = '#7dcfff',		-- Cyan
	color6 = '#414868',		-- Comment
	color7 = '#c0caf5',		-- White

	-- Intervals
	update_interval = 2.0,
	cpu_avg_samples = 2,
	net_avg_samples = 2,
};

conky.text = [[
RAM ${alignr}${font JetBrains Mono Nerd Font:size=11}${mem}
${membar 6}
${top_mem name 1} ${alignr} ${top_mem mem_res 1}
${top_mem name 2} ${alignr} ${top_mem mem_res 2}
${top_mem name 3} ${alignr} ${top_mem mem_res 3}
${top_mem name 4} ${alignr} ${top_mem mem_res 4}
${top_mem name 5} ${alignr} ${top_mem mem_res 5}
]]


