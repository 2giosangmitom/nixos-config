return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		linters_by_ft = {},
	},
	config = function(_, opts)
		require("lint").linters_by_ft = opts.linters_by_ft

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
