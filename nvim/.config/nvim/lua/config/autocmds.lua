local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("markdown_conceal"),
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.conceallevel = 1
  end,
})
