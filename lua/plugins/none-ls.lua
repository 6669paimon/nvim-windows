return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			debug = false,
			sources = {
				-- Lua
				formatting.stylua,
				-- Python
				formatting.black.with({
					extra_args = { "--fast" },
				}),
				-- Javascript/Typscript/HTML/CSS/JSON
				formatting.prettier.with({
					prefer_local = "node_modules/.bin",
				}),
				-- C/C++
				formatting.clang_format,
			},

			-- Format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								timeout_ms = 2000,
							})
						end,
					})
				end
			end,
		})
	end,
}
