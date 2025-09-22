{ common, ... }:
{
  inherit (common.host) stylix;
  bluetooth.enable = true;
  openssh.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  kdeConnect.enable = true;
  displayManager = "autologin";
  mainUser = "trivaris";
}
