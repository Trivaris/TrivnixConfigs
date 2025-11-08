{ common, lib, ... }:
{
  inherit (common.host) stylix;
  displayManager = "autologin";
  mainUser = "trivaris";
  cli.enable = true;
  bluetooth.enable = true;
  nmApplet.enable = true;
  printing.enable = true;
  steam.enable = true;
  kdeConnect.enable = true;

  openssh = {
    enable = true;
    ports = [ 23232 ];
  };

  ipsecClient = {
    enable = true;
    domain = "vpn.trivaris.org";
    id = "other";
    cert = lib.mkStorePath "resources/ipsecCerts/other-cert.pem";
    caCert = lib.mkStorePath "resources/ipsecCerts/ca-cert.pem";
  };
}
