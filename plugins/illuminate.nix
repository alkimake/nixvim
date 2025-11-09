_: {
  opts = {
    enable = true;
    settings = {
      delay = 200;
      filetypes_denylist = ["dirbuf" "dirvish" "fugitive" "toggleterm" "lazygit" "TelescopePrompt"];
      large_file_overrides.providers = ["lsp"];
      min_count_to_highlight = 2;
      large_file_cutoff = 10000;
      should_enable.__raw = "function(bufnr) return vim.api.nvim_buf_is_valid(bufnr) end";
    };
  };

  rootOpts.keymaps = [
    {
      mode = "n";
      key = "]r";
      action.__raw = "function() require('illuminate').goto_next_reference(false) end";
      options.desc = "Next reference";
    }
    {
      mode = "n";
      key = "[r";
      action.__raw = "function() require('illuminate').goto_prev_reference(false) end";
      options.desc = "Previous reference";
    }
    {
      mode = "n";
      key = "<leader>ur";
      action.__raw = "function() require('illuminate').toggle_buf() end";
      options.desc = "Toggle reference highlighting (buffer)";
    }
    {
      mode = "n";
      key = "<leader>uR";
      action.__raw = "function() require('illuminate').toggle() end";
      options.desc = "Toggle reference highlighting (global)";
    }
  ];
}
