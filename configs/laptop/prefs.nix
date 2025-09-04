common: {
  bluetooth.enable = true;
  printing.enable = true;
  steam.enable = true;
  wireguard.enable = true;

  language = {
    keyMap = "de";
  };

  inherit (common)
    stylix
    displayManager
    desktopEnvironment
    ;
}
