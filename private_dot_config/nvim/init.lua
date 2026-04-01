vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.cursorline = true

if vim.fn.has('nvim-0.12') == 0 then
	vim.schedule(function()
		vim.notify('This config requires Neovim 0.12 or newer. Skipping plugin and advanced config.',
			vim.log.levels.WARN,
			{ title = 'nvim config' })
	end)
	return
end

vim.opt.completeopt = { 'menu', 'menuone', 'popup', 'fuzzy' }
vim.opt.winborder = 'rounded'

local function is_ansible_file(path)
	local normalized = path:gsub('\\', '/')

	return normalized:match('/playbooks?/.*%.ya?ml$')
	    or normalized:match('/roles/[^/]+/(tasks|handlers|vars|defaults|meta)/.*%.ya?ml$')
	    or normalized:match('/group_vars/.*%.ya?ml$')
	    or normalized:match('/host_vars/.*%.ya?ml$')
	    or normalized:match('/inventory/.*%.ya?ml$')
	    or normalized:match('/molecule/[^/]+/.*%.ya?ml$')
	    or normalized:match('/ansible/.*%.ya?ml$')
	    or normalized:match('/site%.ya?ml$')
	    or normalized:match('/playbook%.ya?ml$')
	    or normalized:match('/main%.ya?ml$')
end

vim.filetype.add({
	extension = {
		yml = function(path)
			if is_ansible_file(path) then
				return 'yaml.ansible'
			end

			return 'yaml'
		end,
		yaml = function(path)
			if is_ansible_file(path) then
				return 'yaml.ansible'
			end

			return 'yaml'
		end,
	},
})

vim.pack.add({
	{ src = 'https://github.com/rose-pine/neovim',                name = 'rose-pine' },
	{ src = 'https://github.com/Saghen/blink.cmp',                version = 'v1.10.1' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
	{ src = 'https://github.com/echasnovski/mini.pick' },
	{ src = 'https://github.com/echasnovski/mini.pairs' },
	{ src = 'https://github.com/echasnovski/mini.icons' },
	{ src = 'https://github.com/lewis6991/gitsigns.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/stevearc/conform.nvim' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/vladdoster/remember.nvim.git' },
	--{ src = '' },
})

require('rose-pine').setup({
	styles = {
		transparency = false,
	},
})
vim.cmd.colorscheme('rose-pine')

require('lualine').setup({
	options = {
		theme = 'rose-pine',
		globalstatus = true,
		section_separators = '',
		component_separators = '',
	},
})

require("oil").setup()
require('gitsigns').setup()
require('remember')
require('mini.pairs').setup()
require('mini.pick').setup()
require('which-key').setup()
require('mason').setup()
require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		go = { 'goimports', 'gofmt' },
		python = { 'ruff_organize_imports', 'ruff_format' },
		sh = { 'shfmt' },
		bash = { 'shfmt' },
		yaml = { 'yamlfmt', 'prettier', stop_after_first = true },
		['yaml.ansible'] = { 'ansible-lint', 'yamlfmt', 'prettier', stop_after_first = true },
		json = { 'jq' },
		jsonc = { 'prettier' },
		terraform = { 'terraform_fmt' },
		tf = { 'terraform_fmt' },
		hcl = { 'terraform_fmt' },
	},
	default_format_opts = {
		lsp_format = 'fallback',
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = 'fallback',
	},
	notify_on_error = true,
	formatters = {
		shfmt = {
			append_args = { '-i', '2' },
		},
		prettier = {
			prepend_args = { '--prose-wrap', 'always' },
		},
	},
})
require('blink.cmp').setup({
	keymap = { preset = 'super-tab' },
	appearance = {
		nerd_font_variant = 'mono',
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
	},
	sources = {
		default = { 'lsp', 'path', 'buffer' },
	},
	signature = {
		enabled = true,
	},
	fuzzy = {
		implementation = 'prefer_rust_with_warning',
	},
})

vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep_live<cr>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fo', '<cmd>Oil<cr>', { desc = 'Open Files' })
vim.keymap.set('n', '<leader><Space>', '<cmd>Pick buffers<cr>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<cr>', { desc = 'Help tags' })
vim.keymap.set('n', '<leader>cm', '<cmd>Mason<cr>', { desc = 'Mason' })

local treesitter_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if treesitter_ok then
	treesitter.setup({
		ensure_installed = { 'bash', 'go', 'lua', 'markdown', 'python', 'vim', 'vimdoc', 'yaml' },
		highlight = { enable = true },
		indent = { enable = true },
	})
end

vim.diagnostic.config({
	severity_sort = true,
	float = { border = 'rounded' },
	underline = true,
	signs = true,
	virtual_text = {
		spacing = 2,
		source = 'if_many',
	},
})

local lsp_servers = {
	'ansiblels',
	'bashls',
	'dockerls',
	'gopls',
	'jsonls',
	'lua_ls',
	'pyright',
	'terraformls',
	'yamlls',
}

require('mason-lspconfig').setup({
	ensure_installed = lsp_servers,
	automatic_enable = false,
})

vim.lsp.config('*', {
	capabilities = require('blink.cmp').get_lsp_capabilities(),
})

vim.lsp.enable(lsp_servers)

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'go to definition', buffer = event.buf })
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'go to references', buffer = event.buf })
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
			{ desc = 'go to implementation', buffer = event.buf })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'buffer rename', buffer = event.buf })
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'code action', buffer = event.buf })
		vim.keymap.set('n', '<leader>f', function()
			require('conform').format({ async = true, lsp_format = 'fallback' })
		end, opts)
	end,
})

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.config('ansiblels', {
	settings = {
		ansible = {
			validation = {
				enabled = true,
				lint = {
					enabled = true,
				},
			},
		},
	},
})

vim.lsp.config('yamlls', {
	filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },
	settings = {
		yaml = {
			keyOrdering = false,
		},
	},
})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics list' })
vim.keymap.set('n', '<leader>ch', '<cmd>ConfigHealth<cr>', { desc = 'Config health' })

vim.api.nvim_create_user_command('ConfigHealth', function()
	vim.cmd('checkhealth vim.lsp')
end, { desc = 'Run health checks for this config' })
