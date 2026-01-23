[
  {
    mode = "n";
    key = "<leader>gp";
    action = "<cmd>r!pwgen -nycv 16<CR>";
    options.silent = true;
    options.desc = "Generate password using pwgen";
  }
  {
    mode = "n";
    key = "<leader>gP";
    action = ''
      function()
        vim.ui.input(
          {prompt = "Password length: "},
          function(length)
            if length then
              vim.cmd('r!pwgen -nycv ' .. length)
            end
          end
        )
      end
    '';
    options.silent = true;
    options.desc = "Generate password (custom length)";
  }
]
