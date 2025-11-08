{ common, lib, ... }:
{
  inherit (common.host) stylix;
  displayManager = "gdm";
  ignoreLidShut = true;
  enableFingerPrintAuth = true;
  cli.enable = true;
  bluetooth.enable = true;
  nmApplet.enable = true;
  printing.enable = true;
  steam.enable = true;
  kdeConnect.enable = true;
  language.keyMap = "de";
  openssh.enable = true;

  ipsecClient = {
    enable = true;
    domain = "vpn.trivaris.org";
    id = "laptop";
    cert = lib.mkStorePath "resources/ipsecCerts/laptop-cert.pem";
    caCert = lib.mkStorePath "resources/ipsecCerts/ca-cert.pem";
  };
}
