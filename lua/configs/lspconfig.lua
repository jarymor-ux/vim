require("nvchad.configs.lspconfig").defaults()

local servers = { "gopls", "ts_ls", "html"}


vim.lsp.enable(servers)
