{ pkgs, ... }: {
  opts = {
    enable = true;
    settings = {
      notifyOnError = true;
      formattersByFt = {
        html = [["prettierd" "prettier"]];
        css = [["prettierd" "prettier"]];
        javascript = [["prettierd" "prettier"]];
        javascriptreact = [["prettierd" "prettier"]];
        typescript = [["prettierd" "prettier"]];
        typescriptreact = [["prettierd" "prettier"]];
        tf = ["tofu_fmt"];
        terraform = ["tofu_fmt"];
        python = ["black"];
        lua = ["stylua"];
        nix = ["alejandra"];
        markdown = [["prettierd" "prettier"]];
        yaml = ["yamllint" "yamlfmt"];
      };
      formatters = {
        tofu_fmt = {
          command = "${pkgs.opentofu}/bin/tofu fmt";
        };
      };
    };
  };
  extra = {
    packages = with pkgs; [
      opentofu
    ];
  };
}
