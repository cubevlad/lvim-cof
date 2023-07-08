-- Reload all user Plugins
reload('user.plugins')
reload('user.colorscheme')
reload('user.options')
reload('user.keymaps')
reload('user.which-key')
reload('user.lsp')
reload('user.dashboard')
reload('user.autocmds')

-- Setup formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
  {
    command = "eslint_d",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
      "json",
    }
  },
  { command = "stylelint", filetypes = { "scss", "less", "css", "sass" }, args = { "--fix", "--stdin" } },
}

-- Setup linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
  { command = "stylelint", filetypes = { "scss", "less", "css", "sass" }, args = { "--fix", "--stdin" } },
  {
    name = "eslint_d",
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript",
      "javascriptreact" },
  }
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint",
  },
}

-- Set up formating on save
lvim.format_on_save.enabled = true

lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}
