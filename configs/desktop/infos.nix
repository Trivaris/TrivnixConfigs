{ ... }:
{
  hostInfos = {
    name = "trivdesktop";
    configname = "desktop";
    stateVersion = "25.05";
    ip = "192.168.178.2";
    architecture = "x86_64-linux";
    hashedRootPassword = "$y$j9T$R.NIp2RpQQOwy48wQU19n1$wHb/Nub4Bt1yCtrMEWe3iLSBx1WvfnncRq95AqFBKh3";
    primaryMonitor = "DP-2";
    monitors = {
      "HDMI-A-1" = {
        resolution = "1920x1080";
        refreshRate = "60";
        position = "0x840";
        scaling = "1";
        workspaceIndex = 1;
        wallpaper = ../../resources/wallpapers/cat_anime-skull.jpg;
      };

      "DP-2" = {
        resolution = "2560x1440";
        refreshRate = "74.97";
        position = "1920x480";
        scaling = "1";
        workspaceIndex = 0;
        wallpaper = ../../resources/wallpapers/cat_anime-skull.jpg;
      };
    };
  };
}
