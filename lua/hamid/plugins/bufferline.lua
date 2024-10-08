return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		highlights = {
			fill = { bg = "#181826" },
			buffer_selected = { bold = true },
			diagnostic_selected = { bold = true },
			info_selected = { bold = true },
			info_diagnostic_selected = { bold = true },
			warning_selected = { bold = true },
			warning_diagnostic_selected = { bold = true },
			error_selected = { bold = true },
			error_diagnostic_selected = { bold = true },
		},
		options = {
			show_close_icon = false,
			diagnostics = "nvim_lsp",
			max_prefix_length = 8,
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				if context.buffer:current() then
					return ""
				end
				if level:match("error") then
					return " " .. vim.g.diagnostic_icons.Error
				elseif level:match("warning") then
					return " " .. vim.g.diagnostic_icons.Warning
				end
				return ""
			end,
			custom_filter = function(buf_number, buf_numbers)
				if vim.bo[buf_number].filetype ~= "oil" then
					return true
				end
			end,
		},
	},
	config = function()
		require("bufferline").setup({
			-- You can add any additional setup options here
		})

		-- Key mappings
		vim.keymap.set("n", "gb", "<CMD>BufferLinePick<CR>")
		vim.keymap.set("n", "<leader>ts", "<CMD>BufferLinePickClose<CR>")
		vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>")
		vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>")
		vim.keymap.set("n", "]b", "<CMD>BufferLineMoveNext<CR>")
		vim.keymap.set("n", "[b", "<CMD>BufferLineMovePrev<CR>")
		vim.keymap.set("n", "gs", "<CMD>BufferLineSortByDirectory<CR>")
	end,
}
