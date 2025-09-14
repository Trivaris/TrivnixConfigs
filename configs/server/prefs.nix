{ common, ... }:
{
  inherit (common) stylix;
  openssh.enable = true;
  autoUpgrade.enable = true;

  reverseProxy = {
    enable = true;
    email = "cloudflare@tripple.lurdane.de";
    zone = "trivaris.org";
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

  emailServer = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "mail.trivaris.org";
    };
  };

  suwayomi = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "manga.trivaris.org";
    };
  };

  forgejo = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "git.trivaris.org";
    };
  };
}
