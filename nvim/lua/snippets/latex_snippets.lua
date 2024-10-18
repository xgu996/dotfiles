local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep

return{
	tex = {
		s("frac", {
			t("\\frac{"),
			i(1),
			t("}{"),
			i(2),
			t("}"),
		}),
	}
}
