{ common, lib, ... }:
{
  inherit (common.host) stylix;
  displayManager = "autologin";
  mainUser = "trivaris";
  bluetooth.enable = true;
  nmApplet.enable = true;
  printing.enable = true;
  steam.enable = true;
  kdeConnect.enable = true;
  jtegranx.enable = true;

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
