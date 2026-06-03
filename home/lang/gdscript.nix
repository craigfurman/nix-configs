{ pkgs, ... }:
{
  programs.neovim = {
    craigf.treesitterParsers = [ "gdscript" ];

    initLua = ''
      vim.lsp.enable('gdscript')
      make_format_autocmd("*.gd", {"gdscript-formatter"})
    '';

    extraPackages = [ pkgs.gdscript-formatter ];
  };
}
