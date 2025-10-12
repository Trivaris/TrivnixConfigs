{ common, ... }:
{
  inherit (common.host) stylix;
  displayManager = "gdm";
  ignoreLidShut = true;
  enableFingerPrintAuth = true;
  bluetooth.enable = true;
  nmApplet.enable = true;
  openssh.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  kdeConnect.enable = true;
  language.keyMap = "de";
}
