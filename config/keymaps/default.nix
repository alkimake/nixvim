{
  keymaps =
    (import ./diagnostics.nix)
    ++ (import ./splits.nix)
    ++ (import ./standard.nix)
    ++ (import ./tabs.nix)
    ++ (import ./terminal.nix)
    ++ (import ./ui.nix)
    ++ (import ./utils.nix);
}
