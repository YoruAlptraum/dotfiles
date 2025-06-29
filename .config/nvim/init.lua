local ascii = [[
⠄⠄⣼⡟⣿⠏⢀⣿⣇⣿⣏⣿⣿⣿⣿⣿⣿⣿⢸⡇⣿⣿⣿⣟⣿⣿⣿⣿
⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿
⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹
⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈
⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄
⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐
⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄
⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄
⣿⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⡟⢀⠃⠄⢸⡄
⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆
⡟⠄⠄⠄⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣟⣻⣩⣾⣃⣴⣿⣿⡇]]

print(ascii)

-- Set line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable folds (colapse regions)
vim.foldmethod = "syntax"

-- Tab width
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.termguicolors = true -- Enable true color support

vim.api.nvim_set_hl(0, 'Title', { fg = '#4287f5' }) -- Title

-- Backgrounds and foregrounds
vim.api.nvim_set_hl(0, 'Normal', { fg = '#c0caf5' }) -- Default text and background
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#565f89' }) -- Line numbers
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#565f89' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#565f89' })
vim.api.nvim_set_hl(0, 'Folded', { fg = '#a9b1d6', bg = '#363b51' }) -- Folded lines
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = '#1a1b26' }) -- '~' at end of buffer
vim.api.nvim_set_hl(0, 'NonText', { fg = '#565f89' }) -- Non-text characters (e.g., show break characters)
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = '#565f89' }) -- Special key in listchars
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#292e42' }) -- Current line background
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#7aa2f7', bg = '#292e42' }) -- Current line number
vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#c0caf5', bg = '#363b51' }) -- Status line
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#565f89', bg = '#292e42' }) -- Inactive status line

-- Syntax highlighting
vim.api.nvim_set_hl(0, 'Comment', { fg = '#565f89', italic = true }) -- Comments
vim.api.nvim_set_hl(0, 'Constant', { fg = '#d79921' }) -- Constants (numbers, booleans, etc.)
vim.api.nvim_set_hl(0, 'String', { fg = '#9ece6a' }) -- Strings
vim.api.nvim_set_hl(0, 'Character', { fg = '#9ece6a' }) -- Characters
vim.api.nvim_set_hl(0, 'Number', { fg = '#d79921' }) -- Numbers
vim.api.nvim_set_hl(0, 'Boolean', { fg = '#d79921' }) -- Booleans
vim.api.nvim_set_hl(0, 'Float', { fg = '#d79921' }) -- Floats
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#c0caf5' }) -- Variable names
vim.api.nvim_set_hl(0, 'Function', { fg = '#7aa2f7' }) -- Function names
vim.api.nvim_set_hl(0, 'Statement', { fg = '#bb9af7' }) -- Control statements (if, for, while)
vim.api.nvim_set_hl(0, 'Keyword', { fg = '#bb9af7' }) -- Keywords (return, import, etc.)
vim.api.nvim_set_hl(0, 'Repeat', { fg = '#bb9af7' }) -- Repeat statements
vim.api.nvim_set_hl(0, 'Operator', { fg = '#bb9af7' }) -- Operators (+, -, =, etc.)
vim.api.nvim_set_hl(0, 'Exception', { fg = '#bb9af7' }) -- Exception handling
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#a9b1d6' }) -- Preprocessor directives
vim.api.nvim_set_hl(0, 'Include', { fg = '#a9b1d6' }) -- Include directives
vim.api.nvim_set_hl(0, 'Define', { fg = '#a9b1d6' }) -- Define directives
vim.api.nvim_set_hl(0, 'Macro', { fg = '#a9b1d6' }) -- Macro directives
vim.api.nvim_set_hl(0, 'Type', { fg = '#0db9d7' }) -- Type names (int, void, etc.)
vim.api.nvim_set_hl(0, 'StorageClass', { fg = '#0db9d7' }) -- Storage class specifiers
vim.api.nvim_set_hl(0, 'Structure', { fg = '#0db9d7' }) -- Structure names
vim.api.nvim_set_hl(0, 'Typedef', { fg = '#0db9d7' }) -- Typedefs
vim.api.nvim_set_hl(0, 'Special', { fg = '#7dcfff' }) -- Special characters
vim.api.nvim_set_hl(0, 'Underlined', { underline = true }) -- Underlined text
vim.api.nvim_set_hl(0, 'Error', { fg = '#ff7a93', bg = '#42242b' }) -- Errors
vim.api.nvim_set_hl(0, 'Todo', { fg = '#a9b1d6', bg = '#292e42', bold = true }) -- TODOs

-- Visual selections
vim.api.nvim_set_hl(0, 'Visual', { bg = '#363b51' }) -- Visual mode selection
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = '#363b51' }) -- Visual mode selection with 'not-set' option

-- Search
vim.api.nvim_set_hl(0, 'Search', { fg = '#1a1b26', bg = '#7aa2f7' }) -- Search matches
vim.api.nvim_set_hl(0, 'IncSearch', { fg = '#1a1b26', bg = '#9ece6a' }) -- Incremental search

-- Spelling
vim.api.nvim_set_hl(0, 'SpellBad', { sp = '#ff7a93', underline = true }) -- Bad spelling
vim.api.nvim_set_hl(0, 'SpellCap', { sp = '#7dcfff', underline = true }) -- Capitalization spelling
vim.api.nvim_set_hl(0, 'SpellLocal', { sp = '#9ece6a', underline = true }) -- Local spelling
vim.api.nvim_set_hl(0, 'SpellRare', { sp = '#bb9af7', underline = true }) -- Rare spelling

-- Diffs
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#3b4261' }) -- Added lines in diff
vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#363b51' }) -- Changed lines in diff
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#ff7a93', bg = '#42242b' }) -- Deleted lines in diff
vim.api.nvim_set_hl(0, 'DiffText', { bg = '#363b51' }) -- Changed text in diff

-- Autocomplete/Popup Menu
vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#c0caf5', bg = '#292e42' }) -- Popup menu
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = '#c0caf5', bg = '#363b51' }) -- Selected item in popup menu
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#363b51' }) -- Scrollbar in popup menu
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#565f89' }) -- Thumb of the scrollbar

-- Other
vim.api.nvim_set_hl(0, 'SignColumn', { bg = '#1a1b26' }) -- Sign column for git signs, etc.
vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#ff7a93', bold = true, underline = true }) -- Matched parentheses
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = '#e0af68' }) -- Warning messages
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = '#ff7a93' }) -- Error messages
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#9ece6a' }) -- More prompt
vim.api.nvim_set_hl(0, 'Question', { fg = '#9ece6a' }) -- Question prompt