{ lib, ... }:
{

  imports = [
    ../../common/theming.nix
  ];

  hostPrefs = {
    mainUser = "trivaris";
    bluetooth.enable = true;
    nmApplet.enable = true;
    printing.enable = true;
    steam.enable = true;
    kdeConnect.enable = true;
    jtegranx.enable = true;
    mountSteamdeck = true;
    sunshine.enable = false;
    spicetify.enable = true;
    enableDevStuffs = true;

    moondeck = {
      enable = false;
      openFirewall = true;
    };

    openssh = {
      enable = true;
      ports = [ 23232 ];
    };

    ipsecClient = {
      enable = false;
      domain = "vpn.trivaris.org";
      id = "other";
      cert = ../../resources/ipsecCerts/other-cert.pem;
      caCert = ../../resources/ipsecCerts/ca-cert.pem;
    };
  };
}
