common: {
  inherit (common)stylix;
  bluetooth.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  kdeConnect.enable = true;
  language.keyMap = "de";
  displayManager = "gdm";
  desktopEnvironment.name = "kde";
}
