local M = {
  "windwp/nvim-ts-autotag",
  event = "VeryLazy",
}

M.config = function()
  local status, autotag = pcall(require, "nvim-ts-autotag")

  if not status then
    return
  end

  autotag.setup({})
end

return M
