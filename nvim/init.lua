-- Config
-- vim.cmd(":hi StatusLine guibg=NONE")
-- vim.cmd.colorscheme("unokai")
-- Options
vim.g.mapleader = " " -- sets leader key to <SPACE>
-- vim.opt.spell = true -- set spell on
-- vim.opt.spelllang = "en_us"
vim.opt.title = true -- show title
vim.opt.keywordprg = ":help" -- Replace :man with :help, fix `K` freeze | :h keywordprg
vim.opt.syntax = "ON" -- maybe just set syntax
-- vim.opt.fileencoding = "utf-8" -- encoding set to utf-8
-- vim.opt.showtabline = 1 -- always show the tab line  1 = if at-least 2 tab, 2 = always, 0 = never
-- vim.opt.laststatus = 2 -- always show statusline
vim.opt.expandtab = true -- expand tab
vim.opt.shiftwidth = 2       -- Size of an indent (for >>, <<, and auto-indent)
vim.opt.tabstop = 2          -- Number of spaces a tab counts for
vim.opt.softtabstop = 2      -- Number of spaces a tab counts for while editing
vim.opt.smarttab = true
vim.opt.smartindent = true
-- vim.opt.guifont = "monospace:h17"
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx" -- files that u never want to edit
vim.opt.splitbelow = true -- split go below
vim.opt.splitright = true -- vertical split to the right
vim.opt.background = "dark" -- use dark theme only
--vim.cmd('colorscheme habamax')			-- set colorscheme
--vim.cmd('filetype plugin on')			-- set filetype

-- Basic settings
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.wrap = false -- enable text wrapping
vim.opt.scrolloff = 10 -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Search
vim.opt.ignorecase = true -- enable case insensitive searching
vim.opt.smartcase = true -- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = true -- disable all highlighted search results
vim.opt.incsearch = true -- enable incremental searching

-- File handling
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Key timeout duration
vim.opt.ttimeoutlen = 0 -- Key code timeout
vim.opt.autoread = true -- Auto reload files changed outside vim
vim.opt.autowrite = false -- Don't auto save

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
-- vim.opt.signcolumn = "yes" -- Always show sign column
-- vim.opt.colorcolumn = "100"                        -- Show column at 100 characters
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.conceallevel = 0 -- Don't hide markup
vim.opt.concealcursor = "" -- Don't hide cursor line markup
vim.opt.lazyredraw = true -- Don't redraw during macros
vim.opt.synmaxcol = 300 -- Syntax highlighting limit

-- Behavior settings
vim.opt.hidden = true -- Allow hidden buffers
vim.opt.errorbells = false -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.autochdir = false -- Don't auto change directory
vim.opt.iskeyword:append("-") -- Treat dash as part of word
-- vim.opt.path:append("**")                          -- include subdirectories in search
vim.opt.selection = "exclusive" -- Selection behavior
vim.opt.mouse = "a" -- Enable mouse support
-- vim.opt.clipboard:append("unnamedplus")            -- Use system clipboard
vim.opt.modifiable = true -- Allow buffer modifications

-- Functional wrapper for mapping custom keybindings
local map = vim.keymap.set

-- Line movement Soft wrap movement fix
map("n", "j", "gj") -- move vert by visual line
map("n", "k", "gk") -- move vert by visual line

-- Buffer Navigation (H/L)
vim.keymap.set('n', 'H', ':bprevious<CR>', { desc = "Previous buffer", silent = true })
vim.keymap.set('n', 'L', ':bnext<CR>', { desc = "Next buffer", silent = true })

-- Easy way to get back to normal mode from home row
map("i", "kj", "<Esc>") -- kj simulates ESC
map("i", "jk", "<Esc>") -- jk simulates ESC

-- Splits  & Windows
map("n", "<leader>|", "<C-w>v") -- split window vert
map("n", "<leader>-", "<C-w>s") -- split window horiz
map("n", "<leader>x", ":close<CR>") -- close current split

-- Split Navigation
map("n", "<C-h>", "<C-w>h") -- control+h switches to left split
map("n", "<C-l>", "<C-w>l") -- control+l switches to right split
map("n", "<C-j>", "<C-w>j") -- control+j switches to bottom split
map("n", "<C-k>", "<C-w>k") -- control+k switches to top split

-- Split Resize
map("n", "<C-S-h>", "<C-w><") -- resize window to left
map("n", "<C-S-l>", "<C-w>>") -- resize window to right
map("n", "<C-S-k>", "<C-w>+") -- resize window to up
map("n", "<C-S-j>", "<C-w>-") -- resize window to down

-- Clipboard
map({ "i", "c" }, "<C-v>", "<C-R>+", { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-v>", '"+gP', { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy to clipboard" })
map({ "v" }, "<C-x>", '"+x', { desc = "Cut to clipboard" })

-- Paste text but DONT copy the overridden text
map("x", "p", [["_dP]])

-- Delete text but DONT copy to clipboard
map({ "n", "v" }, "<leader>d", [["_d]])

-- Align
map({ "n", "i" }, "<A-j>", "<Esc>:m .+1<CR>==") -- Move current line down
map({ "n", "i" }, "<A-k>", "<Esc>:m .-2<CR>==") -- Move current line up
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- Move selection line up
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- Move selection line up
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quit
map("n", "<leader>qw", ":qw<CR>", { desc = "Save & quit" })
map("n", "<leader>wq", ":qw<CR>", { desc = "Save & quit" })
map("n", "<leader>q!", ":q!<CR>", { desc = "Quit all buffer without save" })
map("n", "<leader>q1", ":q!<CR>", { desc = "Quit all buffer without save" })
map("n", "<leader>qq", ":q<CR>", { desc = "Quit buffer without save" })
map("n", "<leader>qa", ":qa<CR>", { desc = "Quit all buffer with save" })
map("n", "<M-q>", "<cmd>q<CR>")

-- Abbrev
vim.cmd("cnoreabbrev Q  q")
vim.cmd("cnoreabbrev q1  q!")
vim.cmd("cnoreabbrev Q1  q!")
vim.cmd("cnoreabbrev Qa1 qa!")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev W  w")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev Set set")
vim.cmd("cnoreabbrev SEt set")
vim.cmd("cnoreabbrev SET set")

-- Quick config editing
map("n", "<leader>rc", ":e ~/.config/vi/init.lua<CR>", { desc = "Edit config" })

-- Misc
map("n", "<C-z>", ":setlocal spell! spelllang=en_us<CR>") -- Spell-check on\off
map("n", "<leader>ff", ":find ", { desc = "Find file" })

-- AutoCOMMANDS

-- Mode based Cursorline
vim.opt.cursorline = true -- current line Highlight
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	callback = function()
		vim.o.cursorline = false
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.o.cursorline = true
	end,
})

-- Copy Full File-Path
map("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

--vim.api.nvim_create_autocmd("BufWrite",
--	{
--		pattern = "*",
--		callback = function()
--			vim.cmd [[%s/\s\+$//e]] -- remove trailing whitespace
--			vim.cmd [[%s/\n\+\%$//e]] -- remove trailing newlines
--			vim.lsp.buf.format()
--		end
--	})

-- Auto Hlsearch
vim.on_key(function(char)
    if vim.fn.mode(1) == "n" then
        -- Definimos las teclas que disparan el resaltado
        local keys = { ["<CR>"] = true, ["n"] = true, ["N"] = true, ["*"] = true, ["#"] = true, ["?"] = true, ["/"] = true }
        
        -- Buscamos si la tecla presionada está en nuestra lista
        local new_hlsearch = keys[vim.fn.keytrans(char)] ~= nil

        if vim.opt.hlsearch:get() ~= new_hlsearch then
            vim.opt.hlsearch = new_hlsearch
        end
    end
end, vim.api.nvim_create_namespace("auto_hlsearch"))
-- <CMD> to hot-Reload config
vim.api.nvim_create_user_command("ReloadConfig", 'source vim.fn.stdpath("config").. "init.lua"', {})
--vim.api.nvim_create_user_command('OpenConfig', ':exe edit vim.fn.stdpath("config").. "init.lua"', {})

local group = vim.api.nvim_create_augroup("user_cmds", { clear = true })

-- Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	desc = "Highlight on yank",
	callback = function()
		vim.highlight.on_yank({ higroup = "ErrorMsg", timeout = 300 })
	end,
})
-- quit help with 'q'
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "man" },
	group = group,
	command = "nnoremap <buffer> q <cmd>quit<cr>",
})

------------------------------
-- FileBrowser
map("n", "<leader>e", ":Lex<CR>") -- space+e toggles netrw tree view
map("n", "<leader>o", ":Explore<CR>") -- Open file-picker
vim.g.netrw_browse_split = 4 -- open in prior window
vim.g.netrw_keepdir = 0 -- Sync current directory with browsing directory
vim.g.netrw_altv = 1 -- change from left splitting to right splitting
vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw
vim.g.netrw_liststyle = 3 -- tree style view in netrw
vim.g.netrw_winsize = 15 -- window size
-- Netrw Keymaps
local function netrw_mapping()
	local bufmap = function(lhs, rhs)
		local opts = { buffer = true, remap = true }
		vim.keymap.set("n", lhs, rhs, opts)
	end

	--  -- close window
	--  bufmap('<leader>e', ':Lexplore<cr>')
	--  bufmap('<leader>E', ':Lexplore<cr>')

	-- Go back in history
	bufmap("H", "u")

	-- Go up a directory
	bufmap("h", "-^")

	-- Open file/directory
	bufmap("l", "<cr>")

	-- Open file/directory then close explorer
	bufmap("L", "<cr>:Lexplore<CR>")

	-- Toggle dotfiles
	bufmap(".", "gh")
end
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	group = group,
	desc = "Keybindings for netrw",
	callback = netrw_mapping,
})
------------------------------
-- Completion from :h ins-completion
vim.opt.omnifunc = "syntaxcomplete#Complete" -- Auto Completion - Enable Omni complete features
vim.cmd("set complete+=k") -- Enable Spelling Suggestions for Auto-Completion:
vim.opt.completeopt = { "menu", "menuone", "noinsert" } -- Completion options

vim.cmd([[
" Minimalist-Tab Complete
	inoremap <expr> <Tab> TabComplete()
	fun! TabComplete()
	    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
	        return "\<C-N>"
	    else
	        return "\<Tab>"
	    endif
	endfun
""""""""""""""""""""""""""""""""""""""""
" Minimalist-Autocomplete
	inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
	autocmd InsertCharPre * call AutoComplete()
	fun! AutoComplete()
	    if v:char =~ '\K'
	        \ && getline('.')[col('.') - 4] !~ '\K'
	        \ && getline('.')[col('.') - 3] =~ '\K'
	        \ && getline('.')[col('.') - 2] =~ '\K' " last char
	        \ && getline('.')[col('.') - 1] !~ '\K'

	        call feedkeys("\<C-N>", 'n')
	    end
	endfun
]])
-- Automatically Pair brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", '"', '""<left>')
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>")
