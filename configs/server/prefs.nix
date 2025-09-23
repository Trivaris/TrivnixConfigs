{ common, ... }:
{
  inherit (common.host) stylix;
  openssh.enable = true;
  autoUpgrade.enable = true;

  reverseProxy = {
    enable = true;
    email = "cloudflare@tripple.lurdane.de";
    zone = "trivaris.org";
  };

  forgejo = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "git.trivaris.org";
    };
  };

  vaultwarden = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "vault.trivaris.org";
    };
  };

  homepage = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "home.trivaris.org";
    };

    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/";
          memory = true;
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];
  };

  mailserver = {
    enable = true;
    enableIpV6 = true;
    ipV6Address = "2a01:4f8:c012:5e87::1";
    ipV6Interface = "enp1s0";
    baseDomain = "trivaris.org";
    domain = "mail.trivaris.org";
    providerName = "Trivaris Mail";
    loginAccounts."mail@trivaris.org" = {
      name = "mail@trivaris.org";
      hashedPassword = "$2b$05$7p74qoLRa2R09CJwkkL8MeKqM3oOfC4rgb0R.K1jQlO2TWpj9E3Fe";
      aliases = [
        "@mail.trivaris.org"
        "@trivaris.org"
      ];
    };
  };
}
