local palette = {
	bg         = "#161616",
	fg         = "#dde1e6",
	green      = "#42be65",
	violet     = "#be95ff",
	red        = "#ee5396",
	cyan       = "#3ddbd9",
	blue       = "#33b1ff",
	light_blue = "#82cfff",
	pink       = "#ff7eb6",
}

local function mode(a_bg)
	return {
		a = { bg = a_bg, fg = palette.bg, gui = "bold" },
		b = { bg = palette.bg, fg = palette.fg },
		c = { bg = palette.bg, fg = palette.fg },
	}
end

return {
	normal = mode(palette.light_blue),
	insert = mode(palette.pink),
	visual = mode(palette.violet),
	replace = mode(palette.cyan),
	command = mode(palette.green),
	terminal = mode(palette.blue),
	inactive = mode(palette.red),
}
