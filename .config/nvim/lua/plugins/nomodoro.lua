require('nomodoro').setup({
    work_time = 25,
    break_time = 5,
    menu_available = true,

    texts = {
        on_break_complete = "Break is over!",
        on_work_complete = "Take a break!",
        status_icon = "羽",
        timer_format = '!%0M:%0S' -- To include hours: '!%0H:%0M:%0S'
    },

    -- force break time yaaay
    on_work_complete = function()
        vim.cmd('CellularAutomaton make_it_rain')
    end,

    -- resume 
    on_break_complete = function()
        vim.cmd('Veil')
    end
})


-- Show timer status in lualine, on the right
require('lualine').setup({
    sections = {
        lualine_x = {
            require('nomodoro').status,
        }
    }
})
