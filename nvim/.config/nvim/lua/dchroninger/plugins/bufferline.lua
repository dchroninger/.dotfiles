require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator=function ()
            return ' '
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true
            }
        },
    }
})
