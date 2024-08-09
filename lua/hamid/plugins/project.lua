return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			-- Manual mode doesn't automatically change your root directory, so you have
			-- the option to manually do so using `:ProjectRoot` command.
			manual_mode = false,

			-- Methods of detecting the root directory. **"lsp"** uses the native neovim
			-- lsp, while **"pattern"** uses vim-rooter like pattern matching. Here
			-- order matters: if one is not detected, the next in line will be used.
			detection_methods = { "lsp", "pattern" },

			-- Patterns used to detect root directory. Can be a filename or directory.
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

			-- Table of lsp clients to ignore by name
			-- eg: { "efm", ... }
			ignore_lsp = {},

			-- Don't calculate root dir on specific directories
			-- Ex: { "~/.cargo/*", ... }
			exclude_dirs = {},

			-- Show hidden files in telescope
			show_hidden = false,

			-- When set to false, you will get a message when project.nvim changes your
			-- directory.
			silent_chdir = true,

			-- What scope to change the directory, valid options are
			-- * global (default)
			-- * tab
			-- * win
			scope_chdir = "global",

			-- Path where project.nvim will store the project history for use in
			-- telescope
			datapath = vim.fn.stdpath("data"),
		})
	end,
}
