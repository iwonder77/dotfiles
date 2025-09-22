return {
  'mfussenegger/nvim-lint',
  config = function()
    -- Load the plugin
    local lint = require('lint')

    -- Specify linters by filetype
    lint.linters_by_ft = {
      python = { 'ruff' },
    }

    -- Auto lint upon entering buffer, on save, and on leaving insert mode
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('lint', { clear = true }),
      callback = function()
        lint.try_lint()
      end
    })
  end
}
