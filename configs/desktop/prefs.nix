common: {
  inherit (common) displayManager stylix;
  bluetooth.enable = true;
  openssh.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  kdeConnect.enable = true;
  desktopEnvironment = "hyprland";

  sunshine = {
    enable = true;
    reverseProxy.domain = "sunshine.trivaris.org";
  };
}
