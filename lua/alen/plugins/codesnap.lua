local M = {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  event = "VeryLazy",
}

function M.config()
  local codesnap = require("codesnap")

  codesnap.setup({
    save_path = "~/Pictures",
    has_breadcrumbs = true,
    bg_theme = "bamboo",
    show_workspace = true,
    has_line_number = true,
    watermark = "",
    watermark_font_family = "FiraCode Nerd Font",
  })
end

return M
