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
  ipsec = {
    enable = true;
    asClient = true;
    domain = "vpn.trivaris.org";
    clientCert = lib.mkStorePath "resources/ipsecCerts/other-cert.pem";
    clientId = "other";
  };
}
