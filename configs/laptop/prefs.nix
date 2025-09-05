common: {
  inherit (common) displayManager desktopEnvironment;
  bluetooth.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;
  kdeConnect.enable = true;
  language.keyMap = "de";
}
