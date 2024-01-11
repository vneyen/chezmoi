local M = {
   'nvim-treesitter/nvim-treesitter',
   build = ':TSUpdate',
}

function M.config()
   require('nvim-treesitter.configs').setup{
      ensure_installed = {
         'bash', 'c', 'go', 'python',
         'lua', 'query', 'vim', 'vimdoc',
--         'markdown', 'markdown_inline',
      },
      auto_install = false,
      sync_install = false,
      highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
      },
      indent = { enable = true, },
   }
end

return M
