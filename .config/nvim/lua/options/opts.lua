local o = vim.opt

o.number         = true -- enable line number
o.relativenumber = true -- enable relative line number
o.undofile       = true -- persistent undo
o.backup         = false -- disable backup
o.autowrite      = true -- auto write buffer when it's not focused
o.ignorecase     = true -- case insensitive on search..
o.list           = true -- display listchars
o.smartindent    = true -- smarter indentation
o.smarttab       = true -- make tab behaviour smarter
o.splitright     = true -- split right instead of left
o.splitkeep      = "screen" -- stabilize split
o.startofline    = false -- don't go to the start of the line when moving to another file
o.swapfile       = false -- disable swapfile
o.termguicolors  = true -- true colours for better experience
o.wrap           = false -- don't wrap lines
o.backupcopy     = "yes" -- fix weirdness for stuff that replaces the entire file when hot reloading

o.compatible = false -- disable compatibility with old vi
o.showmatch = true -- show matches while searching for text
o.hlsearch = true -- highlight text that has been searched
o.incsearch = true -- incramentally search
o.tabstop = 16
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.wildmode = "longest,list"
o.mouse = "v"
o.mouse = "a"
o.clipboard = "unnamedplus" --  use system clipboard
o.ttyfast = true
o.cursorline = true
o.splitbelow = true
o.autochdir = false
o.signcolumn="yes:1"
o.shell = "/usr/bin/fish"

vim.api.nvim_command("filetype off")
vim.api.nvim_command("let &runtimepath.=',~/.vim/bundle/neoterm'")
vim.api.nvim_command("filetype plugin on")
vim.api.nvim_command("filetype plugin indent on")
vim.api.nvim_command("syntax on")



-- disable builtin plugins as they are not needed 
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
