{ pkgs, ... }:
{
  imports = [
    ../../common/theming.nix
    ../../common/wireguard.nix
  ];

  services.flatpak.enable = true;
  environment.systemPackages = [ pkgs.mpv pkgs.qml-language-server ];
  programs.epic-games-launcher.enable = true;

  hostPrefs = {
    mainUser = "trivaris";
    steam.enable = true;

    openssh = {
      enable = true;
      ports = [ 23232 ];
    };
  };
}
