_: {
  opts = {
    enable = true;
    settings = {
      delete_to_trash = true;
      use_default_keymaps = true;
      lsp_file_method.autosave_changes = true;
      skip_confirm_for_simple_edits = true;
      buf_options = {
        buflisted = true;
        bufhidden = "hide";
      };
      view_options = {
        show_hidden = true;
      };
      float = {
        padding = 10;
      };
    };
  };
  rootOpts = {
    keymaps = [
      {
        action = "<cmd> Oil --float <CR>";
        key = "-";
        options = {
          desc = "Open parent directory";
        };
        mode = [
          "n"
        ];
      }
    ];
  };
}
