return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			-- css = { "prettierd" },
			-- html = { "prettierd" },
			-- markdown = { "prettierd" },
			-- c = { "clang-format" },
			-- cpp = { "clang-format" },
		},

		format_after_save = false,
		format_on_keystroke = false,

		format_on_save = function(bufnr)
			local ignore_filetypes = {
				-- "c",
				-- "cpp",
			}
			if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
				return
			end
			return { timeout_ms = 500, lsp_fallback = true }
		end,
	},
}
