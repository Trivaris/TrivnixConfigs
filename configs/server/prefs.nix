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

  forgejo = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "git.trivaris.org";
    };
  };

  mailserver = {
    enable = true;
    enableIpV6 = true;
    ipV6Address = "2a01:4f8:c012:5e87::1";
    ipV6Interface = "enp1s0";
    baseDomain = "trivaris.org";
    domain = "mail.trivaris.org";
    providerName = "Trivaris Mail";
  };

  vaultwarden = {
    enable = true;
    reverseProxy = {
      enable = true;
      domain = "vault.trivaris.org";
    };
  };
}
