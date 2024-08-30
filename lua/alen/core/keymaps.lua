local map = vim.keymap

-- Setting no highlight
map.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
map.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Split windows
map.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
map.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
map.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
map.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Creating and shifting to tabs
map.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
map.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
map.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
map.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
map.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Telescope
map.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
map.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find in recent files" })
map.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
map.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
map.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
map.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffer" })
map.set("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "Find references (LSP)" })

-- DAP
map.set("n", "<F5>", function()
  require("dap").continue()
end)

map.set("n", "<F10>", function()
  require("dap").step_over()
end)

map.set("n", "<F11>", function()
  require("dap").step_into()
end)

map.set("n", "<F12>", function()
  require("dap").step_out()
end)

map.set("n", "<leader>b", function()
  require("dap").toggle_breakpoint()
end, { desc = "Dap: Toggle Breakpoint" })

map.set("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Set Breakpoint" })

-- toggleterm
map.set(
  "n",
  "<leader>th",
  "<cmd>ToggleTerm size=10 direction=horizontal<CR>",
  { desc = "Toggle terminal horizontally" }
)

map.set("n", "<leader>tv", "<cmd>ToggleTerm size=40 direction=vertical<CR>", { desc = "Toggle terminal vertically" })

-- Telescope bookmarks
map.set("n", "<leader>fbm", function()
  require("telescope").extensions.bookmarks.list()
end, { desc = "Telescope list bookmarks" })

map.set("n", "<leader>dn", function()
  require("jdtls").test_nearest_method()
end)

-- Codesnap
map.set("x", "<leader>cc", "<cmd>CodeSnap<CR>", { desc = "Save selected code snapshot into clipboard" })
map.set("x", "<leader>cs", "<cmd>CodeSnapSave<CR>", { desc = "Save selected code snapshot into ~/Pictures" })
