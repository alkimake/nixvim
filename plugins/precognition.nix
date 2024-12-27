{pkgs, ...}: {
  opts = {
    enable = true;
  };
  extra = {
    packages = [];
    config =
      # lua
      ''
        require("precognition").setup({
          startVisible = false,
        })
        require("precognition").hide()
      '';
  };
  rootOpts = {
    keymaps = [
      {
        key = "<leader>up";
        action.__raw =
          # lua
          ''
            function()
              require("precognition").toggle()
            end
          '';
        options = {
          desc = "Toggle precognition";
        };
        mode = [
          "n"
        ];
      }
    ];
  };
}
