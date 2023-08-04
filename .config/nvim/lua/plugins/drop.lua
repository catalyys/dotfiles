require('drop').setup
{
    ---@type DropTheme|string
    theme = "leaves", -- can be one of rhe default themes, or a custom theme
    max = 15, -- maximum number of drops on the screen
    interval = 100, -- every 100ms we update the drops
    screensaver = 1000 * 60 * 3, -- show after 3 minutes. Set to false, to disable
    filetypes = { "veil" }, -- will enable/disable automatically for the following filetypes
}
