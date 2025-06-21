require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- nvim controll
map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "i", "v" }, "jj", "<ESC>")

-- show filepath
map("n", "pp", function()
	local path = vim.fn.expand("%:p")
	print(path)
end, { desc = "Show full file path" })

-- quickfix
map("n", "qq", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

-- telescope
local teleb = require("telescope.builtin")
map("n", "<leader>ff", teleb.find_files, { desc = "Find files" })
map("n", "<leader>fw", teleb.live_grep, { desc = "Find file by word" })

-- lsp
map("n", "ff", vim.lsp.buf.format, { desc = "Format file" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Defenition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implemented interfaces" })
map("n","gr", vim.lsp.buf.references, {desc = "Go to references"})

-- split
map("n", "<leader>s", ":vsplit<Enter>", { desc = "Vertical split" })
map("n", "<leader>e", ":NvimTreeToggle<Enter>", { desc = "Open/Close Explorer" })

-- diagnostics
map("n", "<leader>fd", ":Telescope diagnostics <CR>", { desc = "Telescope Diagnostic File" })

-- code running
map("n", "<leader>gor", ":!go run %<Enter>", {desc = "Run Golang File"})

--git
map("n","<leader>lg", ":LazyGit<Enter>", {desc = "Run LazyGit"})
--OpenGl(Cmake)
map("n","<leader>gcr", ":!make && ./gl_test<Enter>", {desc = "Run OpenGL Cmake Task"})
