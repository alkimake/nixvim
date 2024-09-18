[
  {
    mode = "n";
    key = "<leader>ba";
    action.__raw = "function() vim.b.autoformat = not vim.b.autoformat end";
    options.desc = "Toggle autoformat";
  }
  {
    mode = "n";
    key = "<leader>lf";
    action.__raw = "function() vim.g.lsp_format_enabled = not vim.g.lsp_format_enabled end";
    options.desc = "Toggle LSP formatting";
  }
]
