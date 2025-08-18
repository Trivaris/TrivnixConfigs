common:
{
  openssh.enable = true;

  reverseProxy = {
    enable = true;
    email = "cloudflare@tripple.lurdane.de";
    zone = "trivaris.org";
    enableDDClient = true;
    ddnsTime = "04:15";
  };

  vaultwarden = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "vault.trivaris.org";
    };
  };

  nextcloud = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "cloud.trivaris.org";
    };
  };

  codeServer = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "code.trivaris.org";
    };
  };

  suwayomi = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "manga.trivaris.org";
    };
  };

  inherit (common) stylix;
}