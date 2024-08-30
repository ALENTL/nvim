local M = {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-dap.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local transform_mod = require("telescope.actions.mt").transform_mod
  local trouble = require("trouble")
  local trouble_telescope = require("trouble.sources.telescope")

  local custom_actions = transform_mod({
    open_trouble_qflist = function(prompt_bufnr)
      trouble.toggle("quickfix")
    end,
  })

  telescope.setup({
    path_display = { "smart" },
    defaults = {
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
          ["<C-t>"] = trouble_telescope.open,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("bookmarks")
  telescope.load_extension("ui-select")
  telescope.load_extension("dap")
end

return M
