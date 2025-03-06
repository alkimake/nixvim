{pkgs, ...}: {
  opts = {
    enable = true;
    settings = {
      delve = {
        path = "${pkgs.delve}/bin/dlv";
      };
    };
  };
}
