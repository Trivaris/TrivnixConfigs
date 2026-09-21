{ pkgs, ... }:
{
  imports = [
    ../../common/theming.nix
    ../../common/wireguard.nix
    # ../../common/dns.nix
  ];

  services.flatpak.enable = true;
  environment.systemPackages = [ pkgs.mpv pkgs.qml-language-server ];

  hostPrefs = {
    mainUser = "trivaris";
    bluetooth.enable = true;
    nmApplet.enable = true;
    steam.enable = true;
    jtegranx.enable = true;

    openssh = {
      enable = true;
      ports = [ 23232 ];
    };
  };
}
