require("dapui").setup({
    icons = {expanded = "▾", collapsed = "▸"},
    mappings = {
        -- Use a table to apply multiple mappings
        expand = {"<CR>", "<2-LeftMouse>"},
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r"
    },
    sidebar = {
        open_on_start = true,
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
                id = "scopes",
                size = 0.25 -- Can be float or integer > 1
            }, {id = "breakpoints", size = 0.25}, {id = "stacks", size = 0.25}, {id = "watches", size = 00.25}
        },
        size = 60,
        position = "left" -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        open_on_start = true,
        elements = {"repl"},
        size = 15,
        position = "bottom" -- Can be "left", "right", "top", "bottom"
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats wil be treated as percentage of your screen.
        mappings = {close = {"q", "<Esc>"}}
    },
    windows = {indent = 1}
})
