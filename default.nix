_:

{
  imports = [
    ./config
    ./plugins
    ./utils
  ];

  config = {
    # Use <Space> as leader key
    globals.mapleader = " ";

    # Set 'vi' and 'vim' aliases to nixvim
    viAlias = true;
    vimAlias = true;

    # Setup clipboard support
    clipboard = {
      # TODO: Make this option as input can be set
      # Use wl-copy as clipboard provider
      providers.wl-copy.enable = true;

      # Sync system clipboard
      register = "unnamedplus";
    };
  };
}
