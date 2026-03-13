vim.filetype.add({
	pattern = {
		-- Matches any preceding path, literally ".config/sway/", then any filename
		[".*/%.config/sway/.*"] = "swayconfig",
		[".*/%.config/conky/.*"] = "lua",
	}
})
