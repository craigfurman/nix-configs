{ pkgs, ... }:
{
  programs.neovim.plugins = [ pkgs.vimPlugins.vim-kitty-navigator ];

  programs.kitty = {
    extraConfig = ''
      map --when-focus-on var:IS_VIM=true ctrl+h
      map --when-focus-on var:IS_VIM=true ctrl+j
      map --when-focus-on var:IS_VIM=true ctrl+k
      map --when-focus-on var:IS_VIM=true ctrl+l

      map --when-focus-on var:IS_VIM=true alt+down
      map --when-focus-on var:IS_VIM=true alt+up
      map --when-focus-on var:IS_VIM=true alt+left
      map --when-focus-on var:IS_VIM=true alt+right
    '';

    keybindings = {
      "alt+down" = "neighboring_window down";
      "alt+up" = "neighboring_window up";
      "alt+left" = "neighboring_window left";
      "alt+right" = "neighboring_window right";
    };

    settings = {
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/mykitty";
    };
  };

  programs.neovim.initLua = ''
    nmap('<A-down>', ':KittyNavigateDown<CR>')
    nmap('<A-up>', ':KittyNavigateUp<CR>')
    nmap('<A-left>', ':KittyNavigateLeft<CR>')
    nmap('<A-right>', ':KittyNavigateRight<CR>')
  '';
}
