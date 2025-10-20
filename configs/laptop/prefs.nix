{ common, lib, ... }:
{
  inherit (common.host) stylix;
  displayManager = "gdm";
  ignoreLidShut = true;
  enableFingerPrintAuth = true;
  bluetooth.enable = true;
  nmApplet.enable = true;
  openssh.enable = true;
  printing.enable = true;
  steam.enable = true;
  kdeConnect.enable = true;
  language.keyMap = "de";

  grub = {
    enable = true;
    splash = lib.mkStorePath "resources/icons/nixowos.png";
  };

  ipsecClient = {
    enable = true;
    domain = "vpn.trivaris.org";
    id = "laptop";
    cert = lib.mkStorePath "resources/ipsecCerts/laptop-cert.pem";
    caCert = lib.mkStorePath "resources/ipsecCerts/ca-cert.pem";
  };
}
