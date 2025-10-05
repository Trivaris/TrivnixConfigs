{ common, ... }:
{
  inherit (common.host) stylix;
  displayManager = "autologin";
  mainUser = "trivaris";
  bluetooth.enable = true;
  nmApplet.enable = true;
  openssh.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  kdeConnect.enable = true;
}
