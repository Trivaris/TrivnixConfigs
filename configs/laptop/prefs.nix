{ common, lib, ... }:
{
  displayManager = "autologin";
  mainUser = "trivaris";
  enableFingerPrintAuth = true;
  bluetooth.enable = true;
  nmApplet.enable = true;
  printing.enable = true;
  steam.enable = true;
  kdeConnect.enable = true;
  openssh.enable = true;
  jtegranx.enable = true;

  openconnectClient = {
    enable = true;
    user = "tj93wefe";
    gateway = "vpn.hrz.tu-darmstadt.de";
    cafile = lib.mkStorePath "resources/openconnectCerts/rootcert-tuda.crt";
    authgroup = "campus";
  };

  ipsecClient = {
    enable = false;
    domain = "vpn.trivaris.org";
    id = "laptop";
    cert = lib.mkStorePath "resources/ipsecCerts/laptop-cert.pem";
    caCert = lib.mkStorePath "resources/ipsecCerts/ca-cert.pem";
  };
}
