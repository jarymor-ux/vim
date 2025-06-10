require("nvchad.configs.lspconfig").defaults()

local servers = { "gopls", "sqls" }


vim.lsp.enable(servers)
