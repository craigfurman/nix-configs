final: prev: {
  # https://github.com/NixOS/nixpkgs/issues/541911
  odin = prev.odin.override { llvmPackages_18 = final.llvmPackages_22; };
}
