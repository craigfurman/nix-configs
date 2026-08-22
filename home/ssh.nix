{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    extraOptionOverrides =
      let
        systemOptions =
          if pkgs.stdenv.hostPlatform.isDarwin then
            {
              UseKeychain = "yes";
            }
          else
            { };
      in
      {
        AddKeysToAgent = "yes";
        StrictHostKeyChecking = "accept-new";
      }
      // systemOptions;
  };
}
