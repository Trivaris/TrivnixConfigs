common: {
  inherit (common) stylix;
  bluetooth.enable = true;
  openssh.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  kdeConnect.enable = true;
  desktopEnvironment.name = "hyprland";
  displayManager = "autologin";
  autologin.user = "trivaris";
  
  hyprland.monitor = [
    "HDMI-A-1,1920x1080@60,0x840,1"
    "DP-2,2560x1440@74.97,1920x480,1"
    "DP-1,1920x1200@59.95,4480x0,1,transform,1"
  ];

  sunshine = {
    enable = true;
    reverseProxy.domain = "sunshine.trivaris.org";
  };
}
