return {
	"ggandor/leap.nvim",
	keys = { "s" },
	config = function()
		require('leap').add_default_mappings()
	end
}
