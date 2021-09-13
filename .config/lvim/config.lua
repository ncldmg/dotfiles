-- General
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "material"
vim.g.material_style = "mariana"
vim.g.material_italic_comments = true
vim.g.material_italic_string = false
vim.g.material_italic_keywords = false
vim.g.material_italic_functions = false
vim.g.material_italic_variables = false

-- Basic key mappings
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-Up>"] = ""

-- Project navigator
require('telescope').setup {
    extensions = {
        project = {
            base_dirs = {'~/Projects', max_depth = 4}
            -- hidden_files = true -- default: false
        }
    }
}
lvim.builtin.which_key.mappings["P"] = {"<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<cr>", "Projects"}

-- Active lunarvim predefined plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.lualine.active = true
lvim.builtin.dap.active = true
lvim.builtin.nvimtree.show_icons.git = 1

-- Lualine config
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.extensions = {"nvim-tree"}
lvim.builtin.lualine.options = {disabled_filetypes = {'minimap'}}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = {"haskell"}
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"}, {
        "ray-x/lsp_signature.nvim",
        config = function()
            require"lsp_signature".on_attach()
        end,
        event = "InsertEnter"
    }, {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }, {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    -- height and width can be:
                    -- * an absolute number of cells when > 1
                    -- * a percentage of the width / height of the editor when <= 1
                    -- * a function that returns the width or the height
                    width = 180, -- width of the Zen window
                    height = 1, -- height of the Zen window
                    -- by default, no options are changed for the Zen window
                    -- uncomment any of the options below, or add other vim.wo options you want to apply
                    options = {
                        -- signcolumn = "no", -- disable signcolumn
                        -- number = false, -- disable number column
                        -- relativenumber = false, -- disable relative numbers
                        -- cursorline = false, -- disable cursorline
                        -- cursorcolumn = false, -- disable cursor column
                        -- foldcolumn = "0", -- disable fold column
                        -- list = false, -- disable whitespace characters
                    }
                },
                plugins = {
                    -- disable some global vim options (vim.o...)
                    -- comment the lines to not apply the options
                    options = {
                        enabled = true,
                        ruler = false, -- disables the ruler text in the cmd line area
                        showcmd = false -- disables the command in the last line of the screen
                    },
                    twilight = {enabled = true}, -- enable to start Twilight when zen mode opens
                    gitsigns = {enabled = false}, -- disables git signs
                    tmux = {enabled = false}, -- disables the tmux statusline
                    -- this will change the font size on kitty when in zen mode
                    -- to make this work, you need to set the following kitty options:
                    -- - allow_remote_control socket-only
                    -- - listen_on unix:/tmp/kitty
                    kitty = {
                        enabled = false,
                        font = "+4" -- font size increment
                    }
                },
                -- callback where you can add custom code when the Zen window opens
                on_open = function()
                end,
                -- callback where you can add custom code when the Zen window closes
                on_close = function()
                end
            }
        end
    }, {"hashivim/vim-terraform"}, {"rcarriga/nvim-dap-ui"}, {"theHamsta/nvim-dap-virtual-text"}, {"nvim-telescope/telescope-dap.nvim"},
    {"ray-x/material_plus.nvim"}, {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            vim.g.indentLine_enabled = 1
            vim.g.indent_blankline_char = "▏"
            vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
            vim.g.indent_blankline_buftype_exclude = {"terminal"}
            vim.g.indent_blankline_show_trailing_blankline_indent = false
            vim.g.indent_blankline_show_first_indent_level = false
        end
    }, {
        'wfxr/minimap.vim',
        run = "cargo install --locked code-minimap",
        cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
        config = function()
            vim.cmd("let g:minimap_width = 10")
            vim.cmd("let g:minimap_auto_start = 1")
            vim.cmd("let g:minimap_auto_start_win_enter = 1")
            vim.cmd("let g:minimap_highlight_range = 1")
            vim.cmd("let g:minimap_git_colors = 1")
        end
    }, {"sindrets/diffview.nvim", event = "BufRead"}, {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd "highlight default link gitblame SpecialComment"
            vim.g.gitblame_enabled = 0
        end
    }, {
        "ruifm/gitlinker.nvim",
        event = "BufRead",
        config = function()
            require("gitlinker").setup {
                opts = {
                    -- remote = 'github', -- force the use of a specific remote
                    -- adds current line nr in the url for normal mode
                    add_current_line_on_normal_mode = true,
                    -- callback for what to do with the url
                    action_callback = require("gitlinker.actions").open_in_browser,
                    -- print the url after performing the action
                    print_url = false,
                    -- mapping to call url generation
                    mappings = "<leader>gy"
                }
            }
        end,
        requires = "nvim-lua/plenary.nvim"
    }, {"pwntester/octo.nvim", event = "BufRead"}, {
        "tpope/vim-fugitive",
        cmd = {"G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit"},
        ft = {"fugitive"}
    }, {"p00f/nvim-ts-rainbow"}, {"nvim-treesitter/playground", event = "BufRead"}, {
        "nvim-telescope/telescope-project.nvim",
        event = "BufWinEnter",
        setup = function()
            vim.cmd [[packadd telescope.nvim]]
        end
    }, {"ellisonleao/glow.nvim"}, {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb', 'j', 'k'},
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil, -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil -- Function to run after the scrolling animation ends
            })
        end
    }, {"folke/todo-comments.nvim", event = "BufRead"}, {"felipec/vim-sanegx", event = "BufRead"}, {
        "folke/lua-dev.nvim",
        config = function()
            local luadev = require("lua-dev").setup({lspconfig = lvim.lang.lua.lsp.setup})
            lvim.lang.lua.lsp.setup = luadev
        end
    }, {"tzachar/compe-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-compe", event = "InsertEnter"}
}

-- Location of glow binary for md preview
vim.g.glow_binary_path = "/usr/local/bin"
-- vim.api.nvim_set_var("compe.source.tabnine", "true")
-- vim.api.nvim_set_vvar("compe.source.tabnine", true)

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {{"BufWinEnter", "*.lua", "setlocal ts=8 sw=8"}}
lvim.builtin.nvimtree.icons.git.untracked = "★"

-- Overwrite lunarvim config
-- nvim-tree should not automatically change root directory
vim.g.nvim_tree_width = 80
lvim.builtin.project.manual_mode = true

-- Go setup
lvim.lang.go.formatters = {{exe = "gofumpt"}}

-- Debuggin config
require("debugconfig")
-- Formatting config
require("langconfig")
-- Trouble config
require("trouble")
-- Git config
require("gitconfig")
-- Lang config (LSP, formatting ...)
require("troubleconfig")
-- Keymapping config
require("keymapconfig")
