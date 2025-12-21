{ common, lib, ... }:
{
  inherit (common.host) stylix;
  displayManager = "autologin";
  mainUser = "trivaris";
  ignoreLidShut = true;
  enableFingerPrintAuth = true;
  bluetooth.enable = true;
  nmApplet.enable = true;
  printing.enable = true;
  steam.enable = true;
  kdeConnect.enable = true;
  language.keyMap = "de";
  openssh.enable = true;

  ipsecClient = {
    enable = false;
    domain = "vpn.trivaris.org";
    id = "laptop";
    cert = lib.mkStorePath "resources/ipsecCerts/laptop-cert.pem";
    caCert = lib.mkStorePath "resources/ipsecCerts/ca-cert.pem";
  };
}
