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
    reverseProxy.domain = "vault.trivaris.org";
  };

  nextcloud = {
    enable = true;
    reverseProxy.domain = "cloud.trivaris.org";
  };

  codeServer = {
    enable = true;
    reverseProxy.domain = "code.trivaris.org";
  };

  suwayomi = {
    enable = true;
    reverseProxy.domain = "manga.trivaris.org";
  };

  inherit (common) stylix;
}