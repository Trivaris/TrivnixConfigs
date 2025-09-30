{ common, ... }:
{
  inherit (common.host) stylix;
  ignoreLidShut = true;
  bluetooth.enable = true;
  openssh.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  kdeConnect.enable = true;
  language.keyMap = "de";
  displayManager = "gdm";
}
