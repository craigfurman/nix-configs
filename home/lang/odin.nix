{ flake, ... }:
{
  programs.neovim = {
    craigf.treesitterParsers = [ "odin" ];

    extraConfig = ''
      ${flake.lib.neovim.fileOpenCommand [ "odin" ] "setlocal noexpandtab"}
      ${flake.lib.neovim.preSaveCommand [ "odin" ] "lua vim.lsp.buf.format()"}
    '';

    initLua = ''
      vim.lsp.enable('ols')
    '';
  };
}
