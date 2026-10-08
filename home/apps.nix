{ lib, pkgs, ... }:
lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
  targets.darwin.linkApps.enable = false;
  targets.darwin.copyApps.enable = true;
}
