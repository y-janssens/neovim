return {
	{
		"petertriho/nvim-scrollbar",
		branch = "v1",
		lazy = false,
		keys = {
			{ "<leader>uM", "<cmd>ScrollbarToggle<cr>", desc = "Toggle Diagnostic Scrollbar" },
		},
		opts = {
			hide_if_all_visible = false,
			handlers = {
				diagnostic = true,
			},
			excluded_buftypes = { "terminal", "nofile", "prompt", "quickfix" },
		},
	},
}
