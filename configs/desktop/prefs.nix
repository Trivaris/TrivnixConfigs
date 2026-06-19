{ ... }:
{

  imports = [
    ../../common/theming.nix
    ../../common/dns.nix
  ];

  services.flatpak.enable = true;

  hostPrefs = {
    mainUser = "trivaris";
    bluetooth.enable = true;
    nmApplet.enable = true;
    printing.enable = true;
    steam.enable = true;
    kdeConnect.enable = true;
    jtegranx.enable = true;
    sunshine.enable = false;
    spotify.enable = true;

    moondeck = {
      enable = false;
      openFirewall = true;
    };

    openssh = {
      enable = true;
      ports = [ 23232 ];
    };

    homeAssistant = {
      enable = true;
    };

  };
}
