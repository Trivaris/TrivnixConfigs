common:
{
  openssh.enable = true;

  reverseProxy = {
    enable = true;
    email = "cloudflare@tripple.lurdane.de";
    zone = "trivaris.org";
    ddnsTime = "04:15";
  };

  vaultwarden = {
    enable = true;
    domain = "vault.trivaris.org";
  };

  nextcloud = {
    enable = true;
    domain = "cloud.trivaris.org";
  };

  codeServer = {
    enable = true;
    domain = "code.trivaris.org";
  };

  suwayomi = {
    enable = true;
    domain = "manga.trivaris.org";
  };

  inherit (common) stylix;
}