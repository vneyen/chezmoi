--- leader ---------------------------------------------------------------------
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Options --------------------------------------------------------------------
-- see https://neovim.io/doc/user/quickref.html#option-list
vim.opt.backup = false              -- keep backup file after overwriting a file
vim.opt.clipboard = "unnamedplus"   -- allows neovim to access the system clipboard
vim.opt.cursorline = true           -- highlight the current line
vim.opt.cmdheight = 1               -- number of lines to use for the command-line 
vim.opt.expandtab = true            -- use spaces when <Tab> is inserted
vim.opt.guicursor = "n-v-c-i:block" -- always use fat cursor
vim.opt.hlsearch = false            -- highlight matches with last search pattern
vim.opt.ignorecase = false          -- ignore case in search patterns
vim.opt.incsearch = true            -- highlight match while typing search pattern
vim.opt.laststatus = 3              -- tells when last window has status lines
vim.opt.number = true               -- print the line number in front of each line
vim.opt.relativenumber = true       -- show relative line number in front of each line
vim.opt.ruler = true                -- show cursor line and column in the status line  
vim.opt.scrolloff = 8               -- minimum nr. of lines above and below cursor
vim.opt.shiftwidth = 3              -- number of spaces to use for (auto)indent step
vim.opt.showtabline = 1             -- tells when the tab pages line is displayed
vim.opt.signcolumn = "yes"          -- when and how to display the sign column
vim.opt.smartindent = true          -- smart autoindenting for C programs
vim.opt.softtabstop = 3             -- number of spaces that <Tab> uses while editing
vim.opt.splitbelow = true           -- new window from split is below the current one
vim.opt.splitright = true           -- new window from vsplit is put right of the current one
vim.opt.swapfile = false            -- whether to use a swapfile for a buffer
vim.opt.tabstop = 3                 -- number of spaces that <Tab> in file uses
vim.opt.termguicolors = true        -- set term gui colors (most terminals support this)
vim.opt.title = false               -- let Vim set the title of the window
vim.opt.timeoutlen = 500            -- time in milliseconds to wait for a mapped sequence to complete (useful for which-key too)
vim.opt.visualbell = true           -- use visual bell instead of beeping
vim.opt.wrap = false                -- long line long lines wrap and continue on the next line

vim.g.netrw_banner = 0

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider= 0

--- Keymaps --------------------------------------------------------------------
local opts = { silent = true }
-- Better window navigation using <ALT>
vim.keymap.set("n", "<m-h>", "<C-w>h", opts)
vim.keymap.set("n", "<m-j>", "<C-w>j", opts)
vim.keymap.set("n", "<m-k>", "<C-w>k", opts)
vim.keymap.set("n", "<m-l>", "<C-w>l", opts)
vim.keymap.set("n", "<m-w>", "<C-w>w", opts)

vim.keymap.set("x", "p", [["_dP]])  -- don't replace buffer after pasting
vim.keymap.set("n", "Q", "<Nop>", opts) -- disable mapping to execute last macro recorded
