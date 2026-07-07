{
  homebrew = {
    enable = true;

    casks =
      let
        casks = [
          # casks that auto-update, and therefore don't need to be brew-upgraded
          # once installed
          # "brave-browser" # TODO uncomment on a fresh machine
          "blackhole-2ch"
          "discord"
          "google-chrome"
          "nestopia"
          "obsidian"
          "rectangle"
          "signal"
          "slack"
          "steam"
          "visual-studio-code"
          "vlc"
          "whatsapp"
          "zoom"
        ];
      in
      map (cask: { name = cask; }) casks;

    onActivation = {
      cleanup = "zap";
    };
  };

}
