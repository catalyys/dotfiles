vim.g.mapleader = " "



local map = vim.api.nvim_set_keymap
local cmap = vim.keymap.set

local options = { noremap = true }
local cmd_options = { noremap = true, silent = true }

local tele = require('telescope.builtin')
local neogit = require('neogit')







-- open git integration
map("n", "<leader>g", "<cmd>Neogit kind=split<CR>", options)



-- TELESCOPE
cmap("n", "<leader>ff", tele.find_files, options)
map("n", "<leader>fh", "<cmd>Telescope find_files hidden=true<CR>", options)
cmap("n", "<leader>fg", tele.git_files, options)
cmap("n", "<leader>fg", tele.git_files, options)

cmap("n", "<leader>fs", function()
	tele.grep_string({ search = vim.fn.input("Grep > ") });
end)



-- slef explanitory
map("n", "<leader>tw", "<cmd>lua MiniTrailspace.trim()<CR>", options)
map("n", "<leader>fm", "<cmd>CHADopen<CR>", options)
map("n", "<leader>tt", "<cmd>12 split <CR><cmd>Tnew<CR>", options)
map("n", "<leader>zt", "<cmd>Twilight<CR>", options)
map("n", "<leader>zz", "<cmd>ZenMode<CR>", options)


-- remap keys so that they dont skip camelCase
map("n", "w", "<Plug>CamelCaseMotion_w", cmd_options)
map("n", "b", "<Plug>CamelCaseMotion_b", cmd_options)
map("n", "e", "<Plug>CamelCaseMotion_e", cmd_options)
map("n", "ge", "<Plug>CamelCaseMotion_ge", cmd_options)


-- Dashboard and pomodoro
map("n", "<leader>v", "<cmd>Veil<CR>", options)
map("n", "<leader>p", "<cmd>NomoMenu<CR>", options)



-- this little guy helps you move text, really helpful
map("v", "J", ":m '>+1<CR>gv=gv", options)
map("v", "K", ":m '<-2<CR>gv=gv", options)


-- Cursor always stays on center
map("n", "J", "mzJ`z", options)
map("n", "<C-d>", "<C-d>zz", options)
map("n", "<C-u>", "<C-u>zz", options)
map("n", "n", "nzzzv", options)
map("n", "N", "Nzzzv", options)



-- paste text but DONT copy the overridden text
cmap("x", "p", [["_dP]])
cmap("x", "<leader>p", [["+dP]])
-- delete text but DONT copy to clipboard
cmap({ "n", "v" }, "<leader>d", [["_d]])

-- quickfix stuff
--
--
map("n", "<C-k>", "<cmd>cnext<CR>zz", options)
map("n", "<C-j>", "<cmd>cprev<CR>zz", options)
map("n", "<leader>k", "<cmd>lnext<CR>zz", options)
map("n", "<leader>j", "<cmd>lprev<CR>zz", options)


-- search and replace every instance of word under cursor
cmap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- take a break !
map("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", options)


