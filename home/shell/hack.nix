{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.file.".zshrc_hack".source =
    let
      flakeName = if pkgs.stdenv.hostPlatform.isDarwin then "nix-darwin" else "nixos";
    in
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/${flakeName}/home/shell/hack.zsh";

  programs.zsh.initContent = lib.mkAfter "source ~/.zshrc_hack";
}
