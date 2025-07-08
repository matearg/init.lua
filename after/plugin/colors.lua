require('catppuccin').setup({
    transparent_background = true
})

function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
