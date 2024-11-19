_: {
  opts = {
    enable = true;
    enableLspFormat = false;
    settings = {
      updateInInsert = false;
    };
    sources = {
      code_actions = {
        gitsigns.enable = false;
        statix.enable = true;
      };
      diagnostics = {
        statix.enable = true;
        yamllint.enable = true;
      };
      formatting = {
        alejandra.enable = true;
        black = {
          enable = true;
          settings = {
            withArgs = ''
              {
                extra_args = { "--fast" },
              }
            '';
          };
        };
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
          settings = {
            withArgs = ''
              {
                extra_args = { "--no-semi", "--single-quote" },
              }
            '';
          };
        };
        stylua.enable = true;
        yamlfmt.enable = true;
      };
    };
  };
  rootOpts = {
    keymaps = [
      {
        mode = ["n" "v"];
        key = "<leader>cf";
        action = "<cmd>lua vim.lsp.buf.format()<cr>";
        options = {
          silent = true;
          desc = "Format";
        };
      }
    ];
  };
}
