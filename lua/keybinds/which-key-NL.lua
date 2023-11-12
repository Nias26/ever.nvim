-- Code -> 
map({'n', 'v'}, 'cc', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>')
map('n', '<A-1>', '<cmd>lua require("dropbar.api").pick()<CR>')
map('n', 'ca', '<cmd>lua require("actions-preview").code_actions()<CR>')
map('n', 'ct', '<cmd>TroubleToggle<CR>')
map('n', 'crr', '<cmd>ExecutorRun<CR>')
map('n', 'crc', '<cmd>ExecutorReset<CR>')
map('n', 'crs', '<cmd>ExecutorToggleDetail<CR>')
map('n', 'cg', '<cmd>GitBlameToggle<CR>')

-- File -> 
map('n', 'fs', '<cmd>source %<CR>')
map('n', 'fw', '<cmd>wq<CR>')
map('n', 'fd', '<cmd>call delete(@%)<CR>')
map('n', 'fr', function() ui_input({prompt = 'Rename'}, function(input) fcmd('Rename', input)end)end)
map('n', 'fm', function() ui_input({prompt = 'Move'}, function(input) fcmd('Move', input)end)end)
map('n', 'fR', '<cmd>lua require("persistence").load({ last = true })<CR>')
map('n', 'fSw', '<cmd>SudaWrite<CR>')
map('n', 'fSo', '<cmd>SudaRead<CR>')
map('n', 'fl', '<cmd>LegendaryScratchToggle<CR>')
map('n', 'ff', 'za')
map('n', 'ft', 'zi')

-- Search -> 
map({'n', 'v'}, 'st', '<cmd>Telescope<CR>')
map('n', 'sl', '<cmd>LvimFileManager<CR>')
map('n', 'sr', '<cmd>Ranger<CR>')

-- Buffer -> 󰓩
map('n', 'bn', function() ui_input({prompt = 'New buffer'}, function(input) fcmd('badd', input)end)end)
map('n', 'bd', '<cmd>bdel<CR>')
map('n', 'bsd', '<cmd>NvimTreeClose | bdel | NvimTreeOpen<CR><C-w>w')
map('n', '[', '<cmd>bprevious<CR>')
map('n', ']', '<cmd>bnext<CR>')
map('n', 'bj', '<cmd>JABSOpen<CR>')
map('n', '<Tab>', '<cmd>bnext<CR>')
map('n', '<S-Tab>', '<cmd>bprevious<CR>')

-- Open -> 󰏌
map('n', 'oe', '<cmd>NvimTreeToggle<CR>')
map('n', 'om', '<cmd>MinimapToggle<CR>')
map('n', '<F5>', '<cmd>MinimapToggle<CR>')
map('n', 'oT', '<cmd>ToggleTerm<CR>')
map({'n', 'v', 'i'}, '<F4>', '<cmd>ToggleTerm<CR>')
map('n', 'os', '<cmd>SymbolsOutline<CR>')
map('n', 'od', '<cmd>Dashboard<CR>')
map('n', 'on', '<cmd>Nerdy<CR>')
map('n', 'oh', '<cmd>Noice<CR>')
map('n', 'ol', '<cmd>LazyGit<CR>')
map('n', 'ot', '<cmd>Telescope<CR>')

-- Debug ->  
map({'n', 'v'}, 'do', '<cmd>lua require("dapui").toggle()<CR>')
map({'n', 'v'}, 'db', '<cmd>lua require("dapui").toggle_breakpoint()<CR>')

-- Help -> 󰋖
map({'n', 'v'}, 'hc', '<cmd>DocsViewToggle<CR>')
map({'n', 'v'}, 'hl', '<cmd>DevdocsOpenCurrentFloat<CR>')
map({'n', 'v'}, 'hn', '<cmd>Telescope help_tags<CR>')

-- Zen -> 󰚀
map({'n', 'v'}, 'zf', '<cmd>TZAtaraxis<CR>')
map({'n', 'v'}, 'zm', '<cmd>TZMinimalist<CR>')
map({'n', 'v'}, 'zl', '<cmd>Twilight<CR>')

-- Neorg -> 󰭃
map('n', 'nn', '<cmd>Neorg<CR>')
map('n', 'nw', '<cmd>Neorg workspace<CR>')
