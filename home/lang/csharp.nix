{ flake, pkgs, ... }:
{
  home.packages = with pkgs; [ dotnet-sdk_8 ];

  programs.neovim = {
    craigf.treesitterParsers = [ "c_sharp" ];

    extraConfig =
      let
        extensions = [ "cs" ];
      in
      ''
        ${flake.lib.neovim.fileOpenCommand extensions "setlocal noexpandtab"}
        ${flake.lib.neovim.preSaveCommand extensions "lua vim.lsp.buf.format({timeout_ms=1000})"}
      '';

    initLua = ''
      vim.lsp.config('roslyn_ls', {})
      vim.lsp.enable('roslyn_ls')
    '';

    extraPackages = with pkgs; [ roslyn-ls ];
  };
}
