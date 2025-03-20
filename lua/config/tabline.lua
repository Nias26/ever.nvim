local tabline = {}

-- Helper Function for applying highlight groups
---@param hl string
---@return string
local function set_hl(hl)
	if type(hl) ~= "string" then
		return ""
	elseif vim.fn.hlexists(hl) == 0 then
		return ""
	else
		return "%#" .. hl .. "#"
	end
end

-- Create highlight groups
vim.api.nvim_set_hl(0, "TablineActive", { fg = "#161616", bg = "#41be65" })
vim.api.nvim_set_hl(0, "TablineInactive", { fg = "#bbc2cf", bg = "NONE" })

-- Configuration table
tabline.config = {
	{ kind = "text", hl = "TablineInactive", text = "Tabs: ", icon = "󰓩 " },
	{ kind = "separator", hl = "Normal" },
	{
		kind = "tabs",

		active_hl = "TablineActive",
		inactive_hl = "TablineInactive",
	},
	{ kind = "separator", hl = "Normal" },
}

---@class tabline.text
---@field hl? string
---@field icon? string
---@field text? string
---@param config tabline.text
tabline.text = function(config)
	return set_hl(config.hl) .. config.icon .. config.text
end

---@class tabline.tabs
-- Highlight group for current tab
---@field active_hl? string
-- Highlight group for other tab(s)
---@field inactive_hl? string

-- Shows a list of tabs
---@param config tabline.tabs
---@return string
tabline.tabs = function(config)
	local _o = ""
	---@type integer[]
	local tabs = vim.api.nvim_list_tabpages()
	---@type integer
	local current = vim.api.nvim_get_current_tabpage()

	for t, tab in ipairs(tabs) do
		if tab == current then
			_o = table.concat({
				_o,
				set_hl(config.active_hl),
				" ",
				tab,
				" ",
			})
		else
			_o = table.concat({
				_o,
				"%" .. t .. "T",
				set_hl(config.inactive_hl),
				" ",
				tab,
				" ",
				"%X",
			})
		end

		if t ~= #tabs then
			_o = _o .. "%#Normal#"
		end
	end

	return _o
end

---@class tabline.separator
---@field hl? string
---@param config tabline.separator
tabline.separator = function(config)
	return set_hl(config.hl) .. "%="
end

-- Function to create the tabline
---@return string
tabline.render = function()
	local _tabline = ""

	for _, component in ipairs(tabline.config) do
		local ok, part_text = pcall(tabline[component.kind], component)

		if ok then
			-- Add text if pcall doesn't fail
			_tabline = _tabline .. part_text
		end
	end

	return _tabline
end

-- Setup function
tabline.setup = function(config)
	if type(config) == "table" then
		tabline.config = vim.tbl_deep_extend("force", tabline.config, config)
	end

	vim.o.tabline = "%!v:lua.require('config.tabline').render()"
end

return tabline
