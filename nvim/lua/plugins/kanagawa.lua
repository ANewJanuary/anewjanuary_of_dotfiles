return {
	"rebelot/kanagawa.nvim",
	config=function()
		require('kanagawa').setup({
			compile = true,             
			undercurl = true,           
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true},
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = true,       
			dimInactive = false,        
			terminalColors = true,       
			colors = {                   
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) 
				return {
						["@markup.link.url.markdown_inline"] = { link = "Special" },
						["@markup.link.label.markdown_inline"] = { link = "WarningMsg" },
						["@markup.italic.markdown_inline"] = { link = "Exception" },
						["@markup.list.markdown"] = { link = "Function" },
						["@markup.list.checked.markdown"] = { link = "WarningMsg" },
						["@markup.quote.markdown"] = { link = "Error" },
				}
			end,
			theme = "dragon",             
			background = {               
				dark = "wave",           
				light = "lotus"
			},
		});
		vim.cmd("colorscheme kanagawa");
	end,
	build = function()
		vim.cmd("KanagawaCompile");
	end 
}
