{ common, lib, ... }:
{
  inherit (common.host) stylix;
  displayManager = "autologin";
  mainUser = "trivaris";
  bluetooth.enable = true;
  nmApplet.enable = true;
  openssh.enable = true;
  printing.enable = true;
  steam.enable = true;
  kdeConnect.enable = true;
  ipsecClient = {
    enable = true;
    domain = "vpn.trivaris.org";
    id = "other";
    cert = lib.mkStorePath "resources/ipsecCerts/other-cert.pem";
    caCert = lib.mkStorePath "resources/ipsecCerts/ca-cert.pem";
  };
}
