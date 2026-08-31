{
  description = "CHANGEME";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, self, ... }:
    let
      forAllSystems =
        systemFn:
        let
          lib = nixpkgs.lib;

          forSystem =
            system: systemFn:
            let
              overlay = final: prev: {
              };
              pkgs = import nixpkgs {
                inherit system;
                overlays = [ overlay ];
              };
            in
            systemFn {
              inherit pkgs system;
            };

          systems = [
            "aarch64-darwin"
            "aarch64-linux"
            "x86_64-darwin"
            "x86_64-linux"
          ];
        in
        lib.genAttrs systems (system: forSystem system systemFn);
    in
    {
      packages = forAllSystems (
        { pkgs, ... }: {
          default = pkgs.callPackage ./default.nix { };
        }
      );

      devShells = forAllSystems (
        { pkgs, ... }: {
          default = pkgs.callPackage ./shell.nix { };
        }
      );

      formatter = forAllSystems ({ pkgs, ... }: pkgs.nixfmt);
    };
}
