{ common, ... }:
{
  inherit (common.host) stylix;
  displayManager = "gdm";
  ignoreLidShut = true;
  bluetooth.enable = true;
  openssh.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  kdeConnect.enable = true;
  thunderbird.enable = true;
  language.keyMap = "de";
}
