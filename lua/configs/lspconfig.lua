require("nvchad.configs.lspconfig").defaults()

local servers = { "gopls", "ts_ls", "html", "clangd"}


vim.lsp.enable(servers)
