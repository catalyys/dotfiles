local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()




-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = true}),



        -- Cycle with tab, as intended by divine creation
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
	cmp.select_next_item()
            else
	fallback()
            end
        end, {"i", "s"}),


        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
	cmp.select_prev_item()
            else
            fallback()
            end
        end, {"i", "s"}),


        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }
})
