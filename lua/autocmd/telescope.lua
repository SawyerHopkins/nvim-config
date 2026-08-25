local autoCmdUtils = require('utils.autocmd')

vim.api.nvim_create_autocmd('User', {
  desc = 'Apply formatting to telescope preview window',
  group = autoCmdUtils.augroup("telescope-preview-fmt"),
  pattern = 'TelescopePreviewerLoaded',
  callback = function(args)
    if args.data.filetype ~= 'help' then
      vim.wo.number = true
    elseif args.data.bufname:match('*.csv') then
      vim.wo.wrap = false
    end
  end,
})

