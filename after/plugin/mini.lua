-- require("mini.cursorword").setup({})
-- require("mini.indentscope").setup({})
require("mini.statusline").setup({ use_icons = true })
require("mini.comment").setup({})
require("mini.pairs").setup({})
require("mini.git").setup({})
require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = "+", change = "~", delete = "-" },
  },
})
