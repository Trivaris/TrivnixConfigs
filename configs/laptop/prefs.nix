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
  ipsec = {
    enable = true;
    asClient = true;
    domain = "vpn.trivaris.org";
    clientCert = lib.mkStorePath "resources/ipsecCerts/laptop-cert.pem";
    clientId = "laptop";
  };
}
