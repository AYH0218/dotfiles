return {
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
			float = {
				transparent = true, -- enable transparent floating windows
				-- solid = false, -- use solid styling for floating windows, see |winborder|
			},
			default_integrations = true,
			auto_integrations = false,
			integrations = {
				cmp = true,
				gitsigns = true,
				telescope = true,
				notify = true,
				mini = true,
				neotree = true,
				bufferline = true,
			},
		},
	},

	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		priority = 1000,
		opts = {
			-- 使用するバリアント (nightfox, dayfox, duskfox, nordfox, terafox)
			variant = "duskfox",
			options = {
				transparent = true,
				styles = {
					comments = "italic",
					keywords = "bold",
				},
			},
			palettes = {
				duskfox = {
					-- bg1 = "#000000", -- Black background
					-- bg0 = "NONE", -- Alt backgrounds (floats, statusline, ...)
					-- bg3 = "#121820", -- 55% darkened from stock
					-- sel0 = "#131b24", -- 55% darkened from stock
					-- sel1 = "#131b24", -- 55% darkened from stock
					-- fg0 = "#000000",
					-- fg1 = "#000000",
					-- fg2 = "#121820",
					-- fg3 = "#000000",
				},
			},
		},
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
