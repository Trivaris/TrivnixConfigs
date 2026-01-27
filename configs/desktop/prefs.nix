{ common, lib, ... }:
{
  displayManager = "autologin";
  mainUser = "trivaris";
  bluetooth.enable = true;
  nmApplet.enable = true;
  printing.enable = true;
  steam.enable = true;
  kdeConnect.enable = true;
  jtegranx.enable = true;
  mountSteamdeck = true;
  sunshine.enable = false;

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
    cert = lib.mkStorePath "resources/ipsecCerts/other-cert.pem";
    caCert = lib.mkStorePath "resources/ipsecCerts/ca-cert.pem";
  };
}
