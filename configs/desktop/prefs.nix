{ pkgs, ... }:
{
  imports = [
    ../../common/theming.nix
    ../../common/wireguard.nix
  ];

  services.flatpak.enable = true;
  environment.systemPackages = [ pkgs.mpv pkgs.qml-language-server ];

  hostPrefs = {
    mainUser = "trivaris";
    nmApplet.enable = true;
    steam.enable = true;

    openssh = {
      enable = true;
      ports = [ 23232 ];
    };
  };
}
