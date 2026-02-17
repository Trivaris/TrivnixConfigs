{ lib, ... }:
{
  hostInfos = {
    name = "trivlaptop";
    configname = "laptop";
    stateVersion = "25.05";
    ip = "192.168.178.3";
    architecture = "x86_64-linux";
    hashedRootPassword = "$y$j9T$8F3.B8RZQR714UuB45yEH.$9hYpLjzuz5I85nIZ/8d2n58i8Q3qXhiESOWV.3wSPD0";
    primaryMonitor = "eDP-1";
    monitors = {
      "eDP-1" = {
        resolution = "1920x1080";
        refreshRate = "60";
        position = "0x0";
        scaling = "1";
        workspaceIndex = 0;
        wallpaper = ../../resources/wallpapers/cat_anime-skull.jpg;
      };
      "DP-3" = {
        resolution = "1920x1080";
        refreshRate = "60";
        position = "1920x0";
        scaling = "1";
        workspaceIndex = 1;
        wallpaper = ../../resources/wallpapers/cat_anime-skull.jpg;
      };
      "DP-4" = {
        resolution = "1920x1200";
        refreshRate = "59.95";
        position = "3840x0";
        scaling = "1";
        workspaceIndex = 2;
        wallpaper = ../../resources/wallpapers/cat_anime-skull.jpg;
      };
    };
  };
}
