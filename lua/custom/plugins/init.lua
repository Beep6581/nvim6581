-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'stevearc/conform.nvim',
    cmd = { 'ConformInfo' },

    keys = {
      {
        '<leader>f',
        function()
          require('conform').format {
            async = true,
            lsp_format = 'fallback',
          }
        end,
        mode = { 'n', 'x' },
        desc = 'Format buffer or selection',
      },
    },

    opts = {
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = 'fallback',
      },

      formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        objc = { 'clang-format' },
        objcpp = { 'clang-format' },
        lua = { 'stylua' },
        python = { 'ruff_format' },
      },

      formatters = {
        ['clang-format'] = {
          prepend_args = {
            '--fallback-style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}',
          },
        },
      },
    },
  },
}
