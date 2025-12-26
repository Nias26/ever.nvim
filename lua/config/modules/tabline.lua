local tabline = {}

-- Helper Function for applying highlight groups
local function set_hl(hl)
	if type(hl) ~= "string" or vim.fn.hlexists(hl) == 0 then
		return ""
	end
	return "%#" .. hl .. "#"
end

-- Create highlight groups
vim.api.nvim_set_hl(0, "TablineActive", { fg = "#161616", bg = "#41be65", bold = true })
vim.api.nvim_set_hl(0, "TablineInactive", { fg = "#bbc2cf", bg = "#282c34" })

-- Configuration table
tabline.config = {
	{ kind = "text", hl = "TablineInactive", text = "Tabs ", icon = "󰓩 " },
	{ kind = "separator", hl = "Normal" },
	{ kind = "tabs", active_hl = "TablineActive", inactive_hl = "TablineInactive" },
	{ kind = "separator", hl = "Normal" },
}

---@param config table
tabline.text = function(config)
	return set_hl(config.hl) .. (config.icon or "") .. (config.text or "")
end

---@param config table
tabline.tabs = function(config)
	local _o = ""
	local tabs = vim.api.nvim_list_tabpages()
	local current_tab = vim.api.nvim_get_current_tabpage()

	for i, tab in ipairs(tabs) do
		local is_active = (tab == current_tab)
		local hl = is_active and config.active_hl or config.inactive_hl

		-- Start clickable area
		_o = _o .. "%" .. i .. "T"
		_o = _o .. set_hl(hl)

		if is_active then
			-- Get the buffer in the active window of THIS tab
			local win = vim.api.nvim_tabpage_get_win(tab)
			local buf = vim.api.nvim_win_get_buf(win)
			local name = vim.api.nvim_buf_get_name(buf)

			-- Format name: show filename or [No Name]
			local display_name = (name ~= "" and vim.fn.fnamemodify(name, ":t")) or "[No Name]"
			_o = _o .. " " .. i .. ": " .. display_name .. " "
		else
			-- Just show the number for inactive tabs
			_o = _o .. " " .. i .. " "
		end
	end

	_o = _o .. "%T" -- Reset click area
	_o = _o .. set_hl("Normal") -- Reset highlight to avoid leaking into empty space
	return _o
end
---@param config table
tabline.separator = function(config)
	return set_hl(config.hl) .. "%="
end

-- Function to create the tabline
tabline.render = function()
	local _tabline = ""
	for _, component in ipairs(tabline.config) do
		local func = tabline[component.kind]
		if type(func) == "function" then
			local ok, part_text = pcall(func, component)
			if ok then
				_tabline = _tabline .. part_text
			end
		end
	end
	return _tabline
end

-- Setup function
tabline.setup = function(config)
	if type(config) == "table" then
		tabline.config = vim.tbl_deep_extend("force", tabline.config, config)
	end

	-- IMPORTANT: Ensure the path matches your filename
	-- If this file is `lua/my_tabline.lua`, use `require('my_tabline')`
	_G._tabline = tabline.render
	vim.o.tabline = "%!v:lua._tabline()"
end

return tabline
