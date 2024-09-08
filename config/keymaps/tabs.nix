# Navigate tabs
[
  {
    mode = "n";
    key = "]t";
    options.desc = "Next tab";

    action.__raw = ''
      function()
        vim.cmd.tabnext()
      end
    '';
  }
  {
    mode = "n";
    key = "[t";
    options.desc = "Previous tab";

    action.__raw = ''
      function()
        vim.cmd.tabprevious()
      end
    '';
  }
]
