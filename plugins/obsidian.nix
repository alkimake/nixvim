_: {
  opts = {
    enable = true;
    settings = {
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };
      new_notes_location = "notes_subdir";
      workspaces = [
        {
          name = "work";
          path = "~/Documents/obsidian/vault";
        }
      ];
      daily_notes = {
        template = "Extras/Templates/Daily Note.md";
        folder = "%Y/%m-%MMMM/%Y-%m-%d-%D";
      };
      mappings = {
        gf = {
          action = "require('obsidian').util.gf_passthrough";
          opts = {
            noremap = false;
            expr = true;
            buffer = true;
          };
        };
        "<leader>ch" = {
          action = "require('obsidian').util.toggle_checkbox";
          opts.buffer = true;
        };
      };
      templates = {
        subfolder = "Extras/Templates";
      };
    };
  };
}
