-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'mason-org/mason.nvim',
    version = '^2',
    opts = {}, -- Lazy will call require("mason").setup({})
  },

  {
    'mason-org/mason-lspconfig.nvim',
    version = '^2',
    opts = {
      -- optional: auto-install some LSPs
      ensure_installed = { 'clangd', 'pyright', 'lua_ls' },
    },
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim', 'mason-org/mason-lspconfig.nvim' },
    opts = {
      -- optional: have it ensure these tools are installed
      ensure_installed = {
        -- C / C++
        'clang-format',
        'cpplint',

        -- Python
        'ruff',
      },
      run_on_start = true,
      start_delay = 500,
    },
  },

  {
    'neovim/nvim-lspconfig',
    version = '^2',
    config = function()
      -- C / C++: clangd with clang-tidy enabled
      vim.lsp.config('clangd', { cmd = { 'clangd', '--clang-tidy' } })
      -- reads your .clang-tidy
      -- If you use compile_commands.json, clangd will pick it up automatically.
      -- For ESP-IDF or custom toolchains, point clangd to the correct compile_commands.json.

      -- Python: Ruff LSP for ultra-fast diagnostics (and fixes)
      -- (Use Black for formatting; see Conform config below.)
      vim.lsp.config('ruff', {})

      -- Python typing
      vim.lsp.config('pyright', {})

      vim.lsp.enable { 'clangd', 'ruff', 'pyright' }
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = function(bufnr)
        return { timeout_ms = 1000, lsp_fallback = true }
      end,
      formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        python = { 'ruff_format' },
      },
    },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = { 'n', 'v' },
        desc = 'Format buffer or selection',
      },
    },
  },
}
