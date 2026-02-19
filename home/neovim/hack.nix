{ lib, ... }:
{
  # This still comes before plugin config. I'm not sure why. Might have to fix
  # that one day.
  programs.neovim.initLua = lib.mkAfter ''
    local extraConfig = os.getenv("NVIM_EXTRA_CONFIG")
    if extraConfig ~= nil then
      dofile(extraConfig)
    end

    require('hack');
  '';
}
