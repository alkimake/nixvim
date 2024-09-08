{pkgs, ...}: {
  opts = {
    enable = true;
  };
  extra = {
    packages = [pkgs.lazygit];
    config = ''
      require("telescope").load_extension("lazygit")
    '';
  };
  rootOpts = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "LazyGit (root dir)";
        };
      }
    ];
  };
}
