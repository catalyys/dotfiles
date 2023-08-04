
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)





require("lazy").setup({

    "navarasu/onedark.nvim",
    "EdenEast/nightfox.nvim",

    "folke/twilight.nvim",
    "folke/zen-mode.nvim",
    "MunifTanjim/nui.nvim",

    "bkad/camelcasemotion",
    "ThePrimeagen/harpoon",
    "tpope/vim-commentary",

    "eandrju/cellular-automaton.nvim",
    "dbinagi/nomodoro",


    -- indicate what has changed in git repo
       "lewis6991/gitsigns.nvim",

    -- like magit for emacs
    {
        "NeogitOrg/neogit",
        dependencies = "nvim-lua/plenary.nvim",
        config = true
    },

    -- Debugger UI
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap"}
    },


    -- Surround text with quotes etc
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    },


    -- highlight current scope
    {

        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },

    },


    -- Automagically close () "" and so on
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },



    -- better status line than stock one
    {
        "nvim-lualine/lualine.nvim",
        dependencies =
        {
            "nvim-tree/nvim-web-devicons",
            opt = true
        }
    },


    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require('colorizer').setup()
        end,
    },


    -- LEARN HJKL DAMMIT
    {
      "m4xshen/hardtime.nvim",
      lazy = true,
      opts = {}
    },


    -- modern ui
    {
        "folke/noice.nvim",
        config = function ()
            require("plugins.noice")
        end
    },


    -- dashboard and start page
    {
        "willothy/veil.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim"
        },
    },





    -- size does not matter
    {
        'echasnovski/mini.nvim',
        version = false,
    },


    -- File manager who?
    {
        "ms-jpq/chadtree",
        version = 'chad',
        build = 'python3 -m chadtree deps',
    },


    -- need that syntax highlight amirite
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },


    -- the name says it all
    {
        "SirVer/ultisnips",
        lazy = true
    },

    -- That shmexy latex plugin
    {
        "lervag/vimtex",
        lazy = true
    },

    -- DAMN, org mode?
    {
        "nvim-neorg/neorg",
        lazy = true
    },


    -- Cool screensaver !!
    {
        "folke/drop.nvim",
        event = "VimEnter",
    },


    -- this is pure magic, i love this guy
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
      }
    },

})








vim.opt.laststatus=2

vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { expr = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })


