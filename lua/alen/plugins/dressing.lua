local M = {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
}

M.config = function()
  local dressing = require("dressing")

  local opts = {
    input = {
      enabled = true,
      default_prompt = "Input",
      trim_prompt = true,
      title_pos = "left",
      start_in_insert = true,
      border = "rounded",
      relative = "cursor",
    },
    select = {
      enabled = true,
      backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
      trim_prompt = true,
      telescope = require("telescope.themes").get_cursor(),

      fzf = {
        window = {
          width = 0.5,
          height = 0.4,
        },
      },
      fzf_lua = {},
    },
    nui = {
      position = "50%",
      size = nil,
      relative = "editor",
      border = {
        style = "rounded",
      },
      buf_options = {
        swapfile = false,
        filetype = "DressingSelect",
      },
      win_options = {
        winblend = 0,
      },
      max_width = 80,
      max_height = 40,
      min_width = 40,
      min_height = 10,
    },

    builtin = {
      -- Display numbers for options and set up keymaps
      show_numbers = true,
      -- These are passed to nvim_open_win
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "editor",

      buf_options = {},
      win_options = {
        cursorline = true,
        cursorlineopt = "both",
      },

      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- the min_ and max_ options can be a list of mixed types.
      -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
      width = nil,
      max_width = { 140, 0.8 },
      min_width = { 40, 0.2 },
      height = nil,
      max_height = 0.9,
      min_height = { 10, 0.2 },

      -- Set to `false` to disable
      mappings = {
        ["<Esc>"] = "Close",
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
      },

      override = function(conf)
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        return conf
      end,
    },
  }
end

return M
