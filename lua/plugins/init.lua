return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require "configs.conform",
	},

	-----TESTING
	---{
		---import = "nvchad.blink.lazyspec"
	---},



	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "configs.lspconfig"
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },

			-- optional picker via telescope
			{ "nvim-telescope/telescope.nvim" },
			-- optional picker via fzf-lua
			{ "ibhagwan/fzf-lua" },
			-- .. or via snacks
			{
				"folke/snacks.nvim",
				opts = {
					terminal = {},
				}
			}
		},
		event = "LspAttach",
		opts = {},
	},

	{
		"mfussenegger/nvim-dap",
		lazy = true,
		-- Copied from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and
		-- modified.
		keys = {
			{
				"<leader>db",
				function() require("dap").toggle_breakpoint() end,
				desc = "Toggle Breakpoint"
			},

			{
				"<leader>dc",
				function() require("dap").continue() end,
				desc = "Continue"
			},

			{
				"<leader>dC",
				function() require("dap").run_to_cursor() end,
				desc = "Run to Cursor"
			},

			{
				"<leader>dT",
				function() require("dap").terminate() end,
				desc = "Terminate"
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		config = true,
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI"
			},
		},
		dependencies = {
			-- keep-sorted start block=yes
			{
				"jay-babu/mason-nvim-dap.nvim",
				---@type MasonNvimDapSettings
				opts = {
					-- This line is essential to making automatic installation work
					-- :exploding-brain
					handlers = {},
					automatic_installation = {
						-- These will be configured by separate plugins.
						exclude = {
							"delve",
							"gdb",
						},
					},

				},
				dependencies = {
					"mfussenegger/nvim-dap",
					"williamboman/mason.nvim",
				},
			},
			{
				"leoluz/nvim-dap-go",
				config = true,
				dependencies = {
					"mfussenegger/nvim-dap",
				},
				keys = {
					{
						"<leader>dt",
						function() require('dap-go').debug_test() end,
						desc = "Debug test"
					},
				},
			},
			{
				"nvim-neotest/nvim-nio",
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				config = true,
				dependencies = {
					"mfussenegger/nvim-dap",
				},
			},
			-- keep-sorted end
		},
		{
			"kdheepak/lazygit.nvim",
			lazy = true,
			cmd = {
				"LazyGit",
				"LazyGitConfig",
				"LazyGitCurrentFile",
				"LazyGitFilter",
				"LazyGitFilterCurrentFile",
			},
			-- optional for floating window border decoration
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			-- setting the keybinding for LazyGit with 'keys' is recommended in
			-- order to load the plugin when the command is run for the first time
			keys = {
				{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
			}
		},
	},
}
