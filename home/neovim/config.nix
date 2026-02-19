{
  programs.neovim = {
    extraConfig = ''
      " Save on focus lost
      autocmd BufLeave,FocusLost * silent! update
    '';

    initLua = builtins.readFile ./config/config.lua;
  };
}
