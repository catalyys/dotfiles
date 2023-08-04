local current_day = os.date("%A")

local builtin = require("veil.builtin")



require("veil").setup({
    sections = {
        builtin.sections.animated(builtin.headers.frames_days_of_week[current_day], {
            hl = { fg = "#5de4c7" },
        }),

    builtin.sections.buttons({
        {
            icon = "",
            text = "Config",
            shortcut = "c",
            callback = function()
	require("telescope").extensions.file_browser.file_browser({
	    path = vim.fn.stdpath("config"),
	})
            end,
        },

        {
            icon = "",
            text = "Find Files",
            shortcut = "f",
            callback = function()
	require("telescope.builtin").find_files()
            end,
        },

        {
            icon = "",
            text = "Grep",
            shortcut = "g",
            callback = function()
	require("telescope.builtin").live_grep()
            end,
        },

        {
            icon = "",
            text = "Buffers",
            shortcut = "b",
            callback = function()
	require("telescope.builtin").buffers()
            end,
        },
    }),

        builtin.sections.oldfiles(),
    },

    startup = true,
    listed = true
})



