return {
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
				render_modes = { "n", "c", "t", "i" },
				link = {
						enabled = true,
						render_modes = false,
						footnote = {
								enabled = true,
								superscript = true,
								prefix = '',
								suffix = '',
						},
						image = '󰥶 ',
						email = '󰀓 ',
						hyperlink = '󰌹 ',
						highlight = 'RenderMarkdownLink',
						wiki = {
								icon = '󱗖 ',
								body = function()
										return nil
								end,
								highlight = 'RenderMarkdownWikiLink',
						},
						custom = {
								web = { pattern = '^http', icon = '󰖟 ' },
								discord = { pattern = 'discord%.com', icon = '󰙯 ' },
								github = { pattern = 'github%.com', icon = '󰊤 ' },
								gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
								google = { pattern = 'google%.com', icon = '󰊭 ' },
								neovim = { pattern = 'neovim%.io', icon = ' ' },
								reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
								stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
								wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
								youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
						},
				},
		}
} 
