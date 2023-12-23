vim.opt.termguicolors = true
vim.opt.cmdheight = 0  -- more space in the neovim command line for displaying messages
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4    -- insert 2 spaces for a tab
vim.opt.wrap = false   -- wrap lines
vim.opt.number = false -- remove line numbers

lvim.leader = "space"
lvim.colorscheme = "catppuccin-frappe"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<C-h>"] = ":TmuxNavigateLeft<cr>"
lvim.keys.normal_mode["<C-j>"] = ":TmuxNavigateUp<cr>"
lvim.keys.normal_mode["<C-k>"] = ":TmuxNavigateDown<cr>"
lvim.keys.normal_mode["<C-l>"] = ":TmuxNavigateRight<cr>"

lvim.keys.normal_mode["<M-h>"] = ":SmartResizeLeft<cr>"
lvim.keys.normal_mode["<M-j>"] = ":SmartResizeUp<cr>"
lvim.keys.normal_mode["<M-k>"] = ":SmartResizeDown<cr>"
lvim.keys.normal_mode["<M-l>"] = ":SmartResizeRight<cr>"

-- LSP key mappings
-- vim.diagnostics.config({ virtual_text = true })
lvim.builtin.treesitter.highlight.enable = true

lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Go to definitions" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "Go to references" }
lvim.lsp.buffer_mappings.normal_mode["gI"] = { "<cmd>Telescope lsp_implementations<cr>", "Go to implementations" }

-- Git key mappings
lvim.builtin.which_key.mappings["gg"] = { "<cmd>:Neogit<CR>", "Neogit" }

lvim.builtin.terminal.open_mapping = "<c-t>"

-- plugins
lvim.plugins = {
    { "catppuccin/nvim",               name = "catppuccin", priority = 1000 },
    { "christoomey/vim-tmux-navigator" },
    {
        "TimUntersberger/neogit",
        dependencies = "nvim-lua/plenary.nvim",
    },
    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = { enabled = false },
            })
        end,
    },
    {
        "mrjones2014/smart-splits.nvim",
        config = function()
            require("smart-splits").setup({})
        end,
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
}

lvim.format_on_save.enabled = true
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { name = "gofmt" },
    { name = "gofumpt" },
    { name = "goimports" },
    { name = "golines" },
    { name = "goimports_reviser" },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { exe = "golangci_lint", filetypes = { "go" }, },
    {
        name = "shellcheck",
        args = { "--severity", "warning" },
    },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
    {
        name = "proselint",
    },
}
