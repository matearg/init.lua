require('rose-pine').setup({
    disable_background = true,
    disable_float_background = true,
})

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
