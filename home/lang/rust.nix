{ flake, pkgs, ... }:
{
  programs.neovim = {
    craigf.treesitterParsers = [ "rust" ];

    extraConfig = ''
      ${flake.lib.neovim.preSaveCommand [ "rs" ] "lua vim.lsp.buf.format({timeout_ms=1000})"}
    '';

    initLua = ''
      vim.lsp.enable('rust_analyzer')
    '';

    extraPackages = with pkgs; [
      rust-analyzer
      rustfmt
    ];
  };
}
