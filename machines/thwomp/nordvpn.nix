{
  networking.firewall = {
    enable = true;
    checkReversePath = "loose";
  };

  services.nordvpn = {
    enable = true;
  };

  users.users.craig.extraGroups = [ "nordvpn" ];
}
