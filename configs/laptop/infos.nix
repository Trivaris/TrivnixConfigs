{ lib, ... }:
{
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
      wallpaper = lib.mkStorePath "resources/wallpapers/miku_2.jpeg";
    };
  };
}
